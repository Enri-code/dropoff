import 'package:dropoff/screens/home.dart';
import 'package:get/get.dart';

import '../screens/splash_screen.dart';
import 'route_name.dart';

class RoutePages {
  static final List<GetPage> routes = [
    // splash screen
    GetPage(
      name: AppRoutes.splashScreen,
      page: () => const SplashScreen(),
      // transition: Transition.fadeIn,
      // transitionDuration: const Duration(seconds: 0),
    ),
    GetPage(
      name: AppRoutes.splashScreen,
      page: () => const HomeScreen(),
    ),
    // login screen
  ];
}
