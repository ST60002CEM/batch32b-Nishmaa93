import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kaamkuro/features/splash/presentation/view_model/splash_view_model.dart';
 
class SplashView extends ConsumerStatefulWidget {
  const SplashView({super.key});
 
  @override
  ConsumerState<SplashView> createState() => _SplashViewState();
}
 
class _SplashViewState extends ConsumerState<SplashView> {
  @override
  void initState() {
    ref.read(splashViewModelProvider.notifier).openLoginView();
    super.initState();
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Replace this Icon with an Image widget
            Image.asset(
              'assets/images/kam.png',
              width: 300,
              height: 300,
            ),
            SizedBox(height: 20),
            const SizedBox(height: 30),
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}