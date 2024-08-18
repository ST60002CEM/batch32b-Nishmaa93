import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kaamkuro/app/constants/api_endpoint.dart';
import 'package:kaamkuro/core/failure/failure.dart';
import 'package:kaamkuro/core/networking/remote/http_service.dart';
import 'package:kaamkuro/core/shared_prefs/user_shared_prefs.dart';
import 'package:kaamkuro/features/profile/data/model/user_api_model.dart';
import 'package:kaamkuro/features/profile/domain/entity/user_entity.dart';

final userRemoteDataSourceProvider = Provider(
  (ref) => UserRemoteDataSource(
    dio: ref.read(httpServiceProvider),
    authSharedPrefs: ref.read(userSharedPrefsProvider),
  ),
);

class UserRemoteDataSource {
  final Dio dio;
  final UserSharedPrefs authSharedPrefs;

  UserRemoteDataSource({required this.dio, required this.authSharedPrefs});

  Future<Either<Failure, bool>> editUser(UserEntity user) async {
    try {
      // Get the token from shared prefs
      String? token;
      var data = await authSharedPrefs.getUserToken();
      data.fold(
        (l) => token = null,
        (r) => token = r!,
      );
      Response response = await dio.patch(
        ApiEndpoints.editUser,
        data: {"name": user.name, "phone": user.phone},
        options: Options(headers: {
          'Authorization': 'Bearer $token',
        }),
      );

      if (response.statusCode == 200) {
        return const Right(true);
      } else {
        // Check response data type before accessing
        final responseData = response.data as Map<String, dynamic>?;
        final errorMessage =
            responseData?["data"]?['message'] ?? 'Unknown error';
        return Left(
          Failure(
            error: errorMessage,
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } on DioException catch (e) {
      return Left(
        Failure(
          error: e.error.toString(),
          statusCode: e.response?.statusCode.toString() ?? '0',
        ),
      );
    }
  }

  Future<Either<Failure, bool>> changePassword(
      String oldPassword, String newPassword) async {
    try {
      // Get the token from shared prefs
      String? token;
      var data = await authSharedPrefs.getUserToken();
      data.fold(
        (l) => token = null,
        (r) => token = r!,
      );

      Response response = await dio.patch(
        ApiEndpoints.changePassword,
        data: {
          "oldPassword": oldPassword,
          "newPassword": newPassword,
        },
        options: Options(headers: {
          'Authorization': 'Bearer $token',
        }),
      );
      if (response.statusCode == 200) {
        return const Right(true);
      } else {
        return Left(
          Failure(
            error: response.data["data"]['message'],
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } on DioException catch (e) {
      return Left(
        Failure(
          error: e.error.toString(),
          statusCode: e.response?.statusCode.toString() ?? '0',
        ),
      );
    }
  }

  // Upload image using multipart
  Future<Either<Failure, bool>> uploadProfilePicture(
    File image,
  ) async {
    try {
      // Get the token from shared prefs
      String? token;
      var data = await authSharedPrefs.getUserToken();
      data.fold(
        (l) => token = null,
        (r) => token = r!,
      );
      // Extract name from path
      // c:/user/username/pictures/image.png
      String fileName = image.path.split('/').last;

      FormData formData = FormData.fromMap(
        {
          'image': await MultipartFile.fromFile(
            image.path,
            filename: fileName,
          ),
        },
      );

      Response response = await dio.patch(
        ApiEndpoints.uploadImage,
        data: formData,
        options: Options(headers: {
          'Authorization': 'Bearer $token',
        }),
      );

      return const Right(true);
    } on DioException catch (e) {
      return Left(
        Failure(
          error: e.error.toString(),
          statusCode: e.response?.statusCode.toString() ?? '0',
        ),
      );
    }
  }

  Future<Either<Failure, UserEntity>> getCurrentUser() async {
    try {
      // Get the token from shared prefs
      String? token;
      var data = await authSharedPrefs.getUserToken();
      data.fold(
        (l) => token = null,
        (r) => token = r!,
      );

      var response = await dio.get(
        ApiEndpoints.getUser,
        options: Options(headers: {
          'Authorization': 'Bearer $token',
        }),
      );

      if (response.statusCode == 200) {
        UserApiModel user = UserApiModel.fromJson(response.data);
        // User Properties on shared prefs
        // String? storedUser;
        // var data = await authSharedPrefs.getUser();
        // data.fold(
        //       (l) => storedUser = null,
        //       (r) => storedUser = r!,
        // );
        // if(storedUser == null) {
        //   AuthEntity user = response.data["data"]["userObject"];
        //   await authSharedPrefs.setUser(user);
        // }
        return Right(user.toEntity());
      } else {
        return Left(
          Failure(
            error: response.data["message"],
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } on DioException catch (e) {
      return Left(
        Failure(
          error: e.error.toString(),
          statusCode: e.response?.statusCode.toString() ?? '0',
        ),
      );
    }
  }
}
