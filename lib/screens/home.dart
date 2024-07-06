import 'package:dropoff/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sizee = 19.0.obs;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.kGreyColor,
          title: const Text("Home"),
        ),
        body: const Center(
          child: Column(
            children: [Text("Hello world")],
          ),
        ),
      ),
    );
  }
}
