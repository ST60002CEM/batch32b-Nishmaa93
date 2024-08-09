import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kaamkuro/features/profile/presentation/viewmodel/profile_view_model.dart';

class ProfileView extends ConsumerStatefulWidget {
  const ProfileView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileViewState();
}

class _ProfileViewState extends ConsumerState<ProfileView> {
  @override
  Widget build(BuildContext context) {
    final userState = ref.watch(userViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.brown,
        automaticallyImplyLeading: false,
      ),
      body: userState.isLoading
          ? const Center(child: CircularProgressIndicator())
          : userState.user == null
              ? const Center(child: Text('Failed to load user data'))
              : Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Profile Header
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 24.0, horizontal: 16.0),
                        decoration: BoxDecoration(
                          color: Colors.brown.shade50,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 6,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                CircleAvatar(
                                  radius: 60,
                                  backgroundImage: userState
                                              .user?.profilePictureUrl !=
                                          null
                                      ? NetworkImage(
                                          userState.user!.profilePictureUrl!)
                                      : const AssetImage(
                                              'assets/images/cat.jpg')
                                          as ImageProvider,
                                  backgroundColor: Colors.grey.shade200,
                                ),
                                Positioned(
                                  bottom: 1,
                                  right: 1,
                                  child: Container(
                                    padding: const EdgeInsets.all(
                                        1), // Reduced padding
                                    decoration: const BoxDecoration(
                                      color: Colors.brown,
                                      shape: BoxShape.circle,
                                    ),
                                    child: IconButton(
                                      icon: const Icon(
                                        Icons.camera_alt,
                                        color: Colors.white,
                                        size: 20, // Reduced icon size
                                      ),
                                      onPressed: () {
                                        // Handle profile picture change
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Text(
                              userState.user?.name ?? 'User Name',
                              style: const TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                color: Colors.brown,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              userState.user?.email ?? 'user@example.com',
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.brown,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      // User Bio
                      Card(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Bio',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.brown,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                userState.user?.bio ??
                                    'This is a short bio about the user.',
                                style: const TextStyle(
                                    fontSize: 16, color: Colors.brown),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      // Edit Profile Button
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            // Navigate to edit profile screen
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => EditProfileView()),
                            // );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.brown,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 14),
                            textStyle: const TextStyle(fontSize: 18),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            elevation: 6,
                            shadowColor: Colors.brown.shade400,
                          ),
                          child: const Text('Edit Profile'),
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Change Password Button
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            // Navigate to change password screen
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => ChangePasswordView()),
                            // );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.brown.shade700,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 14),
                            textStyle: const TextStyle(fontSize: 18),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            elevation: 6,
                            shadowColor: Colors.brown.shade400,
                          ),
                          child: const Text('Change Password'),
                        ),
                      ),
                    ],
                  ),
                ),
    );
  }
}
