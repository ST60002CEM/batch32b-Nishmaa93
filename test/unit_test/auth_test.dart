import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kaamkuro/core/failure/failure.dart';
import 'package:kaamkuro/features/authentication/domain/entity/auth_entity.dart';
import 'package:kaamkuro/features/authentication/domain/usecases/auth_usecase.dart';
import 'package:kaamkuro/features/authentication/presentation/navigator/login_navigator.dart';
import 'package:kaamkuro/features/authentication/presentation/viewmodel/auth_view_model.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'auth_test.mocks.dart';

// flutter test --coverage
// flutter test .\test\unit_test\ --coverage *
// flutter pub run test_cov_console
@GenerateNiceMocks([
  MockSpec<AuthUseCase>(),
  MockSpec<LoginViewNavigator>(),
])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late AuthUseCase mockAuthUseCase;
  late ProviderContainer container;
  late LoginViewNavigator mockLoginViewNavigator;

  setUp(
    () {
      mockAuthUseCase = MockAuthUseCase();
      mockLoginViewNavigator = MockLoginViewNavigator();
      container = ProviderContainer(
        overrides: [
          authViewModelProvider.overrideWith(
            (ref) => AuthViewModel(mockLoginViewNavigator, mockAuthUseCase),
          )
        ],
      );
    },
  );

  group('Login Group Test', () {
    test('login test with valid email and password', () async {
      // Arrange
      const correctEmail = 'a@gmail.com';
      const correctPassword = 'password';

      when(mockAuthUseCase.login(any, any)).thenAnswer((invocation) {
        final username = invocation.positionalArguments[0] as String;
        final password = invocation.positionalArguments[1] as String;
        return Future.value(
            username == correctEmail && password == correctPassword
                ? const Right(true)
                : Left(Failure(error: 'Invalid Password')));
      });

      // Act
      await container
          .read(authViewModelProvider.notifier)
          .login('a@gmail.com', 'password');

      final authState = container.read(authViewModelProvider);

      // Assert
      expect(authState.error, isNull);
    });

    test('Login test Invalid Email and password', () async {
      // Arrange
      const correctEmail = 'a@gmail.com';
      const correctPassword = 'password';

      when(mockAuthUseCase.login(any, any)).thenAnswer((invocation) {
        final username = invocation.positionalArguments[0] as String;
        final password = invocation.positionalArguments[1] as String;
        return Future.value(
            username == correctEmail && password == correctPassword
                ? const Right(true)
                : Left(Failure(error: 'Invalid Password')));
      });

      // Act
      await container
          .read(authViewModelProvider.notifier)
          .login('a@gmail.com', 'invalidPassword');

      final authState = container.read(authViewModelProvider);

      // Assert
      expect(authState.error, isNull);
    });
  });

  // Remove snackBar code from viewmodel before running this code otherwise error will occur
  test('Register User with their personal details', () async {
    // Arrange
    const name = 'Nishma';
    const phone = '9876217661';
    const email = 'nishma@softwarica.com';
    const password = 'password';
    const user =
        AuthEntity(name: name, phone: phone, email: email, password: password);
    when(mockAuthUseCase.register(user))
        .thenAnswer((_) => Future.value(const Right(true)));

    // Act
    await container.read(authViewModelProvider.notifier).register(user);

    final authState = container.read(authViewModelProvider);

    // Assert
    expect(authState.error, isNull);
  });

  tearDown(
    () {
      container.dispose();
    },
  );
}
