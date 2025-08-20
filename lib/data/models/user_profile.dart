import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_profile.g.dart';

@JsonSerializable()
class UserProfile extends Equatable {
  const UserProfile({
    required this.uid,
    required this.email,
    required this.providers,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);

  final String uid;
  final String email;
  final List<String> providers;

  Map<String, dynamic> toJson() => _$UserProfileToJson(this);

  UserProfile copyWith({
    String? uid,
    String? email,
    List<String>? providers,
  }) =>
      UserProfile(
        uid: uid ?? this.uid,
        email: email ?? this.email,
        providers: providers ?? this.providers,
      );

  @override
  List<Object?> get props => [uid, email, providers];
}
