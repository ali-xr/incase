import 'dart:async';

import 'package:incase_app/core/exceptions/failures.dart';
import 'package:incase_app/core/singletons/storage.dart';
import 'package:incase_app/core/utils/either.dart';
import 'package:incase_app/features/common/bloc/auth/authentication_bloc.dart';
import 'package:incase_app/features/common/domain/model/token_model.dart';
import 'package:incase_app/features/common/domain/model/user.dart';
import 'package:incase_app/features/common/repositories/global_request_repository.dart';

class AuthRepository {
  final GlobalRequestRepository repo = GlobalRequestRepository();
  final StreamController<AuthenticationStatus> authStream =
  StreamController.broadcast(sync: true);

  Future<Either<Failure, UserModel>> getUser() async {
    final result = await repo.getSingle(
      endpoint: '/users/detail/',
      fromJson: UserModel.fromJson,
    );
    return result;
  }

  // Future<Either<Failure, TokenModel>> login(
  //     {required String login, required String password}) async {
  //   try {
  //     final result = await repo.postAndSingle<TokenModel>(
  //       endpoint: '/users/login/',
  //       fromJson: TokenModel.fromJson,
  //       sendToken: false,
  //       data: {
  //         'phone_number': '+998${login.replaceAll(' ', '')}',
  //         'password': password,
  //       },
  //     );
  //     if (result.isRight) {
  //       await StorageRepository.putString('token', result.right.access);
  //       await StorageRepository.putString('refresh', result.right.refresh);
  //       return Right(result.right);
  //     } else {
  //       return Left(result.left);
  //     }
  //   } on ServerException {
  //     rethrow;
  //   } on DioError {
  //     throw DioException();
  //   } on Exception catch (e) {
  //     throw ParsingException(errorMessage: '$e catch error');
  //   }
  // }

  // Future<Either<Failure, TokenModel>> refreshToken() async {
  //   final result = await repo.postAndSingle(
  //     endpoint: '/auth/token/refresh/',
  //     fromJson: TokenModel.fromJson,
  //     sendToken: false,
  //     data: {
  //       'refresh': StorageRepository.getString('token', defValue: ''),
  //     },
  //   );
  //   if (result.isRight) {
  //     await StorageRepository.putString('token', result.right.access);
  //     await StorageRepository.putString('refresh', result.right.refresh);
  //     return Right(result.right);
  //   } else {
  //     return Left(result.left);
  //   }
  // }

  Future<Either<Failure, TokenModel>> loginWithGoogle(
      {required String authToken, required String code}) async {
    final result = await repo.postAndSingle<TokenModel>(
      endpoint: 'users/social-auth/login/google/',
      fromJson: TokenModel.fromJson,
      sendToken: false,
      data: {'access_token': authToken, 'code': code},
    );
    if (result.isRight) {
      await StorageRepository.putString('token', result.right.access);
      await StorageRepository.putString('refresh', result.right.refresh);
      return Right(result.right);
    } else {
      return Left(result.left);
    }
  }

  Future<Either<Failure, TokenModel>> loginWithFacebook(
      {required String authToken, required String code}) async {
    final result = await repo.postAndSingle<TokenModel>(
      endpoint: 'users/social-auth/login/facebook/',
      fromJson: TokenModel.fromJson,
      sendToken: false,
      data: {'access_token': authToken, 'code': ''},
    );
    if (result.isRight) {
      await StorageRepository.putString('token', result.right.access);
      await StorageRepository.putString('refresh', result.right.refresh);
      return Right(result.right);
    } else {
      return Left(result.left);
    }
  }

  Future<Either<Failure, TokenModel>> loginWithApple(
      {required String authToken, required String code}) async {
    final result = await repo.postAndSingle<TokenModel>(
      endpoint: 'users/social-auth/login/apple/',
      fromJson: TokenModel.fromJson,
      sendToken: false,
      data: {'access_token': authToken, 'code': code},
    );
    if (result.isRight) {
      await StorageRepository.putString('token', result.right.access);
      await StorageRepository.putString('refresh', result.right.refresh);
      return Right(result.right);
    } else {
      return Left(result.left);
    }
  }
}