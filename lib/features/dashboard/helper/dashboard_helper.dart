import 'package:flutter/material.dart';
import 'package:pbg_app/ExportFile/export_file.dart';
import 'package:permission_handler/permission_handler.dart';

class DashboardHelper {
  static Future<GetLabelModel?> getLabelApi({required BuildContext context}) async {
    try {
      if (await isInternetConnected() == true) {
        final res = await ApiServer.getData(urlEndPoint: AppUrl.getLabel, context: context, setPrefs: PrefsValue.label);

        if (res != null) {
          return GetLabelModel.fromJson(jsonDecode(res));
        }
      } else {
        final res = PreferenceUtils.getString(value: PrefsValue.label);
        print("labelRes-->$res");
        return GetLabelModel.fromJson(jsonDecode(res));
      }
    } catch (e) {
      print("GetLabelModel-->${e.toString()}");
    }
    return null;
  }

  static Future<GetNotInterestedModel?> getNotInterestedApi({required BuildContext context}) async {
    try {
      if (await isInternetConnected() == true) {
        var res = await ApiServer.getData(urlEndPoint: AppUrl.notInterested, context: context, setPrefs: PrefsValue.notInterested);
        if (res != null) {
          return GetNotInterestedModel.fromJson(jsonDecode(res));
        }
      } else {
        var notInterestedRes = PreferenceUtils.getString(value: PrefsValue.notInterested);
        print("notInterestedRes-->$notInterestedRes");
        return GetNotInterestedModel.fromJson(jsonDecode(notInterestedRes));
      }
    } catch (e) {
      print("GetNotInterestedModel-->${e.toString()}");
    }
    return null;
  }

  static Future<GetInitialDepositStatusModel?> getInitialDepositStatusApi({required BuildContext context}) async {
    try {
      if (await isInternetConnected() == true) {
        var res = await ApiServer.getData(urlEndPoint: AppUrl.initialDepositStatus, context: context, setPrefs: PrefsValue.initialDepositStatus);
        if (res != null) {
          return GetInitialDepositStatusModel.fromJson(jsonDecode(res));
        }
      } else {
        var initialDepositStatusRes = PreferenceUtils.getString(value: PrefsValue.initialDepositStatus);
        print("initialDepositStatusRes-->$initialDepositStatusRes");
        return GetInitialDepositStatusModel.fromJson(jsonDecode(initialDepositStatusRes));
      }
    } catch (e) {
      print("GetInitialDepositStatusModel-->${e.toString()}");
    }
    return null;
  }

  static Future<GetAcceptExtraFittingCostModel?> getAcceptExtraFittingCostApi({required BuildContext context}) async {
    try {
      if (await isInternetConnected() == true) {
        var res = await ApiServer.getData(urlEndPoint: AppUrl.acceptExtraFittingCost, context: context, setPrefs: PrefsValue.acceptExtraFittingCost);
        if (res != null) {
          return GetAcceptExtraFittingCostModel.fromJson(jsonDecode(res));
        }
      } else {
        var acceptExtraFittingCostRes = PreferenceUtils.getString(value: PrefsValue.acceptExtraFittingCost);
        print("acceptExtraFittingCostRes-->$acceptExtraFittingCostRes");
        return GetAcceptExtraFittingCostModel.fromJson(jsonDecode(acceptExtraFittingCostRes));
      }
    } catch (e) {
      print("GetAcceptExtraFittingCostModel-->${e.toString()}");
    }
    return null;
  }

  static Future<GetAcceptConversionPolicyModel?> getAcceptConversionPolicyApi({required BuildContext context}) async {
    try {
      if (await isInternetConnected() == true) {
        var res = await ApiServer.getData(urlEndPoint: AppUrl.acceptConversionPolicy, context: context, setPrefs: PrefsValue.acceptConversionPolicy);
        if (res != null) {
          return GetAcceptConversionPolicyModel.fromJson(jsonDecode(res));
        }
      } else {
        var acceptConversionPolicyRes = PreferenceUtils.getString(value: PrefsValue.acceptConversionPolicy);
        print("acceptConversionPolicyRes-->$acceptConversionPolicyRes");
        return GetAcceptConversionPolicyModel.fromJson(jsonDecode(acceptConversionPolicyRes));
      }
    } catch (e) {
      print("GetAcceptConversionPolicyModel-->${e.toString()}");
    }
    return null;
  }

