import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kaamkuro/app/constants/api_endpoint.dart';
import 'package:kaamkuro/core/failure/failure.dart';
import 'package:kaamkuro/core/networking/remote/http_service.dart';
import 'package:kaamkuro/features/job/data/model/job_api_model.dart';
import 'package:kaamkuro/features/job/domain/entity/job_entity.dart';
 
 
 
final jobRemoteDataSourceProvider = Provider(
  (ref) => JobRemoteDataSource(
    dio: ref.read(httpServiceProvider),
    jobApiModel: ref.read(jobApiModelProvider),
  ),
);
 
class JobRemoteDataSource {
  final Dio dio;
  final JobApiModel jobApiModel;
 
  JobRemoteDataSource({
    required this.dio,
    required this.jobApiModel,
  });
 
 
  Future<Either<Failure, List<JobEntity>>> getAllJobs(int page) async {
    try {
      var response = await dio.get(ApiEndpoints.getAllJobs,queryParameters: {
      'page': page,
      'limit': ApiEndpoints.limitPage,
  },
  );
      if (response.statusCode == 200) {
        // 1st way
        return Right(
          (response.data['jobs'] as List)
              .map((job) => JobApiModel.fromJson(job).toEntity())
              .toList(),
        );
        // OR
        // 2nd way
        // GetAllJobDTO jobAddDTO = GetAllJobDTO.fromJson(response.data);
        // return Right(jobApiModel.toEntityList(jobAddDTO.data));
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