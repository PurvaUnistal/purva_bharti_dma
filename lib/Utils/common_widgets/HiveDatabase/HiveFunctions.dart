import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:pbg_app/Utils/common_widgets/HiveDatabase/hive_box_name.dart';
import 'package:pbg_app/features/RegistrationForm/domain/model/save_registration_form_model.dart';

import 'hive_database.dart';

class SaveCusRegHiveDataStore {


  /// Add new user
  Future<void> addUser({required SaveRegistrationFormModel userModel}) async {
    await HiveDataBase.registrationFormBox?.add(userModel);
  }

  /// show user list
  Future<void> getUser({required String id}) async {
    await HiveDataBase.registrationFormBox?.get(id);
  }

  /// update user data
  Future<void> updateUser(
      {required int index, required SaveRegistrationFormModel userModel}) async {
    await HiveDataBase.registrationFormBox?.putAt(index, userModel);
  }

  /// delete user
  Future<void> deleteUser({required int index}) async {
    await HiveDataBase.registrationFormBox?.deleteAt(index);
  }
}