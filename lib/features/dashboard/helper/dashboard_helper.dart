import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pbg_app/ExportFile/export_file.dart';
import 'package:pbg_app/common/HiveDatabase/hive_database.dart';
import 'package:permission_handler/permission_handler.dart';

class DashboardHelper {

  static Future<GetLabelModel?> getLabelApi({required BuildContext context}) async {
    try {
      final res = await ApiServer.getData(urlEndPoint: AppUrl.getLabel, context: context);
      if (res != null) {
        GetLabelModel response = GetLabelModel.fromJson(jsonDecode(res));
        if (response.toJson().isNotEmpty) {
          if (await HiveDataBase.allLabelBox!.isOpen) {
            await HiveDataBase.allLabelBox!.clear();
            HiveDataBase.allLabelBox!.add(response);
          }
        }
        return response;
      }
    } catch (e) {
      print("GetLabelModel-->${e.toString()}");
      Utils.errorSnackBar(msg: e.toString(), context: context);
      return null;
    }
    return null;
  }

  static Future<GetNotInterestedModel?> getNotInterestedApi({required BuildContext context}) async {
    try {
      var res = await ApiServer.getData(urlEndPoint: AppUrl.notInterested, context: context);
      if (res != null) {
        GetNotInterestedModel response = GetNotInterestedModel.fromJson(jsonDecode(res));
        if (response.toJson().isNotEmpty) {
          if (await HiveDataBase.notInterestedBox!.isOpen) {
            await HiveDataBase.notInterestedBox!.clear();
            HiveDataBase.notInterestedBox!.add(response);
          }
        }
        return response;
      }
    } catch (e) {
      print("GetNotInterestedModel-->${e.toString()}");
      Utils.errorSnackBar(msg: e.toString(), context: context);
      return null;
    }
    return null;
  }


  static Future<GetInitialDepositStatusModel?> getInitialDepositStatusApi({required BuildContext context}) async {
    try {
      var res = await ApiServer.getData(urlEndPoint: AppUrl.initialDepositStatus, context: context);
      if (res != null) {
        GetInitialDepositStatusModel response = GetInitialDepositStatusModel.fromJson(jsonDecode(res));
        if (response.toJson().isNotEmpty) {
          if (await HiveDataBase.initDepositStatusBox!.isOpen) {
            await HiveDataBase.initDepositStatusBox!.clear();
            HiveDataBase.initDepositStatusBox!.add(response);
          }
        }
        return response;
      }
    } catch (e) {
      print("GetInitialDepositStatusModel-->${e.toString()}");
      Utils.errorSnackBar(msg: e.toString(), context: context);
      return null;
    }
    return null;
  }

  static Future<GetAcceptExtraFittingCostModel?> getAcceptExtraFittingCostApi({required BuildContext context}) async {
    try {
      var res = await ApiServer.getData(urlEndPoint: AppUrl.acceptExtraFittingCost, context: context);
        if (res != null) {
          GetAcceptExtraFittingCostModel response = GetAcceptExtraFittingCostModel.fromJson(jsonDecode(res));
          if (response.toJson().isNotEmpty) {
            if (await HiveDataBase.acceptExtraFittingCostBox!.isOpen) {
              await HiveDataBase.acceptExtraFittingCostBox!.clear();
              HiveDataBase.acceptExtraFittingCostBox!.add(response);
            }
          }
          return response;
        }
    } catch (e) {
      print("GetAcceptExtraFittingCostModel-->${e.toString()}");
      Utils.errorSnackBar(msg: e.toString(), context: context);
      return null;
    }
    return null;
  }

  static Future<GetAcceptConversionPolicyModel?> getAcceptConversionPolicyApi({required BuildContext context}) async {
    try {
        var res = await ApiServer.getData(urlEndPoint: AppUrl.acceptConversionPolicy, context: context);
      if (res != null) {
        GetAcceptConversionPolicyModel response = GetAcceptConversionPolicyModel.fromJson(jsonDecode(res));
        if (response.toJson().isNotEmpty) {
          if (await HiveDataBase.acceptConversionPolicyBox!.isOpen) {
            await HiveDataBase.acceptConversionPolicyBox!.clear();
            HiveDataBase.acceptConversionPolicyBox!.add(response);
          }
        }
        return response;
      }
    } catch (e) {
      print("GetAcceptConversionPolicyModel-->${e.toString()}");
      Utils.errorSnackBar(msg: e.toString(), context: context);
      return null;
    }
    return null;
  }