  static Future<List<GetAllDistrictModel>?> getAllDistrictModelApi({required BuildContext context}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? schema = prefs.getString(GlobalConstants.schema);
    try {
      if (await isInternetConnected() == true) {
        var res = await ApiServer.getData(urlEndPoint: AppUrl.getAllDistrict + schema!, context: context, setPrefs: PrefsValue.getAllDistrictModel);
        if (res != null) {
          return getAllDistrictModelFromJson(res);
        }
      } else {
        var res = PreferenceUtils.getString(value: PrefsValue.getAllDistrictModel);
        print("GetAllDistrictModel-->$res");
        return getAllDistrictModelFromJson(res);
      }
    } catch (e) {
      print("GetAllDistrictModel-->${e.toString()}");
    }
    return null;
  }

  static Future<GetResidentStatusModel?> getResidentStatusApi({required BuildContext context}) async {
    try {
      if (await isInternetConnected() == true) {
        var res = await ApiServer.getData(urlEndPoint: AppUrl.residentStatus, context: context, setPrefs: PrefsValue.residentStatus);
        if (res != null) {
          return GetResidentStatusModel.fromJson(jsonDecode(res));
        }
      } else {
        var residentStatusRes = PreferenceUtils.getString(value: PrefsValue.residentStatus);
        print("residentStatusRes-->$residentStatusRes");
        return GetResidentStatusModel.fromJson(jsonDecode(residentStatusRes));
      }
    } catch (e) {
      print("GetResidentStatusModel-->${e.toString()}");
    }
    return null;
  }

  static Future<GetModeOfDepositModel?> getModeOfDepositApi({required BuildContext context}) async {
    try {
      if (await isInternetConnected() == true) {
        var res = await ApiServer.getData(urlEndPoint: AppUrl.modeOfDeposit, context: context, setPrefs: PrefsValue.modeOfDeposit);
        if (res != null) {
          return GetModeOfDepositModel.fromJson(jsonDecode(res));
        }
      } else {
        var modeOfDepositRes = PreferenceUtils.getString(value: PrefsValue.modeOfDeposit);
        print("modeOfDepositRes-->$modeOfDepositRes");
        return GetModeOfDepositModel.fromJson(jsonDecode(modeOfDepositRes));
      }
    } catch (e) {
      print("GetModeOfDepositModel-->${e.toString()}");
    }
    return null;
  }

  static Future<GetEBillingModel?> getEBillingApi({required BuildContext context}) async {
    try {
      if (await isInternetConnected() == true) {
        var res = await ApiServer.getData(urlEndPoint: AppUrl.eBilling, context: context, setPrefs: PrefsValue.eBilling);
        if (res != null) {
          return GetEBillingModel.fromJson(jsonDecode(res));
        }
      } else {
        var eBillingRes = PreferenceUtils.getString(value: PrefsValue.eBilling);
        print("eBillingRes-->$eBillingRes");
        return GetEBillingModel.fromJson(jsonDecode(eBillingRes));
      }
    } catch (e) {
      print("GetEBillingModel-->${e.toString()}");
    }
    return null;
  }

  static Future<GetKycDocModel?> getKycDocApi({required BuildContext context}) async {
    try {
      if (await isInternetConnected() == true) {
        var res = await ApiServer.getData(urlEndPoint: AppUrl.kycDoc, context: context, setPrefs: PrefsValue.kycDoc);
        if (res != null) {
          return GetKycDocModel.fromJson(jsonDecode(res));
        }
      } else {
        var kycDocRes = PreferenceUtils.getString(value: PrefsValue.kycDoc);
        print("kycDocRes-->$kycDocRes");
        return GetKycDocModel.fromJson(jsonDecode(kycDocRes));
      }
    } catch (e) {
      print("GetKycDocModel-->${e.toString()}");
    }
    return null;
  }

  static Future<GetOwnershipProofModel?> getOwnershipProofApi({required BuildContext context}) async {
    try {
      if (await isInternetConnected() == true) {
        final res = await ApiServer.getData(urlEndPoint: AppUrl.ownershipProof, context: context, setPrefs: PrefsValue.ownershipProof);
        if (res != null) {
          return GetOwnershipProofModel.fromJson(jsonDecode(res));
        }
      } else {
        final res = PreferenceUtils.getString(value: PrefsValue.ownershipProof);
        print("ownershipProofRes-->$res");
        return GetOwnershipProofModel.fromJson(jsonDecode(res));
      }
    } catch (e) {
      print("ownershipProofRes-->${e.toString()}");
    }
    return null;
  }

