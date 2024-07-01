// import 'package:flutter/material.dart';
// import 'package:kaamkuro/features/authentication/presentation/view/about_view.dart';
// import 'package:kaamkuro/features/authentication/presentation/view/home_view.dart';
// import 'package:kaamkuro/features/authentication/presentation/view/profile_view.dart';



// class DashboardView extends StatefulWidget {
//   const DashboardView({super.key});

//   @override
//   State<DashboardView> createState() => _DashboardViewState();
// }

// class _DashboardViewState extends State<DashboardView> {
//   int _selectedIndex = 0;
//   List<Widget> lstBottomView = [
//     const HomeView(),
//     const ProfileView(),
//     const AboutView(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Kaam Kuro'),
//         backgroundColor: Colors.brown,
//       ),
//       body: lstBottomView[_selectedIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         type: BottomNavigationBarType.fixed,
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.question_mark), label: 'About'),
//         ],
//         currentIndex: _selectedIndex,
//         onTap: (index) {
//           setState(() {
//             _selectedIndex = index;
//           });
//         },
//       ),
//     );
//   }
// }
