import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kaamkuro/app/navigator/navigator.dart';
import 'package:kaamkuro/features/authentication/presentation/navigator/register_navigator.dart';
import 'package:kaamkuro/features/authentication/presentation/view/login_view.dart';
import 'package:kaamkuro/features/dashboard/presentation/navigator/dashboard_navigator.dart';

final loginViewNavigatorProvider = Provider((ref) => LoginViewNavigator());

class LoginViewNavigator with RegisterViewRoute, DashboardViewRoute {}

mixin LoginViewRoute {
  openLoginView() {
    NavigateRoute.pushRoute(const LoginView());
  }
}