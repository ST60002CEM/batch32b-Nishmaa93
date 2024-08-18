import 'package:kaamkuro/features/profile/domain/entity/user_entity.dart';

class UserState {
  final bool isLoading;
  final UserEntity? userEntity;
  final String? error;
  final String? imageName;

  UserState(
      {required this.isLoading,
      required this.userEntity,
      this.error,
      this.imageName});

  factory UserState.initial() {
    return UserState(
        isLoading: false, userEntity: null, error: null, imageName: null);
  }

  UserState copyWith(
      {bool? isLoading,
      UserEntity? userEntity,
      String? error,
      String? imageName}) {
    return UserState(
        isLoading: isLoading ?? this.isLoading,
        userEntity: userEntity ?? this.userEntity,
        error: error ?? this.error,
        imageName: imageName ?? this.imageName);
  }

  @override
  String toString() => 'UserState(isLoading: $isLoading, error: $error)';
}
