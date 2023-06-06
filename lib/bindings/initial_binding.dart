import 'package:get/get.dart';
import 'package:master_class/Controllers/auth_controller.dart';
import 'package:master_class/Controllers/theme_controller.dart';

import '../services/firebase_storage_service.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<ThemeController>(ThemeController());
    Get.put<AuthController>(AuthController(), permanent: true);
    Get.put<FirebaseStorageService>(FirebaseStorageService());
    
  }
}