  static Future<GetIdentityProofModel?> getIdentityProofApi({required BuildContext context}) async {
    try {
      if (await isInternetConnected() == true) {
        var res = await ApiServer.getData(urlEndPoint: AppUrl.identityProof, context: context, setPrefs: PrefsValue.identityProof);
        if (res != null) {
          return GetIdentityProofModel.fromJson(jsonDecode(res));
        }
      } else {
        var identityProofRes = PreferenceUtils.getString(value: PrefsValue.identityProof);
        print("identityProofRes-->$identityProofRes");
        return GetIdentityProofModel.fromJson(jsonDecode(identityProofRes));
      }
    } catch (e) {
      print("GetIdentityProofModel-->${e.toString()}");
    }
    return null;
  }

  static Future<GetGuardianTypeModel?> getGuardianTypeApi({required BuildContext context}) async {
    try {
      if (await isInternetConnected() == true) {
        var res = await ApiServer.getData(urlEndPoint: AppUrl.guardianType, context: context, setPrefs: PrefsValue.guardianType);
        if (res != null) {
          return GetGuardianTypeModel.fromJson(jsonDecode(res));
        }
      } else {
        var guardianTypeRes = PreferenceUtils.getString(value: PrefsValue.guardianType);
        print("guardianTypeRes-->$guardianTypeRes");
        return GetGuardianTypeModel.fromJson(jsonDecode(guardianTypeRes));
      }
    } catch (e) {
      print("GetGuardianTypeModel-->${e.toString()}");
    }
    return null;
  }

  static Future<GetExistingCookingFuelModel?> getExistingCookingFuelApi({required BuildContext context}) async {
    try {
      if (await isInternetConnected() == true) {
        var res = await ApiServer.getData(urlEndPoint: AppUrl.existingCookingFuel, context: context, setPrefs: PrefsValue.existingCookingFuel);
        if (res != null) {
          return GetExistingCookingFuelModel.fromJson(jsonDecode(res));
        }
      } else {
        var res = PreferenceUtils.getString(value: PrefsValue.existingCookingFuel);
        print("existingCookingFuelRes-->$res");
        return GetExistingCookingFuelModel.fromJson(jsonDecode(res));
      }
    } catch (e) {
      print("GetExistingCookingFuelModel-->${e.toString()}");
    }
    return null;
  }

  static Future<GetSocietyAllowModel?> getSocietyAllowApi({required BuildContext context}) async {
    try {
      if (await isInternetConnected() == true) {
        var res = await ApiServer.getData(urlEndPoint: AppUrl.societyAllow, context: context, setPrefs: PrefsValue.societyAllow);
        if (res != null) {
          return GetSocietyAllowModel.fromJson(jsonDecode(res));
        }
      } else {
        var societyAllowRes = PreferenceUtils.getString(value: PrefsValue.societyAllow);
        print("societyAllowRes-->$societyAllowRes");
        return GetSocietyAllowModel.fromJson(jsonDecode(societyAllowRes));
      }
    } catch (e) {
      print("GetSocietyAllowModel-->${e.toString()}");
    }
    return null;
  }

  static Future<List<GetPropertyClassModel>?> getPropertyClassApi({required BuildContext context}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? schema = prefs.getString(GlobalConstants.schema);
    try {
      if (await isInternetConnected() == true) {
        var res = await ApiServer.getData(urlEndPoint: AppUrl.getPropertyClass + schema!, context: context, setPrefs: PrefsValue.propertyClass);
        if (res != null) {
          return getPropertyClassModelFromJson(res);
        }
      } else {
        var res = PreferenceUtils.getString(value: PrefsValue.propertyClass);
        print("propertyClassRes-->$res");
        return getPropertyClassModelFromJson(res);
      }
    } catch (e) {
      print("GetPropertyClassModel-->${e.toString()}");
    }
    return null;
  }

  static Future<List<GetPropertyCategoryModel>?> getPropertyCategoryApi({required BuildContext context}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? schema = prefs.getString(GlobalConstants.schema);
    try {
      if (await isInternetConnected() == true) {
        var res = await ApiServer.getData(urlEndPoint: AppUrl.getPropertyCategory + schema!, context: context, setPrefs: PrefsValue.propertyCategory);
        if (res != null) {
          return getPropertyCategoryModelFromJson(res);
        }
      } else {
        var res = PreferenceUtils.getString(value: PrefsValue.propertyCategory);
        print("propertyCategoryRes-->$res");
        return getPropertyCategoryModelFromJson(res);
      }
    } catch (e) {
      print("GetPropertyCategoryModel-->${e.toString()}");
    }
    return null;
  }

