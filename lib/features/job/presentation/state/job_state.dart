
import 'package:kaamkuro/features/job/domain/entity/job_entity.dart';

class JobState {
  final List<JobEntity> lstJobs;
  final bool isLoading;
  final String? error;
  final bool hasReachedMax;
  final int page;

  JobState({
    required this.lstJobs,
    required this.isLoading,
    this.error,
    required this.hasReachedMax,
    required this.page,
  });

  factory JobState.initial() {
    return JobState(
      lstJobs: [],
      isLoading: false,
      error: null,
      hasReachedMax: false,
      page: 0,
    );
  }

  JobState copyWith({
    List<JobEntity>? lstJobs,
    bool? isLoading,
    String? error,
    bool? hasReachedMax,
    int? page,
  }) {
    return JobState(
      lstJobs: lstJobs ?? this.lstJobs,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }
}