import 'package:kaamkuro/features/employee/domain/entity/employee_entity.dart';

class EmployeeState {
  final List<EmployeeEntity> lstEmployees;
  final bool isLoading;
  final String? error;
  final bool hasReachedMax;
  final int page;

  EmployeeState({
    required this.lstEmployees,
    required this.isLoading,
    this.error,
    required this.hasReachedMax,
    required this.page,
  });

  factory EmployeeState.initial() {
    return EmployeeState(
      lstEmployees: [],
      isLoading: false,
      error: null,
      hasReachedMax: false,
      page: 0,
    );
  }

  EmployeeState copyWith({
    List<EmployeeEntity>? lstEmployees,
    bool? isLoading,
    String? error,
    bool? hasReachedMax,
    int? page,
  }) {
    return EmployeeState(
      lstEmployees: lstEmployees ?? this.lstEmployees,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }
}
