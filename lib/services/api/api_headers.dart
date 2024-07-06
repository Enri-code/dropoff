import 'package:flutter/foundation.dart';

import '../../constants/locals.dart';

class APIHeaders {
  static Map<String, String> appHeaders() {
    String token = getStorageInstance.read(TOKEN);

    if (kDebugMode) print("TOKEN FROM HEADERS: $token");
    return {
      'Accept': '*/*',
      'token': token,
      'Content-Type': 'application/json'
    };
  }
}
