
import 'package:kaamkuro/app/navigator/navigator.dart';
import 'package:kaamkuro/features/home/presentation/view/home_view.dart';

class HomeViewNavigator {}

mixin HomeViewRoute {
  openHomeView() {
    NavigateRoute.pushRoute(const HomeView());
  }
}
 