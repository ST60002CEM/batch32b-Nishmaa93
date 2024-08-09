import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kaamkuro/features/job/domain/entity/job_entity.dart';
import 'package:kaamkuro/features/job/domain/usecases/job_usecase.dart';
import 'package:kaamkuro/features/job/presentation/viewmodel/job_viewmodel.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'job_test.mocks.dart';
import 'test_data/job_test_data.dart';

@GenerateNiceMocks([
  MockSpec<JobUseCase>(),
])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late JobUseCase mockJobUseCase;
  late ProviderContainer container;
  late List<JobEntity> lstJobs;

  setUp(
    () {
      mockJobUseCase = MockJobUseCase();
      lstJobs = JobTestData.getJobTestData();
      container = ProviderContainer(
        overrides: [
          jobViewModelProvider.overrideWith(
            (ref) => JobViewmodel(mockJobUseCase),
          )
        ],
      );
    },
  );

  test('check Job initial state', () async {
    //Arrange
    when(mockJobUseCase.getAllJobs(1))
        .thenAnswer((_) => Future.value(Right(lstJobs)));

    // Get all Jobs
    await container.read(jobViewModelProvider.notifier).getAllJobs();

    // Act
    // Store the state
    final jobState = container.read(jobViewModelProvider);

    // Assert
    // Check the state
    expect(jobState.isLoading, false);
    expect(jobState.error, isNull);
    expect(jobState.lstJobs, isNotEmpty);
  });

  test('expect empty array of jobs from the backend', () async {
    //Arrange
    when(mockJobUseCase.getAllJobs(1))
        .thenAnswer((_) => Future.value(Right(lstJobs)));

    // Get all Jobs
    await container.read(jobViewModelProvider.notifier).getAllJobs();

    // Act
    // Store the state
    final jobState = container.read(jobViewModelProvider);

    // Assert
    // Check the state
    expect(jobState.isLoading, false);
    expect(jobState.error, isNull);
    expect(jobState.lstJobs, isEmpty);
  });

  tearDown(() {
    container.dispose();
  });
}
