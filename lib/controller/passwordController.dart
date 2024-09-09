
import 'package:get/get.dart';

class PasswordController extends GetxController {
  // Observable variable to track the visibility state of the password
  RxBool isPasswordHidden = true.obs;

  // Method to toggle the password visibility
  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }
}
