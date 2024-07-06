import 'package:get/get_utils/src/get_utils/get_utils.dart';

String? validateMyEmail(String? value) {
  if (value!.isEmpty) {
    return "Field cannot be empty";
  } else if (!GetUtils.isEmail(value)) {
    return "Input a valid email";
  }
  return null;
}
