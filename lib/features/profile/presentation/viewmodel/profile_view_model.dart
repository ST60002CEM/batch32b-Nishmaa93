import 'package:flutter_riverpod/flutter_riverpod.dart';

// Define a model class for user data
class User {
  final String name;
  final String email;
  final String? profilePictureUrl;
  final String? bio;

  User({
    required this.name,
    required this.email,
    this.profilePictureUrl,
    this.bio,
  });
}

// Define the state class
class UserState {
  final User? user;
  final bool isLoading;

  UserState({this.user, this.isLoading = false});
}

// Define the ViewModel
class UserViewModel extends StateNotifier<UserState> {
  UserViewModel() : super(UserState(isLoading: true)) {
    _fetchUser();
  }

  Future<void> _fetchUser() async {
    try {
      // Simulate a network call
      // await Future.delayed(Duration(seconds: 2));
      state = UserState(
        user: User(
          name: 'John Doe',
          email: 'john.doe@example.com',
          profilePictureUrl: null,
          bio: 'Software developer at Example Inc.',
        ),
        isLoading: false,
      );
    } catch (e) {
      state = UserState(isLoading: false);
      // Handle error
    }
  }

  void updateUser(User updatedUser) {
    state = UserState(user: updatedUser);
  }
}

// Create a provider for the UserViewModel
final userViewModelProvider = StateNotifierProvider<UserViewModel, UserState>(
  (ref) => UserViewModel(),
);
