import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kaamkuro/core/failure/failure.dart';
import 'package:kaamkuro/features/employee/data/repository/employee_remote_repository.dart';
import 'package:kaamkuro/features/employee/domain/entity/employee_entity.dart';

// Instead of Local now call Remote repository
final employeeRepositoryProvider = Provider<IEmployeeRepository>((ref) {
  return ref.read(employeeRemoteRepositoryProvider
      as ProviderListenable<IEmployeeRepository>); //cast added
});

abstract class IEmployeeRepository {
  Future<Either<Failure, List<EmployeeEntity>>> getAllEmployees(int page);
}
