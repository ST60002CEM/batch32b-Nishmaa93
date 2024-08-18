import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kaamkuro/app/constants/api_endpoint.dart';
import 'package:kaamkuro/core/failure/failure.dart';
import 'package:kaamkuro/core/networking/remote/http_service.dart';
import 'package:kaamkuro/features/employee/data/model/employee_api_model.dart';
import 'package:kaamkuro/features/employee/domain/entity/employee_entity.dart';

final employeeRemoteDataSourceProvider = Provider(
  (ref) => EmployeeRemoteDataSource(
    dio: ref.read(httpServiceProvider),
    employeeApiModel: ref.read(employeeApiModelProvider),
  ),
);

class EmployeeRemoteDataSource {
  final Dio dio;
  final EmployeeApiModel employeeApiModel;

  EmployeeRemoteDataSource({
    required this.dio,
    required this.employeeApiModel,
  });

  Future<Either<Failure, List<EmployeeEntity>>> getAllEmployees(
      int page) async {
    try {
      var response = await dio.get(
        ApiEndpoints.getAllEmployees,
        queryParameters: {
          'page': page,
          'limit': ApiEndpoints.limitPage,
        },
      );
      if (response.statusCode == 200) {
        // 1st way
        return Right(
          (response.data['employee'] as List)
              .map((job) => EmployeeApiModel.fromJson(job).toEntity())
              .toList(),
        );
        // OR
        // 2nd way
        // GetAllJobDTO jobAddDTO = GetAllJobDTO.fromJson(response.data);
        // return Right(employeeApiModel.toEntityList(jobAddDTO.data));
      } else {
        return Left(
          Failure(
            error: response.statusMessage.toString(),
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } on DioException catch (e) {
      return Left(
        Failure(
          error: e.error.toString(),
        ),
      );
    }
  }
}