  static Future<List<GetAllDistrictModel>?> getAllDistrictModelApi({required BuildContext context}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? schema = prefs.getString(PrefsValue.schema);
    try {
        var res = await ApiServer.getData(urlEndPoint: AppUrl.getAllDistrict + schema!, context: context);
        if (res != null) {
          List<GetAllDistrictModel> response = getAllDistrictModelFromJson(res);
          if (response.isNotEmpty) {
            if (await HiveDataBase.allDistrictBox!.isOpen) {
              await HiveDataBase.allDistrictBox!.clear();
              HiveDataBase.allDistrictBox!.addAll(response);
            }
          }
          return response;
        }
    } catch (e) {
      print("GetAllDistrictModel-->${e.toString()}");
      Utils.errorSnackBar(msg: e.toString(), context: context);
      return null;
    }
    return null;
  }

  static Future<GetResidentStatusModel?> getResidentStatusApi({required BuildContext context}) async {
    try {
        var res = await ApiServer.getData(urlEndPoint: AppUrl.residentStatus, context: context);
      if (res != null) {
        GetResidentStatusModel response = GetResidentStatusModel.fromJson(jsonDecode(res));
        if (response.toJson().isNotEmpty) {
          if (await HiveDataBase.resStatusBox!.isOpen) {
            await HiveDataBase.resStatusBox!.clear();
            HiveDataBase.resStatusBox!.add(response);
          }
        }
        return response;
      }
    } catch (e) {
      print("GetResidentStatusModel-->${e.toString()}");
      Utils.errorSnackBar(msg: e.toString(), context: context);
      return null;
    }
    return null;
  }

  static Future<GetModeOfDepositModel?> getModeOfDepositApi({required BuildContext context}) async {
    try {
        var res = await ApiServer.getData(urlEndPoint: AppUrl.modeOfDeposit, context: context);
        if (res != null) {
        GetModeOfDepositModel response = GetModeOfDepositModel.fromJson(jsonDecode(res));
        if (response.toJson().isNotEmpty) {
          if (await HiveDataBase.modeOfDepositBox!.isOpen) {
            await HiveDataBase.modeOfDepositBox!.clear();
            HiveDataBase.modeOfDepositBox!.add(response);
          }
        }
        return response;
      }
    } catch (e) {
      print("GetModeOfDepositModel-->${e.toString()}");
      Utils.errorSnackBar(msg: e.toString(), context: context);
      return null;
    }
    return null;
  }

  static Future<GetEBillingModel?> getEBillingApi({required BuildContext context}) async {
    try {
        var res = await ApiServer.getData(urlEndPoint: AppUrl.eBilling, context: context,);
        if (res != null) {
        GetEBillingModel response = GetEBillingModel.fromJson(jsonDecode(res));
        if (response.toJson().isNotEmpty) {
          if (await HiveDataBase.eBillingBox!.isOpen) {
            await HiveDataBase.eBillingBox!.clear();
            HiveDataBase.eBillingBox!.add(response);
          }
        }
        return response;
      }
    } catch (e) {
      print("GetEBillingModel-->${e.toString()}");
      Utils.errorSnackBar(msg: e.toString(), context: context);
      return null;
    }
    return null;
  }

  static Future<GetKycDocModel?> getKycDocApi({required BuildContext context}) async {
  //  try {
        var res = await ApiServer.getData(urlEndPoint: AppUrl.kycDoc, context: context);
        if (res != null) {
          GetKycDocModel response = GetKycDocModel.fromJson(jsonDecode(res));
          if (response.toJson().isNotEmpty) {
            if (await HiveDataBase.kycDocBox!.isOpen) {
              await HiveDataBase.kycDocBox!.clear();
              HiveDataBase.kycDocBox!.add(response);
            }
          }
          return response;
        }
   /* } catch (e) {
      print("GetKycDocModel-->${e.toString()}");
      Utils.errorSnackBar(msg: e.toString(), context: context);
      return null;
    }*/
    return null;
  }

  static Future<GetOwnershipProofModel?> getOwnershipProofApi({required BuildContext context}) async {
    try {
        final res = await ApiServer.getData(urlEndPoint: AppUrl.ownershipProof, context: context);
        if (res != null) {
          GetOwnershipProofModel response = GetOwnershipProofModel.fromJson(jsonDecode(res));
          if (response.toJson().isNotEmpty) {
            if (await HiveDataBase.ownershipProofBox!.isOpen) {
              await HiveDataBase.ownershipProofBox!.clear();
              HiveDataBase.ownershipProofBox!.add(response);
            }
          }
          return response;
        }
    } catch (e) {
      print("ownershipProofRes-->${e.toString()}");
      Utils.errorSnackBar(msg: e.toString(), context: context);
      return null;
    }
    return null;
  }

