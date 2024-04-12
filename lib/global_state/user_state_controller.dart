import 'dart:developer';

import 'package:get/get.dart';
import 'package:train_app/models/user_model.dart';
import 'package:train_app/storage/get_storage.dart';

//this will be used for as user state, call when ever we want to user data.
class UserController extends GetxController {
  Rx<UserModel?> user = LightStorage.getUser().obs;
  static UserController get instance => Get.find();

  void updateUser(UserModel newUser) {
    log("the ofllwo" + newUser.jsonWebToken);
    LightStorage.storeUser(newUser);
    user.value = newUser;
    update();
  }

  void logOutUser() {
    LightStorage.logOutUser();
    user.value = null;
  }
}
