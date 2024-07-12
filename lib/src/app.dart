import 'package:dropoff/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';

import '../page_routes/route_name.dart';
import '../page_routes/route_pages.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'DropOff',
      theme: ThemeData.dark(
              // fontFamily: GoogleFonts.anekBangla().fontFamily,
              )
          .copyWith(
        scaffoldBackgroundColor: const Color(0xFF1E1E1E),
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splashScreen,
      getPages: RoutePages.routes,
    );
  }
}
