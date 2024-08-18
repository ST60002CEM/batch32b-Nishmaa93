import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kaamkuro/core/common/my_snackbar.dart';
import 'package:kaamkuro/features/profile/domain/entity/user_entity.dart';
import 'package:kaamkuro/features/profile/domain/usecases/user_use_case.dart';
import 'package:kaamkuro/features/profile/presentation/state/user_state.dart';

final userViewModelProvider =
    StateNotifierProvider<UserViewModel, UserState>((ref) {
  return UserViewModel(userUseCase: ref.read(userUsecaseProvider));
});

class UserViewModel extends StateNotifier<UserState> {
  UserViewModel({required this.userUseCase}) : super(UserState.initial()) {
    getCurrentUser();
  }

  final UserUseCase userUseCase;

  Future resetState() async {
    state = UserState.initial();
    getCurrentUser();
  }

  getCurrentUser() {
    state = state.copyWith(isLoading: true);
    userUseCase.getUser().then((data) {
      data.fold(
        (failure) {
          state = state.copyWith(isLoading: false);
          showMySnackBar(message: failure.error, color: Colors.red);
        },
        (user) {
          state = state.copyWith(isLoading: false, userEntity: user);
        },
      );
    });
  }

  Future<void> uploadImage(File? image) async {
    state = state.copyWith(isLoading: true);
    var data = await userUseCase.updateProfilePicture(image!);
    data.fold(
      (l) {
        state = state.copyWith(isLoading: false, error: l.error);
      },
      (imageName) {
        state = state.copyWith(isLoading: false, error: null, imageName: '');
        showMySnackBar(message: 'Profile Picture has been updated.');
        getCurrentUser();
      },
    );
  }

  editUser(UserEntity user) {
    state = state.copyWith(isLoading: true);
    userUseCase.editUser(user).then((data) {
      data.fold(
        (failure) {
          state = state.copyWith(isLoading: false);
          showMySnackBar(message: failure.error, color: Colors.red);
        },
        (user) {
          state = state.copyWith(isLoading: false);
          showMySnackBar(message: 'User has been updated.');
        },
      );
      getCurrentUser();
    });
  }

  changePassword(String oldPassword, String newPassword) {
    state = state.copyWith(isLoading: true);
    userUseCase.changePassword(oldPassword, newPassword).then((data) {
      data.fold(
        (failure) {
          state = state.copyWith(isLoading: false);
          showMySnackBar(message: failure.error, color: Colors.red);
        },
        (user) {
          state = state.copyWith(isLoading: false);
          showMySnackBar(message: 'Password has been changed.');
        },
      );
    });
  }
}
