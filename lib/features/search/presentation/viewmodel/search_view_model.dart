import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kaamkuro/core/common/my_snackbar.dart';
import 'package:kaamkuro/features/job/domain/usecases/job_usecase.dart';
import 'package:kaamkuro/features/job/presentation/state/job_state.dart';

final searchViewModelProvider =
    StateNotifierProvider.family<SearchViewmodel, JobState, String>(
  (ref, keyword) {
    final jobUseCase = ref.read(jobUsecaseProvider);
    return SearchViewmodel(jobUseCase, keyword);
  },
);

class SearchViewmodel extends StateNotifier<JobState> {
  SearchViewmodel(this.jobUseCase, this.keyword) : super(JobState.initial()) {
    searchAllJobs(keyword);
  }

  final JobUseCase jobUseCase;
  final String keyword;

  Future resetState() async {
    state = JobState.initial();
    searchAllJobs(keyword);
  }

  // For getting all batches
  searchAllJobs(String keyword) async {
    // To show the progress bar
    state = state.copyWith(isLoading: true);
    final currentState = state;
    final page = currentState.page + 1;
    final jobs = currentState.lstJobs;
    final hasReachedMax = currentState.hasReachedMax;
    if (!hasReachedMax) {
      var data = await jobUseCase.searchAllJobs(page, keyword);
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
