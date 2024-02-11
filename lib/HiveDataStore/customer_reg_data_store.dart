import 'package:hive_flutter/adapters.dart';
import 'package:pbg_app/models/save_customer_registration_offline_model.dart';

class SaveCusRegHiveDataStore {
  static String saveCustRegDataBoxName = "saveCustRegDataBoxName";

  //Get reference to an already opened box
  static Box<SaveCustomerRegistrationOfflineModel> box = Hive.box<SaveCustomerRegistrationOfflineModel>(saveCustRegDataBoxName);

  /// Add new user
  static Future<void> addUser({SaveCustomerRegistrationOfflineModel userModel}) async {
    box.add(userModel);
  }

  /// show user list
  static Future<SaveCustomerRegistrationOfflineModel> getUser({String id}) async {
    SaveCustomerRegistrationOfflineModel value = box.get(id);
    box.close();
    return value;
  }

  /// update user data
  static Future<void> updateUser({int index, SaveCustomerRegistrationOfflineModel userModel}) async {
    box.putAt(index, userModel);
  }

  /// delete user
  static Future<void> deleteAt(int index) async {
    box.deleteAt(index);
  }

  //Clear box
  static Future<void> clearBox() async {
    box.clear();
  }

  static List<SaveCustomerRegistrationOfflineModel> getAll() {
    final userList = box.values;
    return userList.toList();
  }

  static Future<void> closeBox() {
    box.close();
  }
}
