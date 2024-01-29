import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:pbg_app/models/save_customer_registration_offline_model.dart';

class SaveCusRegHiveDataStore {
  static String saveCustRegDataBoxName = "saveCustRegDataBoxName";

  // Get reference to an already opened box
  static Box<SaveCustomerRegistrationOfflineModel> box =
      Hive.box<SaveCustomerRegistrationOfflineModel>(saveCustRegDataBoxName);

  /// Add new user
  Future<void> addUser({SaveCustomerRegistrationOfflineModel userModel}) async {
    await box.add(userModel);
  }

  /// show user list
  Future<void> getUser({String id}) async {
    await box.get(id);
  }

  /// update user data
  Future<void> updateUser(
      {int index, SaveCustomerRegistrationOfflineModel userModel}) async {
    await box.putAt(index, userModel);
  }

  /// delete user
  Future<void> deleteUser({int index}) async {
    await box.deleteAt(index);
  }
}
