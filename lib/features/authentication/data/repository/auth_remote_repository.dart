// import 'dart:io';

// import 'package:dartz/dartz.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:kaamkuro/core/failure/failure.dart';
// import 'package:kaamkuro/features/authentication/data/data_source/remote/auth_remote_data_source.dart';
// import 'package:kaamkuro/features/authentication/domain/entity/auth_entity.dart';
// import 'package:kaamkuro/features/authentication/domain/repository/auth_repository.dart';


// final authRemoteRepositoryProvider = Provider<IAuthRepository>((ref) {
//   return AuthRemoteRepository(
//     ref.read(authRemoteDataSourceProvider),
//   );
// });


// class AuthRemoteRepository implements IAuthRepository {
//   final AuthRemoteDataSource _authRemoteDataSource;

//   AuthRemoteRepository(this._authRemoteDataSource);

//   @override
//   Future<Either<Failure, bool>> loginStudent(String username, String password) {
//     // TODO: implement loginStudent
//     throw UnimplementedError();
//   }

//   @override
//   Future<Either<Failure, bool>> registerStudent(AuthEntity student) {
//     // TODO: implement registerStudent
//     throw UnimplementedError();
//   }

//   @override
//   Future<Either<Failure, String>> uploadProfilePicture(File file) {
//     // TODO: implement uploadProfilePicture
//     return _authRemoteDataSource.uploadProfilePicture(file);
//   }

// }