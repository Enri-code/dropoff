import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../constants/locals.dart';
import '../services/api/endpoints.dart';
import '../services/api/healper_methods.dart';

class AuthController extends GetxController {
  final isLoading = false.obs;
  // final userData = UserModel().obs;

  @override
  void onReady() {
    // Call your init()
    super.onReady();
  }

  Future<void> signInUser(
      {required String password, required String email}) async {
    isLoading.value = true;

    var payload = jsonEncode({"password": password, "username": email});

    try {
      final response = await APIMethods.postData(
        url: APIEndpoints.signInEndpoint,
        body: payload,
        withHeader: false,
      );

      var body = response.body;
      if (kDebugMode) print("LOGIN: $body");

      if (response.statusCode == 200) {
        final token = response.body['token'] as String;

        if (kDebugMode) print("USER TOKEN: $token");

        await getStorageInstance.write(TOKEN, token);
        await getStorageInstance.write(EMAIL, email);
        await getStorageInstance.write(PASSWORD, password);
      } else {
        isLoading.value = false;
      }
    } catch (error) {
      isLoading.value = false;
      throw Exception(error);
    }
  }
}
