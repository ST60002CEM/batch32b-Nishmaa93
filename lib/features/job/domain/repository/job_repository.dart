import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kaamkuro/core/failure/failure.dart';
import 'package:kaamkuro/features/job/data/repository/job_remote_repository.dart';
import 'package:kaamkuro/features/job/domain/entity/job_entity.dart';
 
// Instead of Local now call Remote repository
final jobRepositoryProvider = Provider<IJobRepository>((ref) {
  return ref.read(jobRemoteRepositoryProvider as ProviderListenable<IJobRepository>);//cast added
});
 
abstract class IJobRepository {
  Future<Either<Failure, List<JobEntity>>> getAllJobs(int page);
}