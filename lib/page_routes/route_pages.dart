import 'package:dropoff/screens/Authentication/signin/sign_in_screen.dart';
import 'package:dropoff/screens/home/home.dart';
import 'package:get/get.dart';

import '../screens/Authentication/signin/otp_verification_screen.dart';
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
      name: AppRoutes.signInScreen,
      page: () => const SignInScreen(),
    ),
    GetPage(
      name: AppRoutes.otpVerificationScreen,
      page: () => const OtpVerificationScreen(),
    ),
    GetPage(
      name: AppRoutes.homeScreen,
      page: () => const HomeScreen(),
    ),
    // login screen
  ];
}
