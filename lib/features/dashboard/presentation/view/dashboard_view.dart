import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kaamkuro/app/navigator/navigator.dart';
import 'package:kaamkuro/features/authentication/presentation/view/login_view.dart';
import 'package:kaamkuro/features/home/presentation/view/home_view.dart';
import 'package:kaamkuro/utils/sensors/double_shake_sensor.dart';

class DashboardView extends ConsumerStatefulWidget {
  const DashboardView({super.key});

  @override
  ConsumerState<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends ConsumerState<DashboardView> {
  int _selectedIndex = 0;

  List<Widget> bottomScreens = [
    const HomeView(),
    const HomeView(),
    const HomeView(),
  ];

  late DoubleShakeDetectorService _doubleShakeDetectorService;

  @override
  void initState() {
    super.initState();
    // Initialize shake detection service
    _doubleShakeDetectorService =
        DoubleShakeDetectorService(onShake: _handleShake);
    _doubleShakeDetectorService.startListening();
  }

  @override
  void dispose() {
    // Clean up when the widget is disposed
    _doubleShakeDetectorService.stopListening();
    super.dispose();
  }

  void _handleShake() {
    // Handle shake event (e.g., logout)
    _doubleShakeDetectorService.stopListening();
    _logout();
  }

  void _logout() {
    // Perform logout action
    print('Logging out after shaking device');
    NavigateRoute.pushRoute(const LoginView());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bottomScreens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.library_add), label: 'Library'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
