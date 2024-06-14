import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kaamkuro/app/navigator/navigator.dart';
import 'package:kaamkuro/features/authentication/presentation/view/register_view.dart';
import 'package:kaamkuro/screen/signup_screen.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Add Image widget here
          Image.asset(
            'assets/images/kam.png', // replace with your image path
            height: 150, // adjust height as needed
          ),

          Padding(
            padding: const EdgeInsets.all(30),
            child: Form(
              child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      hintText: 'Enter Email',
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (String value) {},
                    validator: (value) {
                      return value!.isEmpty ? 'Please enter email' : null;
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      hintText: 'Enter Password',
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (String value) {},
                    validator: (value) {
                      return value!.isEmpty ? 'Please enter password' : null;
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigator.pushReplacement(
                        //   context,
                        //   MaterialPageRoute(builder: (_) => DashboardScreen()),
                        // );
                      },
                      child:
                          Text('Login', style: TextStyle(color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.brown,
                        textStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already have an account?'),
                      TextButton(
                        onPressed: () {
                          // Add your navigation logic here, e.g., navigate to login screen
                          NavigateRoute.pushRoute(const RegisterView());
                        },
                        child: Text('Sign Up'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
