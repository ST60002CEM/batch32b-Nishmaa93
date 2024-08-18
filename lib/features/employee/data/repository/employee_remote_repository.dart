import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kaamkuro/core/failure/failure.dart';
import 'package:kaamkuro/features/employee/data/data_source/employee_remote_data_source.dart';
import 'package:kaamkuro/features/employee/domain/entity/employee_entity.dart';
import 'package:kaamkuro/features/employee/domain/repository/employee_repository.dart';

final employeeRemoteRepositoryProvider = Provider<IEmployeeRepository>(
  (ref) => EmployeeRemoteRepository(
    employeeRemoteDataSource: ref.read(employeeRemoteDataSourceProvider),
  ),
);

class EmployeeRemoteRepository implements IEmployeeRepository {
  final EmployeeRemoteDataSource employeeRemoteDataSource;

  EmployeeRemoteRepository({required this.employeeRemoteDataSource});

  @override
  Future<Either<Failure, List<EmployeeEntity>>> getAllEmployees(int page) {
    return employeeRemoteDataSource.getAllEmployees(page);
  }
}