  static Future<GetIdentityProofModel?> getIdentityProofApi({required BuildContext context}) async {
    try {
        var res = await ApiServer.getData(urlEndPoint: AppUrl.identityProof, context: context);
        if (res != null) {
          GetIdentityProofModel response = GetIdentityProofModel.fromJson(jsonDecode(res));
          if (response.toJson().isNotEmpty) {
            if (await HiveDataBase.idProofBox!.isOpen) {
              await HiveDataBase.idProofBox!.clear();
              HiveDataBase.idProofBox!.add(response);
            }
          }
          return response;
        }
    } catch (e) {
      print("GetIdentityProofModel-->${e.toString()}");
      Utils.errorSnackBar(msg: e.toString(), context: context);
      return null;
    }
    return null;
  }

  static Future<GetGuardianTypeModel?> getGuardianTypeApi({required BuildContext context}) async {
    try {
        var res = await ApiServer.getData(urlEndPoint: AppUrl.guardianType, context: context);
        if (res != null) {
          GetGuardianTypeModel response = GetGuardianTypeModel.fromJson(jsonDecode(res));
          if (response.toJson().isNotEmpty) {
            if (await HiveDataBase.guardianTypeBox!.isOpen) {
              await HiveDataBase.guardianTypeBox!.clear();
              HiveDataBase.guardianTypeBox!.add(response);
            }
          }
          return response;
        }
    } catch (e) {
      print("GetGuardianTypeModel-->${e.toString()}");
      Utils.errorSnackBar(msg: e.toString(), context: context);
      return null;
    }
    return null;
  }

  static Future<GetExistingCookingFuelModel?> getExistingCookingFuelApi({required BuildContext context}) async {
    try {
        var res = await ApiServer.getData(urlEndPoint: AppUrl.existingCookingFuel, context: context);
        if (res != null) {
          GetExistingCookingFuelModel response = GetExistingCookingFuelModel.fromJson(jsonDecode(res));
          if (response.toJson().isNotEmpty) {
            if (await HiveDataBase.cookingFuelBox!.isOpen) {
              await HiveDataBase.cookingFuelBox!.clear();
              HiveDataBase.cookingFuelBox!.add(response);
            }
          }
          return response;
        }
    } catch (e) {
      print("GetExistingCookingFuelModel-->${e.toString()}");
      Utils.errorSnackBar(msg: e.toString(), context: context);
      return null;
    }
    return null;
  }

  static Future<GetSocietyAllowModel?> getSocietyAllowApi({required BuildContext context}) async {
    try {
        var res = await ApiServer.getData(urlEndPoint: AppUrl.societyAllow, context: context);
        if (res != null) {
          GetSocietyAllowModel response = GetSocietyAllowModel.fromJson(jsonDecode(res));
          if (response.toJson().isNotEmpty) {
            if (await HiveDataBase.societyAllowBox!.isOpen) {
              await HiveDataBase.societyAllowBox!.clear();
              HiveDataBase.societyAllowBox!.add(response);
            }
          }
          return response;
        }
    } catch (e) {
      print("GetSocietyAllowModel-->${e.toString()}");
      Utils.errorSnackBar(msg: e.toString(), context: context);
      return null;
    }
    return null;
  }

  static Future<List<GetPropertyClassModel>?> getPropertyClassApi({required BuildContext context}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? schema = prefs.getString(PrefsValue.schema);
    try {
        var res = await ApiServer.getData(urlEndPoint: AppUrl.getPropertyClass + schema!, context: context);
        if (res != null) {
          List<GetPropertyClassModel> response = getPropertyClassModelFromJson(res);
          if (response.isNotEmpty) {
            if (await HiveDataBase.proClassBox!.isOpen) {
              await HiveDataBase.proClassBox!.clear();
              HiveDataBase.proClassBox!.addAll(response);
            }
          }
          return response;
        }
    } catch (e) {
      print("GetPropertyClassModel-->${e.toString()}");
      Utils.errorSnackBar(msg: e.toString(), context: context);
      return null;
    }
    return null;
  }

  static Future<List<GetPropertyCategoryModel>?> getPropertyCategoryApi({required BuildContext context}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? schema = prefs.getString(PrefsValue.schema);
    try {
        var res = await ApiServer.getData(urlEndPoint: AppUrl.getPropertyCategory + schema!, context: context);
        if (res != null) {
          List<GetPropertyCategoryModel> response = getPropertyCategoryModelFromJson(res);
          if (response.isNotEmpty) {
            if (await HiveDataBase.proCateBox!.isOpen) {
              await HiveDataBase.proCateBox!.clear();
              HiveDataBase.proCateBox!.addAll(response);
            }
          }
          return response;
        }
    } catch (e) {
      print("GetPropertyCategoryModel-->${e.toString()}");
      Utils.errorSnackBar(msg: e.toString(), context: context);
      return null;
    }
    return null;
  }

