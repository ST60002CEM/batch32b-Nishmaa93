import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kaamkuro/core/failure/failure.dart';
import 'package:kaamkuro/features/employee/domain/entity/employee_entity.dart';
import 'package:kaamkuro/features/employee/domain/repository/employee_repository.dart';

final employeeUsecaseProvider = Provider<EmployeeUseCase>(
  (ref) => EmployeeUseCase(
    employeeRepository: ref.read(employeeRepositoryProvider),
  ),
);

class EmployeeUseCase {
  final IEmployeeRepository employeeRepository;

  EmployeeUseCase({required this.employeeRepository});

  // For getting all batches
  Future<Either<Failure, List<EmployeeEntity>>> getAllEmployees(int page) {
    return employeeRepository.getAllEmployees(page);
  }
}
