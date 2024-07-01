import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kaamkuro/features/home/presentation/view/home_view.dart';
 
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
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bottomScreens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index){
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home', ),
          BottomNavigationBarItem(icon: Icon(Icons.library_add), label: 'Library'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}