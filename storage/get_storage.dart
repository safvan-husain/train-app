import 'package:get_storage/get_storage.dart';
import 'package:train_app/models/user_model.dart';

class LightStorage {
  static final box = GetStorage();

  static void storeUser(UserModel user) {
    box.write('user', user.toJson());
  }

  static UserModel? getUser() {
    String? jsonUser = box.read<String?>('user');
    if (jsonUser != null) {
      return UserModel.fromJson(jsonUser);
    }
    return null;
  }
}
