import 'package:get/get.dart';

import '../controllers/auth_cotroller.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(AuthController(), permanent: true);
  }
}
