import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kaamkuro/core/failure/failure.dart';
import 'package:kaamkuro/features/job/domain/entity/job_entity.dart';
import 'package:kaamkuro/features/job/domain/repository/job_repository.dart';



final jobUsecaseProvider = Provider<JobUseCase>(
  (ref) => JobUseCase(
    jobRepository: ref.read(jobRepositoryProvider),
  ),
);

class JobUseCase {
  final IJobRepository jobRepository;

  JobUseCase({required this.jobRepository});

  // For getting all batches
  Future<Either<Failure, List<JobEntity>>> getAllJobs(int page) {
    return jobRepository.getAllJobs(page);
  }
}