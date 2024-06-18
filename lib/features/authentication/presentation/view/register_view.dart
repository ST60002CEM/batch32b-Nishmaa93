import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kaamkuro/app/navigator/navigator.dart';
import 'package:kaamkuro/features/authentication/domain/entity/auth_entity.dart';
import 'package:kaamkuro/features/authentication/presentation/view/login_view.dart';
import 'package:kaamkuro/features/authentication/presentation/viewmodel/auth_view_model.dart';

class RegisterView extends ConsumerStatefulWidget {
  const RegisterView({super.key});

  @override
  ConsumerState<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends ConsumerState<RegisterView> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  void _register() async {
    // Here you should add your registration logic
    var student = AuthEntity(
      name: _nameController.text,
      image: ref.read(authViewModelProvider).imageName ?? '',
      phone: _phoneController.text,
      email: _emailController.text,
      password: _passwordController.text,
    );

    ref.read(authViewModelProvider.notifier).register(student);
  }

  void _loginWithGoogle() {
    // Here you should add your Google login logic
    print('Login with Google');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set the background color here
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
                'assets/images/kam.png'), // Replace with your image path
            SizedBox(height: 20),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber)),
                fillColor: Colors.amber,
                labelText: 'Name',
                labelStyle: TextStyle(
                  color: Colors.black,
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(
                      width: 4.0,
                      strokeAlign: BorderSide.strokeAlignCenter,
                      style: BorderStyle.solid,
                      color: Colors.black),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                prefixIcon: Icon(Icons.person),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber)),
                fillColor: Colors.amber,
                labelText: 'Email',
                labelStyle: TextStyle(
                  color: Colors.black,
                ),
                border: OutlineInputBorder(
                  // gapPadding: Checkbox.width,
                  borderSide: const BorderSide(
                    width: 4.0,
                    strokeAlign: BorderSide.strokeAlignCenter,
                    color: Colors.black,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                prefixIcon: Icon(Icons.email),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 20),
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber)),
                fillColor: Colors.amber,
                labelText: 'Phone',
                labelStyle: TextStyle(
                  color: Colors.black,
                ),
                border: OutlineInputBorder(
                  // gapPadding: Checkbox.width,
                  borderSide: const BorderSide(
                    width: 4.0,
                    strokeAlign: BorderSide.strokeAlignCenter,
                    color: Colors.black,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                prefixIcon: Icon(Icons.phone),
              ),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber)),
                fillColor: Colors.amber,
                hintText: 'Password',
                labelStyle: TextStyle(
                  color: Colors.black,
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 4.0,
                    strokeAlign: BorderSide.strokeAlignCenter,
                    color: Colors.black,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                prefixIcon: Icon(Icons.lock),
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: _register,
                child: Text('Sign Up'),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown,
                    textStyle: TextStyle(color: Colors.white))),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already have an account?'),
                TextButton(
                  onPressed: () {
                    // Add your navigation logic here, e.g., navigate to login screen
                    NavigateRoute.pushRoute(const LoginView());
                  },
                  child: Text('Login'),
                ),
              ],
            ),
            SizedBox(height: 10),
            ElevatedButton.icon(
              icon: Icon(Icons.login),
              label: Text('Login with Google'),
              onPressed: _loginWithGoogle,
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  textStyle:
                      TextStyle(color: Colors.white) // Google's red color
                  ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
