import 'package:get/get.dart';
import 'package:train_app/models/user_model.dart';
import 'package:train_app/storage/get_storage.dart';

class UserController extends GetxController {
  Rx<UserModel?> user = LightStorage.getUser().obs;
  static UserController get instance => Get.find();

  void updateUser(UserModel newUser) {
    LightStorage.storeUser(newUser);
    user.value = newUser;
    update();
  }

  void logOutUser() {
    LightStorage.logOutUser();
    user.value = null;
  }
}
