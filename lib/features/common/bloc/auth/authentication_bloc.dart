import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:Incase/features/common/domain/model/user.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:Incase/core/singletons/storage.dart';
import 'package:Incase/features/common/repositories/auth.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

part 'authentication_event.dart';

part 'authentication_state.dart';

enum AuthenticationStatus {
  authenticated,
  unauthenticated,
  loading,
  cancelLoading
}

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthRepository repository = AuthRepository();
  late StreamSubscription<AuthenticationStatus> statusSubscription;

  AuthenticationBloc() : super(AuthenticationState.unauthenticated()) {
    statusSubscription = repository.authStream.stream.listen((event) {
      add(AuthenticationStatusChanged(status: event));
    });

    on<LoginWithAppLe>((event, emit) async {
      final credential = await SignInWithApple.getAppleIDCredential(
          scopes: [
            AppleIDAuthorizationScopes.email,
            AppleIDAuthorizationScopes.fullName,
          ],
          webAuthenticationOptions: Platform.isAndroid
              ? WebAuthenticationOptions(
              clientId: 'org.uicgroup.avto.uz.client',
              redirectUri: Uri.parse('https://avto.uz/login'))
              : null);

      log(credential.toString());
      log(credential.authorizationCode);
      log(credential.identityToken.toString());
      log(credential.toString());
      emit(AuthenticationState.loading());
      final result = await repository.loginWithApple(
          authToken: credential.identityToken ?? '',
          code: credential.authorizationCode);
      if (result.isRight) {
        add(AuthenticationStatusChanged(
            status: AuthenticationStatus.authenticated));
      } else {
        emit(AuthenticationState.cancelLoading());
      }
    });
    on<LoginWithGoogle>((event, emit) async {
      try {
        final googleResult = await GoogleSignIn(
          scopes: [
            'openid',
            'https://www.googleapis.com/auth/userinfo.profile',
            'https://www.googleapis.com/auth/userinfo.email',
          ],
        ).signIn();
        log('result: ${await googleResult?.authHeaders}');
        await googleResult?.authentication.then((value) async {
          log('value.accessToken: ${value.accessToken}');
          log('value.idToken: ${googleResult.serverAuthCode}');
          emit(AuthenticationState.loading());
          final result = await repository.loginWithGoogle(
              authToken: value.accessToken ?? '',
              code: googleResult.serverAuthCode ?? '');
          if (result.isRight) {
            add(AuthenticationStatusChanged(
                status: AuthenticationStatus.authenticated));
          } else {
            emit(AuthenticationState.cancelLoading());
          }
        });
        // ignore: avoid_catches_without_on_clauses
      } catch (error) {
        log('error: $error');
      }
    });
    on<AuthenticationStatusChanged>((event, emit) async {
      switch (event.status) {
        case AuthenticationStatus.authenticated:
          final userData = await repository.getUser();
          if (userData.isRight) {
            emit(AuthenticationState.authenticated(userData.right));
          } else {
            emit(AuthenticationState.unauthenticated());
          }
          break;
        case AuthenticationStatus.unauthenticated:
          emit(AuthenticationState.unauthenticated());
          break;
        case AuthenticationStatus.loading:
        case AuthenticationStatus.cancelLoading:
          break;
      }
    });

    // on<LoginUser>((event, emit) async {
    //   emit(AuthenticationState.loading());
    //   final result = await repository.login(
    //       login: event.userName, password: event.password);
    //   if (result.isRight) {
    //     add(AuthenticationStatusChanged(
    //         status: AuthenticationStatus.authenticated));
    //   } else {
    //     if (event.onError != null) {
    //       event.onError!((result.left as ServerFailure).errorMessage);
    //     }
    //     emit(AuthenticationState.cancelLoading());
    //   }
    // });

    on<CheckUser>((event, emit) async {
      final hasToken =
          StorageRepository.getString('token', defValue: '').isNotEmpty;
      if (hasToken) {
        final response = await repository.getUser();
        if (response.isRight) {
          add(AuthenticationStatusChanged(
              status: AuthenticationStatus.authenticated));
        } else {
          add(RefreshToken());
        }
      } else {
        add(AuthenticationStatusChanged(
            status: AuthenticationStatus.unauthenticated));
      }
    });
    // on<RefreshToken>((event, emit) async {
    //   final result = await repository.refreshToken();
    //   if (result.isRight) {
    //     add(AuthenticationStatusChanged(
    //         status: AuthenticationStatus.authenticated));
    //   } else {
    //     add(AuthenticationStatusChanged(
    //         status: AuthenticationStatus.unauthenticated));
    //   }
    // });

    on<ChangeNotificationAllRead>(
          (event, emit) {
        // ignore: prefer_final_locals
        var user = state.user;
        // ignore: cascade_invocations
        user.isReadAllNotifications = true;

        emit(state.copyWith(user: user));
      },
    );
  }

  @override
  Future<void> close() {
    statusSubscription.cancel();
    return super.close();
  }
}