  static Future<List<GetAllAreaModel>?> getAllAreaApi({required BuildContext context}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? schema = prefs.getString(GlobalConstants.schema);
    try {
      if (await isInternetConnected() == true) {
        var res = await ApiServer.getData(urlEndPoint: AppUrl.getAllArea + schema!, context: context, setPrefs: PrefsValue.allArea);
        if (res != null) {
          return getAllAreaModelFromJson(res);
        }
      } else {
        var res = PreferenceUtils.getString(value: PrefsValue.allArea);
        print("allAreaRes-->$res");
        return getAllAreaModelFromJson(res);
      }
    } catch (e) {
      print("GetAllAreaModel-->${e.toString()}");
    }
    return null;
  }

  static Future<List<GetChargeAreaListModel>?> getChargeAreaListApi({required BuildContext context}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? schema = prefs.getString(GlobalConstants.schema);
    try {
      if (await isInternetConnected() == true) {
        var res = await ApiServer.getData(urlEndPoint: AppUrl.getChargeAreaList + schema!, context: context, setPrefs: PrefsValue.chargeAreaList);
        if (res != null) {
          return getChargeAreaListModelFromJson(res);
        }
      } else {
        var res = PreferenceUtils.getString(value: PrefsValue.chargeAreaList);
        print("chargeAreaListRes-->$res");
        return getChargeAreaListModelFromJson(res);
      }
    } catch (e) {
      print("GetChargeAreaListModel-->${e.toString()}");
    }
    return null;
  }

  static Future<List<GetAllDepositOfflineModel>?> getAllDepositOfflineApi({required BuildContext context}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? schema = prefs.getString(GlobalConstants.schema);
    try {
      if (await isInternetConnected() == true) {
        var res = await ApiServer.getData(urlEndPoint: AppUrl.getAllDepositOffline + schema!, context: context, setPrefs: PrefsValue.getAllDepositOffline);
        if (res != null) {
          return getAllDepositOfflineModelFromJson(res);
        }
      } else {
        var res = PreferenceUtils.getString(value: PrefsValue.getAllDepositOffline);
        print("GetAllDepositOfflineModel-->$res");
        return getAllDepositOfflineModelFromJson(res);
      }
    } catch (e) {
      print("GetAllDepositOfflineModel-->${e.toString()}");
    }
    return null;
  }

  static Future<List<String>?> getBankNameListApi({required BuildContext context}) async {
    try {
      if (await isInternetConnected() == true) {
        var res = await ApiServer.getData(urlEndPoint: AppUrl.getAllBanks, context: context, setPrefs: PrefsValue.getAllBanks);
        if (res != null) {
          return bankNameListModelFromJson(res);
        }
      } else {
        var res = PreferenceUtils.getString(value: PrefsValue.getAllBanks);
        print("bankNameListModelFromJson-->$res");
        return bankNameListModelFromJson(res);
      }
    } catch (e) {
      print("bankNameListModelFromJson-->${e.toString()}");
    }
    return null;
  }

  static Future<dynamic> cameraPiker({required BuildContext context, required String cameraImage}) async {
    await Permission.camera.request();
    /*  await Permission.photos.request();
    var permissionStatus = await Permission.photos.status;
    final androidInfo = await DeviceInfoPlugin().androidInfo;
    if (Platform.isAndroid) {
      */ /*if (androidInfo.version.sdkInt <= 32) {
        /// use [Permissions.storage.status]
      }  else {
        /// use [Permissions.photos.status]
      }*/ /*
    }*/
    if (await Permission.camera.request().isGranted) {
      try {
        final XFile? camera = await ImagePicker().pickImage(
          source: ImageSource.camera,
          imageQuality: 60,
          maxHeight: 900,
          maxWidth: 1000,
        );
        if (camera!.path.isNotEmpty) {
          cameraImage = camera.path;
          log("cameraImage-->${camera.path.toString()}");
        } else {
          print('no image selected');
        }
      } on PlatformException catch (e) {
        print('Platform exception $e');
      } catch (e) {
        print('Unknown error: $e');
      }
      return cameraImage;
    }
  }

  static Future<dynamic> galleryPiker({required BuildContext context, required String galleryImage}) async {
    await Permission.storage.request();
    await Permission.photos.request();
    // if (await Permission.photos.request().isGranted) {
    try {
      final XFile? gallery = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 60,
        maxHeight: 900,
        maxWidth: 1000,
      );
      if (gallery!.path.isNotEmpty) {
        galleryImage = gallery.path.toString();
        log("galleryImage-->${gallery.path.toString()}");
      } else {
        log('no image selected');
      }
    } catch (e) {
      log('Unknown error: $e');
    }
    return galleryImage;

    //  }
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
