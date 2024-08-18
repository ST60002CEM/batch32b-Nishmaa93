import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kaamkuro/core/failure/failure.dart';
import 'package:kaamkuro/features/profile/domain/entity/user_entity.dart';
import 'package:kaamkuro/features/profile/domain/repository/user_repository.dart';

final userUsecaseProvider = Provider<UserUseCase>(
  (ref) => UserUseCase(
    userRepository: ref.read(userRepositoryProvider),
  ),
);

class UserUseCase {
  final IUserRepository userRepository;

  UserUseCase({required this.userRepository});

  Future<Either<Failure, UserEntity>> getUser() {
    return userRepository.getUser();
  }

  Future<Either<Failure, bool>> editUser(UserEntity user) {
    return userRepository.editUser(user);
  }

  Future<Either<Failure, bool>> changePassword(
      String oldPassword, String newPassword) {
    return userRepository.changePassword(oldPassword, newPassword);
  }

  Future<Either<Failure, bool>> updateProfilePicture(File file) {
    return userRepository.updateProfilePicture(file);
  }
}
