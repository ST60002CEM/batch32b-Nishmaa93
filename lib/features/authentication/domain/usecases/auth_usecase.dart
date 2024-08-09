import 'dart:io';
 
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kaamkuro/core/failure/failure.dart';
import 'package:kaamkuro/features/authentication/domain/entity/auth_entity.dart';
import 'package:kaamkuro/features/authentication/domain/repository/auth_repository.dart';
 
final authUseCaseProvider = Provider((ref) {
  return AuthUseCase(ref.read(authRepositoryProvider));
});
 
class AuthUseCase {
  final IAuthRepository _authRepository;
 
  AuthUseCase(this._authRepository);
 
  // Future<Either<Failure, String>> uploadProfilePicture(File file) async {
  //   return await _authRepository.uploadProfilePicture(file);
  // }
 
  Future<Either<Failure, bool>> register(AuthEntity user) async {
    return await _authRepository.register(user);
  }
 
  Future<Either<Failure, bool>> login(String? email, String? password) async {
    return await _authRepository.login(email?? "", password?? "");
  }
}
 