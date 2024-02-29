import 'package:flutter/material.dart';
import 'package:pbg_app/ExportFile/export_file.dart';

class HiveFunctions {
  static get custHiveBox => "CustomerRegistrationData";
  static Box<SaveCustomerRegistrationOfflineModel>? userBox;

  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    Directory tempDir = await getApplicationDocumentsDirectory();
    Directory filesDir = Directory(tempDir.path)..createSync(recursive: true);
    Hive.init(filesDir.path);

    // Get reference to an already opened box
    Hive.registerAdapter<SaveCustomerRegistrationOfflineModel>(SaveCustomerRegistrationOfflineModelAdapter());
    userBox = await Hive.openBox<SaveCustomerRegistrationOfflineModel>(custHiveBox);
  }


  /// Add new user
  static Future<void> addUser({required SaveCustomerRegistrationOfflineModel userModel}) async {
    await userBox!.add(userModel);
  }

  /// show user list
  static Future<void> getUser({required String id}) async {
    await userBox!.get(id);
  }

  /// update user data
  static Future<void> updateUser({required int index, required SaveCustomerRegistrationOfflineModel userModel}) async {
    await userBox!.putAt(index, userModel);
  }

  /// delete user
  static Future<void> deleteUser({required int index}) async {
    await userBox!.deleteAt(index);
  }

  // delete data for particular user in hive
  static deleteAllUser(int key) {
    return userBox!.deleteAll(userBox!.keys);
  }

}