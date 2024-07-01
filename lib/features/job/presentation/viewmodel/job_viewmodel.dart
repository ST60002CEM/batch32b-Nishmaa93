// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:kaamkuro/core/common/my_snackbar.dart';
// import 'package:kaamkuro/features/job/domain/entity/job_entity.dart';
// import 'package:kaamkuro/features/job/domain/usecases/job_usecase.dart';
// import 'package:kaamkuro/features/job/presentation/state/job_state.dart';

// final jobViewModelProvider = StateNotifierProvider<JobViewmodel, JobState>(
//   (ref) {
//     return JobViewmodel(ref.read(jobUsecaseProvider));
//   },
// );

// class JobViewmodel extends StateNotifier<JobState> {
//   JobViewmodel(this.jobUseCase) : super(JobState.initial()) {
//     getAllJobs();
//   }

//   final JobUseCase jobUseCase;
//   Future resetState() async {
//   state = JobState.initial();
//   getAllJobs();
// }
//   // For getting all batches
//   getAllJobs() async {
//     // To show the progress bar
//     state = state.copyWith(isLoading: true);
//     final currentState = state;
//     final page = currentState.page + 1;
//     final jobs = currentState.lstJobs;
//     final hasReachedMax = currentState.hasReachedMax;
//     if (!hasReachedMax) {
//   var data = await jobUseCase.getAllJobs(page);
//   data.fold(
//     (l) {
//       state = state.copyWith(
//           hasReachedMax: true, isLoading: false, error: l.error);
//       showMySnackBar(message: l.error, color: Colors.red);
//     },
//     (r) {
//       if (r.isEmpty) {
//         state = state.copyWith(
//             hasReachedMax: true, isLoading: false, error: null);
//       } else {
//         state = state.copyWith(
//             isLoading: false,
//             lstJobs: [...jobs, ...r],
//             error: null,
//             page: page,
//             hasReachedMax: false);
//       }
//     },
//   );
// } else {
//   state = state.copyWith(isLoading: false);
// }
//   }

//   //Navigation
// }

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kaamkuro/core/common/my_snackbar.dart';
import 'package:kaamkuro/features/job/domain/entity/job_entity.dart';
import 'package:kaamkuro/features/job/domain/usecases/job_usecase.dart';
import 'package:kaamkuro/features/job/presentation/state/job_state.dart';
 
final jobViewModelProvider = StateNotifierProvider<JobViewmodel, JobState>(
  (ref) {
    return JobViewmodel(ref.read(jobUsecaseProvider));
  },
);
 
class JobViewmodel extends StateNotifier<JobState> {
  JobViewmodel(this.jobUseCase) : super(JobState.initial()) {
    getAllJobs();
  }
 
  final JobUseCase jobUseCase;
  Future resetState() async {
  state = JobState.initial();
  getAllJobs();
}
  // For getting all batches
  getAllJobs() async {
    // To show the progress bar
    state = state.copyWith(isLoading: true);
    final currentState = state;
    final page = currentState.page + 1;
    final jobs = currentState.lstJobs;
    final hasReachedMax = currentState.hasReachedMax;
    if (!hasReachedMax) {
  var data = await jobUseCase.getAllJobs(page);
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
            lstJobs: [...jobs, ...r],
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
 
  //Navigation
}
 