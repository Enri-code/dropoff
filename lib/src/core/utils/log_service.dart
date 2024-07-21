import 'dart:developer';

import 'package:flutter/foundation.dart';

/// Prints messages only in **Debug** mode
void myPrint(dynamic message) {
  if (kDebugMode) log(message.toString());
}
