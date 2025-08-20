part of 'user_profile.dart';

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) => UserProfile(
      uid: json['uid'] as String,
      email: json['email'] as String,
      providers:
          (json['providers'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$UserProfileToJson(UserProfile instance) => <String, dynamic>{
      'uid': instance.uid,
      'email': instance.email,
      'providers': instance.providers,
    };
