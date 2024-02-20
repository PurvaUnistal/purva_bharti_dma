import 'package:pbg_app/ExportFile/export_file.dart';

class SaveCusRegHiveDataStore {
  static String saveCustRegDataBoxName = "saveCustRegDataBoxName";

  // Get reference to an already opened box
  static Box<SaveCustomerRegistrationOfflineModel> box =
      Hive.box<SaveCustomerRegistrationOfflineModel>(saveCustRegDataBoxName);

  /// Add new user
  Future<void> addUser(
      {required SaveCustomerRegistrationOfflineModel userModel}) async {
    await box.add(userModel);
  }

  /// show user list
  Future<void> getUser({required String id}) async {
    await box.get(id);
  }

  /// update user data
  Future<void> updateUser(
      {required int index,
      required SaveCustomerRegistrationOfflineModel userModel}) async {
    await box.putAt(index, userModel);
  }

  /// delete user
  Future<void> deleteUser({required int index}) async {
    await box.deleteAt(index);
  }
}
