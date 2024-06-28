

import 'package:kaamkuro/app/navigator/navigator.dart';
import 'package:kaamkuro/features/dashboard/presentation/view/dashboard_view.dart';

class DashboardViewNavigator {}

mixin DashboardViewRoute {
  openDashboardView() {
    NavigateRoute.pushRoute(const DashboardView());
  }
}
 