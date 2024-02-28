import 'package:flutter/material.dart';
import 'package:pbg_app/ExportFile/export_file.dart';
import 'package:permission_handler/permission_handler.dart';

class DashboardHelper {

  static Future<GetLabelModel?> getLabelApi({required BuildContext context}) async {
    try {
      if (await isInternetConnected() == true) {
        final res = await ApiServer.getData(urlEndPoint: AppUrl.getLabel, context: context);

        if (res != null) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString(PrefsValue.label, jsonEncode(GetLabelModel.fromJson(jsonDecode(res))));
          return GetLabelModel.fromJson(jsonDecode(res));
        }
      } else {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        if (prefs.containsKey(PrefsValue.label)) {
          return GetLabelModel.fromJson(jsonDecode((prefs.getString(PrefsValue.label) ?? "")));
        }
      }
    } catch (e) {
      print("GetLabelModel-->${e.toString()}");
    }
    return null;
  }

  static Future<GetNotInterestedModel?> getNotInterestedApi({required BuildContext context}) async {
    try {
      if (await isInternetConnected() == true) {
        var res = await ApiServer.getData(urlEndPoint: AppUrl.notInterested, context: context);
        if (res != null) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString(PrefsValue.notInterested, jsonEncode(GetNotInterestedModel.fromJson(jsonDecode(res))));
          return GetNotInterestedModel.fromJson(jsonDecode(res));
        }
      } else {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        if (prefs.containsKey(PrefsValue.notInterested)) {
          return GetNotInterestedModel.fromJson(jsonDecode((prefs.getString(PrefsValue.notInterested) ?? "")));
        }
      }
    } catch (e) {
      print("GetNotInterestedModel-->${e.toString()}");
    }
    return null;
  }

  static Future<GetInitialDepositStatusModel?> getInitialDepositStatusApi({required BuildContext context}) async {
    try {
      if (await isInternetConnected() == true) {
        var res = await ApiServer.getData(urlEndPoint: AppUrl.initialDepositStatus, context: context);
        if (res != null) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString(PrefsValue.initialDepositStatus, jsonEncode(GetInitialDepositStatusModel.fromJson(jsonDecode(res))));
          return GetInitialDepositStatusModel.fromJson(jsonDecode(res));
        }
      } else {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        if (prefs.containsKey(PrefsValue.initialDepositStatus)) {
          return GetInitialDepositStatusModel.fromJson(jsonDecode((prefs.getString(PrefsValue.initialDepositStatus) ?? "")));
        }
      }
    } catch (e) {
      print("GetInitialDepositStatusModel-->${e.toString()}");
    }
    return null;
  }

  static Future<GetAcceptExtraFittingCostModel?> getAcceptExtraFittingCostApi({required BuildContext context}) async {
    try {
      if (await isInternetConnected() == true) {
        var res = await ApiServer.getData(urlEndPoint: AppUrl.acceptExtraFittingCost, context: context);
        if (res != null) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString(PrefsValue.acceptExtraFittingCost, jsonEncode(GetAcceptExtraFittingCostModel.fromJson(jsonDecode(res))));
          return GetAcceptExtraFittingCostModel.fromJson(jsonDecode(res));
        }
      } else {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        if (prefs.containsKey(PrefsValue.acceptExtraFittingCost)) {
          return GetAcceptExtraFittingCostModel.fromJson(jsonDecode((prefs.getString(PrefsValue.acceptExtraFittingCost) ?? "")));
        }
      }
    } catch (e) {
      print("GetAcceptExtraFittingCostModel-->${e.toString()}");
    }
    return null;
  }

  static Future<GetAcceptConversionPolicyModel?> getAcceptConversionPolicyApi({required BuildContext context}) async {
    try {
      if (await isInternetConnected() == true) {
        var res = await ApiServer.getData(urlEndPoint: AppUrl.acceptConversionPolicy, context: context);
        if (res != null) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString(PrefsValue.acceptConversionPolicy, jsonEncode(GetAcceptConversionPolicyModel.fromJson(jsonDecode(res))));
          return GetAcceptConversionPolicyModel.fromJson(jsonDecode(res));
        }
      } else {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        if (prefs.containsKey(PrefsValue.acceptConversionPolicy)) {
          return GetAcceptConversionPolicyModel.fromJson(jsonDecode((prefs.getString(PrefsValue.acceptConversionPolicy) ?? "")));
        }
      }
    } catch (e) {
      print("GetAcceptConversionPolicyModel-->${e.toString()}");
    }
    return null;
  }

  static Future<List<GetAllDistrictModel>?> getAllDistrictModelApi({required BuildContext context}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? schema = prefs.getString(PrefsValue.schema);
    try {
      if (await isInternetConnected() == true) {
        var res = await ApiServer.getData(urlEndPoint: AppUrl.getAllDistrict + schema!, context: context);
        if (res != null) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString(PrefsValue.getAllDistrictModel, jsonEncode(getAllDistrictModelFromJson(res)));
          return getAllDistrictModelFromJson(res);
        }
      } else {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        if (prefs.containsKey(PrefsValue.getAllDistrictModel)) {
          return getAllDistrictModelFromJson(prefs.getString(PrefsValue.getAllDistrictModel) ?? "");
        }
      }
    } catch (e) {
      print("GetAllDistrictModel-->${e.toString()}");
    }
    return null;
  }

  static Future<GetResidentStatusModel?> getResidentStatusApi({required BuildContext context}) async {
    try {
      if (await isInternetConnected() == true) {
        var res = await ApiServer.getData(urlEndPoint: AppUrl.residentStatus, context: context);
        if (res != null) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString(PrefsValue.residentStatus, jsonEncode(res));
          return GetResidentStatusModel.fromJson(jsonDecode(res));
        }
      } else {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        if (prefs.containsKey(PrefsValue.residentStatus)) {
          return GetResidentStatusModel.fromJson(jsonDecode((prefs.getString(PrefsValue.residentStatus) ?? "")));
        }
      }
    } catch (e) {
      print("GetResidentStatusModel-->${e.toString()}");
    }
    return null;
  }

  static Future<GetModeOfDepositModel?> getModeOfDepositApi({required BuildContext context}) async {
    try {
      if (await isInternetConnected() == true) {
        var res = await ApiServer.getData(urlEndPoint: AppUrl.modeOfDeposit, context: context);
        if (res != null) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString(PrefsValue.modeOfDeposit, jsonEncode(GetModeOfDepositModel.fromJson(jsonDecode(res))));
          return GetModeOfDepositModel.fromJson(jsonDecode(res));
        }
      } else {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        if (prefs.containsKey(PrefsValue.modeOfDeposit)) {
          return GetModeOfDepositModel.fromJson(jsonDecode((prefs.getString(PrefsValue.modeOfDeposit) ?? "")));
        }
      }
    } catch (e) {
      print("GetModeOfDepositModel-->${e.toString()}");
    }
    return null;
  }

  static Future<GetEBillingModel?> getEBillingApi({required BuildContext context}) async {
    try {
      if (await isInternetConnected() == true) {
        var res = await ApiServer.getData(urlEndPoint: AppUrl.eBilling, context: context,);
        if (res != null) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString(PrefsValue.eBilling, jsonEncode(GetEBillingModel.fromJson(jsonDecode(res))));
          return GetEBillingModel.fromJson(jsonDecode(res));
        }
      } else {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        if (prefs.containsKey(PrefsValue.eBilling)) {
          return GetEBillingModel.fromJson(jsonDecode((prefs.getString(PrefsValue.eBilling) ?? "")));
        }
      }
    } catch (e) {
      print("GetEBillingModel-->${e.toString()}");
    }
    return null;
  }

  static Future<GetKycDocModel?> getKycDocApi({required BuildContext context}) async {
    try {
      if (await isInternetConnected() == true) {
        var res = await ApiServer.getData(urlEndPoint: AppUrl.kycDoc, context: context);
        if (res != null) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString(PrefsValue.kycDoc, jsonEncode(GetKycDocModel.fromJson(jsonDecode(res))));
          return GetKycDocModel.fromJson(jsonDecode(res));
        }
      } else {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        if (prefs.containsKey(PrefsValue.kycDoc)) {
          return GetKycDocModel.fromJson(jsonDecode((prefs.getString(PrefsValue.kycDoc) ?? "")));
        }
      }
    } catch (e) {
      print("GetKycDocModel-->${e.toString()}");
    }
    return null;
  }

  static Future<GetOwnershipProofModel?> getOwnershipProofApi({required BuildContext context}) async {
    try {
      if (await isInternetConnected() == true) {
        final res = await ApiServer.getData(urlEndPoint: AppUrl.ownershipProof, context: context);
        if (res != null) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString(PrefsValue.ownershipProof, jsonEncode(GetOwnershipProofModel.fromJson(jsonDecode(res))));
          return GetOwnershipProofModel.fromJson(jsonDecode(res));
        }
      } else {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        if (prefs.containsKey(PrefsValue.ownershipProof)) {
          return GetOwnershipProofModel.fromJson(jsonDecode((prefs.getString(PrefsValue.ownershipProof) ?? "")));
        }
      }
    } catch (e) {
      print("ownershipProofRes-->${e.toString()}");
    }
    return null;
  }

  static Future<GetIdentityProofModel?> getIdentityProofApi({required BuildContext context}) async {
    try {
      if (await isInternetConnected() == true) {
        var res = await ApiServer.getData(urlEndPoint: AppUrl.identityProof, context: context);
        if (res != null) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString(PrefsValue.identityProof, jsonEncode(GetIdentityProofModel.fromJson(jsonDecode(res))));
          return GetIdentityProofModel.fromJson(jsonDecode(res));
        }
      } else {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        if (prefs.containsKey(PrefsValue.identityProof)) {
          return GetIdentityProofModel.fromJson(jsonDecode((prefs.getString(PrefsValue.identityProof) ?? "")));
        }
      }
    } catch (e) {
      print("GetIdentityProofModel-->${e.toString()}");
    }
    return null;
  }

  static Future<GetGuardianTypeModel?> getGuardianTypeApi({required BuildContext context}) async {
    try {
      if (await isInternetConnected() == true) {
        var res = await ApiServer.getData(urlEndPoint: AppUrl.guardianType, context: context);
        if (res != null) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString(PrefsValue.guardianType, jsonEncode(GetGuardianTypeModel.fromJson(jsonDecode(res))));
          return GetGuardianTypeModel.fromJson(jsonDecode(res));
        }
      } else {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        if (prefs.containsKey(PrefsValue.guardianType)) {
          return GetGuardianTypeModel.fromJson(jsonDecode((prefs.getString(PrefsValue.guardianType) ?? "")));
        }
      }
    } catch (e) {
      print("GetGuardianTypeModel-->${e.toString()}");
    }
    return null;
  }

  static Future<GetExistingCookingFuelModel?> getExistingCookingFuelApi({required BuildContext context}) async {
    try {
      if (await isInternetConnected() == true) {
        var res = await ApiServer.getData(urlEndPoint: AppUrl.existingCookingFuel, context: context);
        if (res != null) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString(PrefsValue.existingCookingFuel, jsonEncode(GetExistingCookingFuelModel.fromJson(jsonDecode(res))));
          return GetExistingCookingFuelModel.fromJson(jsonDecode(res));
        }
      } else {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        if (prefs.containsKey(PrefsValue.existingCookingFuel)) {
          return GetExistingCookingFuelModel.fromJson(jsonDecode((prefs.getString(PrefsValue.existingCookingFuel) ?? "")));
        }
      }
    } catch (e) {
      print("GetExistingCookingFuelModel-->${e.toString()}");
    }
    return null;
  }

  static Future<GetSocietyAllowModel?> getSocietyAllowApi({required BuildContext context}) async {
    try {
      if (await isInternetConnected() == true) {
        var res = await ApiServer.getData(urlEndPoint: AppUrl.societyAllow, context: context);
        if (res != null) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString(PrefsValue.societyAllow, jsonEncode(GetSocietyAllowModel.fromJson(jsonDecode(res))));
          return GetSocietyAllowModel.fromJson(jsonDecode(res));
        }
      } else {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        if (prefs.containsKey(PrefsValue.societyAllow)) {
          return GetSocietyAllowModel.fromJson(jsonDecode((prefs.getString(PrefsValue.societyAllow) ?? "")));
        }
      }
    } catch (e) {
      print("GetSocietyAllowModel-->${e.toString()}");
    }
    return null;
  }

  static Future<List<GetPropertyClassModel>?> getPropertyClassApi({required BuildContext context}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? schema = prefs.getString(PrefsValue.schema);
    try {
      if (await isInternetConnected() == true) {
        var res = await ApiServer.getData(urlEndPoint: AppUrl.getPropertyClass + schema!, context: context);
        if (res != null) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString(PrefsValue.propertyClass, jsonEncode(getPropertyClassModelFromJson(res)));
          return getPropertyClassModelFromJson(res);
        }
      } else {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        if (prefs.containsKey(PrefsValue.propertyClass)) {
          return getPropertyClassModelFromJson(prefs.getString(PrefsValue.propertyClass) ?? "");
        }
      }
    } catch (e) {
      print("GetPropertyClassModel-->${e.toString()}");
    }
    return null;
  }

  static Future<List<GetPropertyCategoryModel>?> getPropertyCategoryApi({required BuildContext context}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? schema = prefs.getString(PrefsValue.schema);
    try {
      if (await isInternetConnected() == true) {
        var res = await ApiServer.getData(urlEndPoint: AppUrl.getPropertyCategory + schema!, context: context);
        if (res != null) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString(PrefsValue.propertyCategory, jsonEncode(getPropertyCategoryModelFromJson(res)));
          return getPropertyCategoryModelFromJson(res);
        }
      } else {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        if (prefs.containsKey(PrefsValue.propertyCategory)) {
          return getPropertyCategoryModelFromJson(prefs.getString(PrefsValue.propertyCategory) ?? "");
        }
      }
    } catch (e) {
      print("GetPropertyCategoryModel-->${e.toString()}");
    }
    return null;
  }

  static Future<List<GetAllAreaModel>?> getAllAreaApi({required BuildContext context}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? schema = prefs.getString(PrefsValue.schema);
    try {
      if (await isInternetConnected() == true) {
        var res = await ApiServer.getData(urlEndPoint: AppUrl.getAllArea + schema!, context: context);
        if (res != null) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString(PrefsValue.allArea, jsonEncode(getAllAreaModelFromJson(res)));
          return getAllAreaModelFromJson(res);
        }
      } else {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        if (prefs.containsKey(PrefsValue.allArea)) {
          return getAllAreaModelFromJson(prefs.getString(PrefsValue.allArea) ?? "");
        }
      }
    } catch (e) {
      print("GetAllAreaModel-->${e.toString()}");
    }
    return null;
  }

  static Future<List<GetChargeAreaListModel>?> getChargeAreaListApi({required BuildContext context}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? schema = prefs.getString(PrefsValue.schema);
    try {
      if (await isInternetConnected() == true) {
        var res = await ApiServer.getData(urlEndPoint: AppUrl.getChargeAreaList + schema!, context: context);
        if (res != null) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString(PrefsValue.chargeAreaList, jsonEncode(getChargeAreaListModelFromJson(res)));
          return getChargeAreaListModelFromJson(res);
        }
      } else {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        if (prefs.containsKey(PrefsValue.chargeAreaList)) {
          return getChargeAreaListModelFromJson(prefs.getString(PrefsValue.chargeAreaList) ?? "");
        }
      }
    } catch (e) {
      print("GetChargeAreaListModel-->${e.toString()}");
    }
    return null;
  }

  static Future<List<GetAllDepositOfflineModel>?> getAllDepositOfflineApi({required BuildContext context}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? schema = prefs.getString(PrefsValue.schema);
    try {
      if (await isInternetConnected() == true) {
        var res = await ApiServer.getData(urlEndPoint: AppUrl.getAllDepositOffline + schema!, context: context);
        if (res != null) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString(PrefsValue.getAllDepositOffline, jsonEncode(getAllDepositOfflineModelFromJson(res)));
          return getAllDepositOfflineModelFromJson(res);
        }
      } else {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        if (prefs.containsKey(PrefsValue.getAllDepositOffline)) {
          return getAllDepositOfflineModelFromJson(prefs.getString(PrefsValue.getAllDepositOffline) ?? "");
        }
      }
    } catch (e) {
      print("GetAllDepositOfflineModel-->${e.toString()}");
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
    await Permission.locationAlways.request();
    var permissionStatus = await Permission.locationAlways.status;
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
