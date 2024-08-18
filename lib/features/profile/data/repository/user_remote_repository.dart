import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kaamkuro/core/failure/failure.dart';
import 'package:kaamkuro/features/profile/data/data_source/user_remote_data_source.dart';
import 'package:kaamkuro/features/profile/domain/entity/user_entity.dart';
import 'package:kaamkuro/features/profile/domain/repository/user_repository.dart';

final userRemoteRepositoryProvider = Provider<IUserRepository>(
  (ref) => UserRemoteRepository(
    userRemoteDataSource: ref.read(userRemoteDataSourceProvider),
  ),
);

class UserRemoteRepository implements IUserRepository {
  final UserRemoteDataSource userRemoteDataSource;

  UserRemoteRepository({required this.userRemoteDataSource});

  @override
  Future<Either<Failure, bool>> changePassword(
      String oldPassword, String newPassword) {
    return userRemoteDataSource.changePassword(oldPassword, newPassword);
  }

  @override
  Future<Either<Failure, bool>> editUser(UserEntity user) {
    return userRemoteDataSource.editUser(user);
  }

  @override
  Future<Either<Failure, UserEntity>> getUser() {
    return userRemoteDataSource.getCurrentUser();
  }

  @override
  Future<Either<Failure, bool>> updateProfilePicture(File image) {
    return userRemoteDataSource.uploadProfilePicture(image);
  }
}