  static Future<List<GetAllAreaModel>?> getAllAreaApi({required BuildContext context}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? schema = prefs.getString(PrefsValue.schema);
    try {
        var res = await ApiServer.getData(urlEndPoint: AppUrl.getAllArea + schema!, context: context);
        if (res != null) {
          List<GetAllAreaModel> response = getAllAreaModelFromJson(res);
          if (response.isNotEmpty) {
            if (await HiveDataBase.allAreaBox!.isOpen) {
              await HiveDataBase.allAreaBox!.clear();
              HiveDataBase.allAreaBox!.addAll(response);
            }
          }
          return response;
        }
    } catch (e) {
      print("GetAllAreaModel-->${e.toString()}");
      Utils.errorSnackBar(msg: e.toString(), context: context);
      return null;
    }
    return null;
  }

  static Future<List<GetChargeAreaListModel>?> getChargeAreaListApi({required BuildContext context}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? schema = prefs.getString(PrefsValue.schema);
    try {
      var res = await ApiServer.getData(urlEndPoint: AppUrl.getChargeAreaList + schema!, context: context);
        if (res != null) {
          List<GetChargeAreaListModel> response = getChargeAreaListModelFromJson(res);
          if (response.isNotEmpty) {
            if (await HiveDataBase.chargeAreaListBox!.isOpen) {
              await HiveDataBase.chargeAreaListBox!.clear();
              HiveDataBase.chargeAreaListBox!.addAll(response);
            }
          }
          return response;
        }
    } catch (e) {
      print("GetChargeAreaListModel-->${e.toString()}");
      Utils.errorSnackBar(msg: e.toString(), context: context);
      return null;
    }
    return null;
  }

  static Future<List<GetAllDepositOfflineModel>?> getAllDepositOfflineApi({required BuildContext context}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? schema = prefs.getString(PrefsValue.schema);
    try {
        var res = await ApiServer.getData(urlEndPoint: AppUrl.getAllDepositOffline + schema!, context: context);
        if (res != null) {
          List<GetAllDepositOfflineModel> response = getAllDepositOfflineModelFromJson(res);
          if (response.isNotEmpty) {
            if (await HiveDataBase.allDepositOfflineBox!.isOpen) {
              await HiveDataBase.allDepositOfflineBox!.clear();
              HiveDataBase.allDepositOfflineBox!.addAll(response);
            }
          }
          return response;
        }
    } catch (e) {
      print("GetAllDepositOfflineModel-->${e.toString()}");
      Utils.errorSnackBar(msg: e.toString(), context: context);
      return null;
    }
    return null;
  }

  static Future<List<String>?> getBankNameListApi({required BuildContext context}) async {
    try {
      if (await isInternetConnected() == true) {
        var res = await ApiServer.getData(urlEndPoint: AppUrl.getAllBanks, context: context);
        if (res != null) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString(PrefsValue.getAllBanks, jsonEncode(bankNameListModelFromJson(res)));
          return bankNameListModelFromJson(res);
        }
      } else {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        if (prefs.containsKey(PrefsValue.getAllBanks)) {
          return bankNameListModelFromJson(prefs.getString(PrefsValue.getAllBanks) ?? "");
        }
      }
    } catch (e) {
      print("bankNameListModelFromJson-->${e.toString()}");
    }
    return null;
  }


  static  Future<File?> cameraCapture() async {
    await Permission.camera.request();
    final XFile? file = await ImagePicker().pickImage(source: ImageSource.camera,imageQuality: 50,
      maxHeight: 900,
      maxWidth: 1000,);
    File files = File(file!.path);
    return files;
  }

  static Future<File?> galleryCapture() async {
    await Permission.storage.request();
    final XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery,imageQuality: 50,
      maxHeight: 900,
      maxWidth: 1000,);
    File files = File(file!.path);
    return files;
  }


  static Future<Position?> getCurrentLocation() async {
    await Geolocator.requestPermission();
    await Permission.locationAlways.request();
    final androidInfo = await DeviceInfoPlugin().androidInfo;
    if (Platform.isAndroid) {
      if (androidInfo.version.sdkInt <= 32) {
        Position   position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
        log('latitude : ${position.latitude} longitude : ${position.longitude}');
        return position;
      }  else {

      }
    }
    return null;
  }

  static Future<bool> isInternetConnected() async {
    bool isConnect = false;
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        isConnect = true;
      }
    } on SocketException catch (_) {}

    return isConnect;
  }
}
