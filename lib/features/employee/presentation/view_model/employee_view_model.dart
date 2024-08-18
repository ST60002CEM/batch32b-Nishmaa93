import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kaamkuro/core/common/my_snackbar.dart';
import 'package:kaamkuro/features/employee/domain/usecases/employee_usecase.dart';
import 'package:kaamkuro/features/employee/presentation/state/employee_state.dart';

final employeeViewModelProvider =
    StateNotifierProvider<EmployeeViewmodel, EmployeeState>(
  (ref) {
    return EmployeeViewmodel(ref.read(employeeUsecaseProvider));
  },
);

class EmployeeViewmodel extends StateNotifier<EmployeeState> {
  EmployeeViewmodel(this.employeeUseCase) : super(EmployeeState.initial()) {
    getAllEmployees();
  }

  final EmployeeUseCase employeeUseCase;
  Future resetState() async {
    state = EmployeeState.initial();
    getAllEmployees();
  }

  // For getting all batches
  getAllEmployees() async {
    // To show the progress bar
    state = state.copyWith(isLoading: true);
    final currentState = state;
    final page = currentState.page + 1;
    final employees = currentState.lstEmployees;
    final hasReachedMax = currentState.hasReachedMax;
    if (!hasReachedMax) {
      var data = await employeeUseCase.getAllEmployees(page);
      data.fold(
        (l) {
          state = state.copyWith(
              hasReachedMax: true, isLoading: false, error: l.error);
          showMySnackBar(message: l.error, color: Colors.red);
        },
        (r) {
          if (r.isEmpty) {
            state = state.copyWith(
                hasReachedMax: true, isLoading: false, error: null);
          } else {
            state = state.copyWith(
                isLoading: false,
                lstEmployees: [...employees, ...r],
                error: null,
                page: page,
                hasReachedMax: false);
          }
        },
      );
    } else {
      state = state.copyWith(isLoading: false);
    }
  }
}
