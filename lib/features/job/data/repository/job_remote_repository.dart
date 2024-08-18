import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kaamkuro/core/failure/failure.dart';
import 'package:kaamkuro/features/job/data/data_source/job_remote_data_source.dart';
import 'package:kaamkuro/features/job/domain/entity/job_entity.dart';
import 'package:kaamkuro/features/job/domain/repository/job_repository.dart';

final jobRemoteRepositoryProvider = Provider<IJobRepository>(
  (ref) => JobRemoteRepository(
    jobRemoteDataSource: ref.read(jobRemoteDataSourceProvider),
  ),
);

class JobRemoteRepository implements IJobRepository {
  final JobRemoteDataSource jobRemoteDataSource;

  JobRemoteRepository({required this.jobRemoteDataSource});

  @override
  Future<Either<Failure, List<JobEntity>>> getAllJobs(int page) {
    return jobRemoteDataSource.getAllJobs(page);
  }

  @override
  Future<Either<Failure, List<JobEntity>>> searchAllJobs(
      int page, String keyword) {
    return jobRemoteDataSource.searchAllJobs(page, keyword);
  }
}
