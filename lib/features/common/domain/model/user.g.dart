// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      phone: json['phone'] as String? ?? '',
      phoneNumber: json['phone_number'] as String? ?? '',
      region: json['region'] as int? ?? 0,
      email: json['email'] as String? ?? '',
      image: json['image'] as String? ?? '',
      firstName: json['first_name'] as String? ?? '',
      id: json['id'] as int? ?? 0,
      lastName: json['last_name'] as String? ?? '',
      fullName: json['full_name'] as String? ?? '',
      userName: json['username'] as String? ?? '',
      isReadAllNotifications:
          json['is_read_all_notifications'] as bool? ?? false,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.userName,
      'last_name': instance.lastName,
      'first_name': instance.firstName,
      'full_name': instance.fullName,
      'phone': instance.phone,
      'email': instance.email,
      'image': instance.image,
      'region': instance.region,
      'phone_number': instance.phoneNumber,
      'is_read_all_notifications': instance.isReadAllNotifications,
    };
