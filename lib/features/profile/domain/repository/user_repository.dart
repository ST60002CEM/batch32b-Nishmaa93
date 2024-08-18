import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kaamkuro/core/failure/failure.dart';
import 'package:kaamkuro/features/profile/data/repository/user_remote_repository.dart';
import 'package:kaamkuro/features/profile/domain/entity/user_entity.dart';

// Instead of Local now call Remote repository
final userRepositoryProvider = Provider<IUserRepository>((ref) {
  return ref.read(userRemoteRepositoryProvider
      as ProviderListenable<IUserRepository>); //cast added
});

abstract class IUserRepository {
  Future<Either<Failure, UserEntity>> getUser();
  Future<Either<Failure, bool>> changePassword(
      String oldPassword, String newPassword);
  Future<Either<Failure, bool>> editUser(UserEntity user);
  Future<Either<Failure, bool>> updateProfilePicture(File image);
}
