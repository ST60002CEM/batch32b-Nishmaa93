import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kaamkuro/core/common/my_snackbar.dart';
import 'package:kaamkuro/features/authentication/domain/entity/auth_entity.dart';
import 'package:kaamkuro/features/authentication/domain/usecases/auth_usecase.dart';
import 'package:kaamkuro/features/authentication/presentation/navigator/login_navigator.dart';
import 'package:kaamkuro/features/authentication/presentation/state/auth_state.dart';

final authViewModelProvider = StateNotifierProvider<AuthViewModel, AuthState>(
  (ref) => AuthViewModel(
    ref.read(loginViewNavigatorProvider),
    ref.read(authUseCaseProvider),
  ),
);

class AuthViewModel extends StateNotifier<AuthState> {
  AuthViewModel(this.navigator, this.authUseCase) : super(AuthState.initial());
  final AuthUseCase authUseCase;
  final LoginViewNavigator navigator;

  Future<void> uploadImage(File? file) async {
    state = state.copyWith(isLoading: true);
    var data = await authUseCase.uploadProfilePicture(file!);
    data.fold(
      (l) {
        state = state.copyWith(isLoading: false, error: l.error);
      },
      (imageName) {
        state =
            state.copyWith(isLoading: false, error: null, imageName: imageName);
      },
    );
  }

  Future<void> register(AuthEntity user) async {
    state = state.copyWith(isLoading: true);
    var data = await authUseCase.register(user);
    data.fold(
      (failure) {
        state = state.copyWith(
          isLoading: false,
          error: failure.error,
        );
        showMySnackBar(message: failure.error, color: Colors.red);
      },
      (success) {
        state = state.copyWith(isLoading: false, error: null);
        showMySnackBar(message: "Successfully registered");
      },
    );
  }

  Future<void> login(
    String username,
    String password,
  ) async {
    state = state.copyWith(isLoading: true);
    var data = await authUseCase.login(username, password);
    data.fold(
      (failure) {
        state = state.copyWith(isLoading: false, error: failure.error);
        showMySnackBar(message: failure.error, color: Colors.red);
      },
      (success) {
        state = state.copyWith(isLoading: false, error: null);
        // openHomeView();
        showMySnackBar(message: "Successfully login");
      },
    );
  }

  // void openRegisterView() {
  //   navigator.openRegisterView();
  // }

  // void openHomeView() {
  //   navigator.openDashboardView();
  // }
}
