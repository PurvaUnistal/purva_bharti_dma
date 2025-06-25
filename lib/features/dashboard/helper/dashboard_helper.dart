import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:pbg_app/ExportFile/export_file.dart';
import 'package:pbg_app/Service/api_server_dio.dart';
import 'package:pbg_app/Utils/common_widgets/res/app_config.dart';

class DashboardHelper {
  static Future<GetLabelModel?> getLabelApi({
    required BuildContext context,
  }) async {
    try {
      final res = await ApiHelperDio.getData(
        urlEndPoint: AppUrl.getLabel,
        context: context,
      );
      if (res != null) {
        GetLabelModel response = GetLabelModel.fromJson(res);
        if (HiveDataBase.allLabelBox != null &&
            HiveDataBase.allLabelBox!.isOpen) {
          await HiveDataBase.allLabelBox!.clear();
          await HiveDataBase.allLabelBox!.add(response);
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

  static Future<List<GetNotInterestedModel>?> getNotInterestedApi({
    required BuildContext context,
  }) async {
    try {
      var res = await ApiHelperDio.getData(
        urlEndPoint: AppUrl.notInterested,
        context: context,
      );
      if (res != null) {
        List<GetNotInterestedModel> response = GetNotInterestedModel.mapToList(
          res,
        );
        if (response.isNotEmpty) {
          if (HiveDataBase.notInterestedBox != null &&
              HiveDataBase.notInterestedBox!.isOpen) {
            await HiveDataBase.notInterestedBox!.clear();
            await HiveDataBase.notInterestedBox!.addAll(response);
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

  static Future<List<GetInitialDepositStatusModel>?>
  getInitialDepositStatusApi({required BuildContext context}) async {
    try {
      var res = await ApiHelperDio.getData(
        urlEndPoint: AppUrl.initialDepositStatus,
        context: context,
      );
      if (res != null) {
        List<GetInitialDepositStatusModel> response =
            GetInitialDepositStatusModel.mapToList(res);
        if (response.isNotEmpty) {
          if (HiveDataBase.initDepositStatusBox != null &&
              HiveDataBase.initDepositStatusBox!.isOpen) {
            await HiveDataBase.initDepositStatusBox!.clear();
            await HiveDataBase.initDepositStatusBox!.addAll(response);
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

  static Future<List<GetAcceptExtraFittingCostModel>?>
  getAcceptExtraFittingCostApi({required BuildContext context}) async {
    try {
      var res = await ApiHelperDio.getData(
        urlEndPoint: AppUrl.acceptExtraFittingCost,
        context: context,
      );
      if (res != null) {
        List<GetAcceptExtraFittingCostModel> response =
            GetAcceptExtraFittingCostModel.mapToList(res);
        if (response.isNotEmpty) {
          if (HiveDataBase.acceptExtraFittingCostBox != null &&
              HiveDataBase.acceptExtraFittingCostBox!.isOpen) {
            await HiveDataBase.acceptExtraFittingCostBox!.clear();
            await HiveDataBase.acceptExtraFittingCostBox!.addAll(response);
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

  static Future<List<GetAcceptConversionPolicyModel>?>
  getAcceptConversionPolicyApi({required BuildContext context}) async {
    try {
      var res = await ApiHelperDio.getData(
        urlEndPoint: AppUrl.acceptConversionPolicy,
        context: context,
      );
      if (res != null) {
        List<GetAcceptConversionPolicyModel> list =
            GetAcceptConversionPolicyModel.mapToList(res);
        if (res.isNotEmpty) {
          if (HiveDataBase.acceptConversionPolicyBox != null &&
              HiveDataBase.acceptConversionPolicyBox!.isOpen) {
            await HiveDataBase.acceptConversionPolicyBox!.clear();
            await HiveDataBase.acceptConversionPolicyBox!.addAll(list);
          }
        }
        return list;
      }
    } catch (e) {
      print("GetAcceptConversionPolicyModel-->${e.toString()}");
      Utils.errorSnackBar(msg: e.toString(), context: context);
      return null;
    }
    return null;
  }

  static Future<List<GetAllDistrictModel>?> getAllDistrictModelApi({
    required BuildContext context,
  }) async {
    String? schema = await AppConfig.instanceInit()?.loginData.user!.schema!;
    try {
      var res = await ApiHelperDio.getData(
        urlEndPoint: AppUrl.getAllDistrict + schema,
        context: context,
      );
      if (res != null) {
        List<GetAllDistrictModel> list =
            res
                .map<GetAllDistrictModel>(
                  (json) => GetAllDistrictModel.fromJson(json),
                )
                .toList();
        if (HiveDataBase.allDistrictBox != null &&
            HiveDataBase.allDistrictBox!.isOpen) {
          await HiveDataBase.allDistrictBox!.clear();
          await HiveDataBase.allDistrictBox!.addAll(list);
        }

        return list;
      }
    } catch (e) {
      print("GetAllDistrictModel-->${e.toString()}");
      Utils.errorSnackBar(msg: e.toString(), context: context);
      return null;
    }
    return null;
  }

  static Future<List<GetResidentStatusModel>?> getResidentStatusApi({
    required BuildContext context,
  }) async {
    try {
      var res = await ApiHelperDio.getData(
        urlEndPoint: AppUrl.residentStatus,
        context: context,
      );
      if (res != null) {
        List<GetResidentStatusModel> response =
            GetResidentStatusModel.mapToList(res);
        if (response.isNotEmpty) {
          if (HiveDataBase.resStatusBox != null &&
              HiveDataBase.resStatusBox!.isOpen) {
            await HiveDataBase.resStatusBox!.clear();
            await HiveDataBase.resStatusBox!.addAll(response);
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

  static Future<List<GetModeOfDepositModel>?> getModeOfDepositApi({
    required BuildContext context,
  }) async {
    try {
      var res = await ApiHelperDio.getData(
        urlEndPoint: AppUrl.modeOfDeposit,
        context: context,
      );
      if (res != null) {
        List<GetModeOfDepositModel> response = GetModeOfDepositModel.mapToList(
          res,
        );
        if (HiveDataBase.modeOfDepositBox != null &&
            HiveDataBase.modeOfDepositBox!.isOpen) {
          await HiveDataBase.modeOfDepositBox!.clear();
          await HiveDataBase.modeOfDepositBox!.addAll(response);
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

  static Future<List<GetEBillingModel>?> getEBillingApi({
    required BuildContext context,
  }) async {
    try {
      var res = await ApiHelperDio.getData(
        urlEndPoint: AppUrl.eBilling,
        context: context,
      );
      if (res != null) {
        List<GetEBillingModel> response = GetEBillingModel.mapToList(res);
        if (response.isNotEmpty) {
          if (HiveDataBase.eBillingBox != null &&
              HiveDataBase.eBillingBox!.isOpen) {
            await HiveDataBase.eBillingBox!.clear();
            await HiveDataBase.eBillingBox!.addAll(response);
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

  static Future<List<GetKycDocModel>?> getKycDocApi({
    required BuildContext context,
  }) async {
    try {
      var res = await ApiHelperDio.getData(
        urlEndPoint: AppUrl.kycDoc,
        context: context,
      );
      log("resKycDoc-->${res}");
      if (res != null) {
        List<GetKycDocModel> response = GetKycDocModel.mapToList(res);
        log("responseKycDoc-->${response}");
        if (response.isNotEmpty) {
          if (HiveDataBase.kycDocBox != null && HiveDataBase.kycDocBox!.isOpen) {
            await HiveDataBase.kycDocBox!.clear();
            await HiveDataBase.kycDocBox!.addAll(response);
          }
        }
        return response;
      }
    } catch (e) {
      print("GetKycDocModel-->${e.toString()}");
      Utils.errorSnackBar(msg: e.toString(), context: context);
      return null;
    }
    return null;
  }

  static Future<List<GetOwnershipProofModel>?> getOwnershipProofApi({
    required BuildContext context,
  }) async {
    try {
      final res = await ApiHelperDio.getData(
        urlEndPoint: AppUrl.ownershipProof,
        context: context,
      );
      if (res != null) {
        List<GetOwnershipProofModel> response =
            GetOwnershipProofModel.mapToList(res);
        if (response.isNotEmpty) {
          if (HiveDataBase.ownershipProofBox != null &&
              HiveDataBase.ownershipProofBox!.isOpen) {
            await HiveDataBase.ownershipProofBox!.clear();
            await HiveDataBase.ownershipProofBox!.addAll(response);
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

  static Future<List<GetIdentityProofModel>?> getIdentityProofApi({
    required BuildContext context,
  }) async {
    try {
      var res = await ApiHelperDio.getData(
        urlEndPoint: AppUrl.identityProof,
        context: context,
      );
      if (res != null) {
        List<GetIdentityProofModel> response = GetIdentityProofModel.mapToList(
          res,
        );
        if (response.isNotEmpty) {
          if (HiveDataBase.idProofBox != null &&
              HiveDataBase.idProofBox!.isOpen) {
            await HiveDataBase.idProofBox!.clear();
            await HiveDataBase.idProofBox!.addAll(response);
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

  static Future<List<GetGuardianTypeModel>?> getGuardianTypeApi({
    required BuildContext context,
  }) async {
    try {
      var res = await ApiHelperDio.getData(
        urlEndPoint: AppUrl.guardianType,
        context: context,
      );
      if (res != null) {
        List<GetGuardianTypeModel> response = GetGuardianTypeModel.mapToList(
          res,
        );
        if (response.isNotEmpty) {
          if (HiveDataBase.guardianTypeBox != null &&
              HiveDataBase.guardianTypeBox!.isOpen) {
            await HiveDataBase.guardianTypeBox!.clear();
            await HiveDataBase.guardianTypeBox!.addAll(response);
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

  static Future<List<GetExistingCookingFuelModel>?> getExistingCookingFuelApi({
    required BuildContext context,
  }) async {
    try {
      var res = await ApiHelperDio.getData(
        urlEndPoint: AppUrl.existingCookingFuel,
        context: context,
      );
      if (res != null) {
        List<GetExistingCookingFuelModel> response =
            GetExistingCookingFuelModel.mapToList(res);
        if (response.isNotEmpty) {
          if (HiveDataBase.cookingFuelBox != null &&
              HiveDataBase.cookingFuelBox!.isOpen) {
            await HiveDataBase.cookingFuelBox!.clear();
            await HiveDataBase.cookingFuelBox!.addAll(response);
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

  static Future<List<GetSocietyAllowModel>?> getSocietyAllowApi({
    required BuildContext context,
  }) async {
    try {
      var res = await ApiHelperDio.getData(
        urlEndPoint: AppUrl.societyAllow,
        context: context,
      );
      if (res != null) {
        List<GetSocietyAllowModel> response = GetSocietyAllowModel.mapToList(
          res,
        );
        if (response.isNotEmpty) {
          if (HiveDataBase.societyAllowBox != null &&
              HiveDataBase.societyAllowBox!.isOpen) {
            await HiveDataBase.societyAllowBox!.clear();
            await HiveDataBase.societyAllowBox!.addAll(response);
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

  static Future<List<GetPropertyClassModel>?> getPropertyClassApi({
    required BuildContext context,
  }) async {
    String? schema = await AppConfig.instanceInit()?.loginData.user!.schema!;
    try {
      var res = await ApiHelperDio.getData(
        urlEndPoint: AppUrl.getPropertyClass + schema,
        context: context,
      );
      if (res != null) {
        List<GetPropertyClassModel> list =
            res
                .map<GetPropertyClassModel>(
                  (json) => GetPropertyClassModel.fromJson(json),
                )
                .toList();
        if (res.isNotEmpty) {
          if (HiveDataBase.proClassBox != null &&
              HiveDataBase.proClassBox!.isOpen) {
            await HiveDataBase.proClassBox!.clear();
            await HiveDataBase.proClassBox!.addAll(list);
          }
        }
        return list;
      }
    } catch (e) {
      print("GetPropertyClassModel-->${e.toString()}");
      Utils.errorSnackBar(msg: e.toString(), context: context);
      return null;
    }
    return null;
  }

  static Future<List<GetPropertyCategoryModel>?> getPropertyCategoryApi({
    required BuildContext context,
  }) async {
    String? schema = await AppConfig.instanceInit()?.loginData.user!.schema!;
    try {
      var res = await ApiHelperDio.getData(
        urlEndPoint: AppUrl.getPropertyCategory + schema,
        context: context,
      );
      if (res != null) {
        List<GetPropertyCategoryModel> list =
            res
                .map<GetPropertyCategoryModel>(
                  (json) => GetPropertyCategoryModel.fromJson(json),
                )
                .toList();
        if (res.isNotEmpty) {
          if (HiveDataBase.proCateBox != null &&
              HiveDataBase.proCateBox!.isOpen) {
            await HiveDataBase.proCateBox!.clear();
            await HiveDataBase.proCateBox!.addAll(list);
          }
        }
        return list;
      }
    } catch (e) {
      print("GetPropertyCategoryModel-->${e.toString()}");
      Utils.errorSnackBar(msg: e.toString(), context: context);
      return null;
    }
    return null;
  }

  static Future<List<GetAllAreaModel>?> getAllAreaApi({
    required BuildContext context,
  }) async {
    String? schema = await AppConfig.instanceInit()?.loginData.user!.schema!;
    try {
      var res = await ApiHelperDio.getData(
        urlEndPoint: AppUrl.getAllArea + schema,
        context: context,
      );
      if (res != null) {
        List<GetAllAreaModel> list =
            res
                .map<GetAllAreaModel>((json) => GetAllAreaModel.fromJson(json))
                .toList();
        if (res.isNotEmpty) {
          if (HiveDataBase.allAreaBox != null &&
              HiveDataBase.allAreaBox!.isOpen) {
            await HiveDataBase.allAreaBox!.clear();
            await HiveDataBase.allAreaBox!.addAll(list);
          }
        }
        return list;
      }
    } catch (e) {
      print("GetAllAreaModel-->${e.toString()}");
      Utils.errorSnackBar(msg: e.toString(), context: context);
      return null;
    }
    return null;
  }

  static Future<List<GetChargeAreaListModel>?> getChargeAreaListApi({
    required BuildContext context,
  }) async {
    String? schema = await AppConfig.instanceInit()?.loginData.user!.schema!;
    try {
      var res = await ApiHelperDio.getData(
        urlEndPoint: AppUrl.getChargeAreaList + schema,
        context: context,
      );
      if (res != null) {
        List<GetChargeAreaListModel> list =
            res
                .map<GetChargeAreaListModel>(
                  (json) => GetChargeAreaListModel.fromJson(json),
                )
                .toList();
        if (res.isNotEmpty) {
          if (HiveDataBase.chargeAreaListBox != null &&
              HiveDataBase.chargeAreaListBox!.isOpen) {
            await HiveDataBase.chargeAreaListBox!.clear();
            await HiveDataBase.chargeAreaListBox!.addAll(list);
          }
        }
        return list;
      }
    } catch (e) {
      print("GetChargeAreaListModel-->${e.toString()}");
      Utils.errorSnackBar(msg: e.toString(), context: context);
      return null;
    }
    return null;
  }

  static Future<List<GetAllDepositOfflineModel>?> getAllDepositOfflineApi({
    required BuildContext context,
  }) async {
    String? schema = await AppConfig.instanceInit()?.loginData.user!.schema!;
    try {
      var res = await ApiHelperDio.getData(
        urlEndPoint: AppUrl.getAllDepositOffline + schema,
        context: context,
      );
      if (res != null) {
        List<GetAllDepositOfflineModel> list =
            res
                .map<GetAllDepositOfflineModel>(
                  (json) => GetAllDepositOfflineModel.fromJson(json),
                )
                .toList();
        if (res.isNotEmpty) {
          if (HiveDataBase.allDepositOfflineBox != null &&
              HiveDataBase.allDepositOfflineBox!.isOpen) {
            await HiveDataBase.allDepositOfflineBox!.clear();
            await HiveDataBase.allDepositOfflineBox!.addAll(list);
          }
        }
        return list;
      }
    } catch (e) {
      print("GetAllDepositOfflineModel-->${e.toString()}");
      Utils.errorSnackBar(msg: e.toString(), context: context);
      return null;
    }
    return null;
  }

  static Future<List<String>?> getBankNameListApi({
    required BuildContext context,
  }) async {
    try {
      var res = await ApiHelperDio.getData(
        urlEndPoint: AppUrl.getAllBanks,
        context: context,
      );
      if (res != null) {
        List<String> response = List<String>.from(res);
        if (response.isNotEmpty) {
          if (HiveDataBase.getAllBanksBox != null &&
              HiveDataBase.getAllBanksBox!.isOpen) {
            await HiveDataBase.getAllBanksBox!.clear();
            await HiveDataBase.getAllBanksBox!.addAll(response);
          }
        }
        return response;
      }
    } catch (e) {
      print("getAllBanksBox-->${e.toString()}");
      Utils.errorSnackBar(msg: e.toString(), context: context);
      return null;
    }
    return null;
  }

  static Future<File?> cameraCapture() async {
    await Permission.camera.request();
    final XFile? file = await ImagePicker().pickImage(
      source: ImageSource.camera,
      imageQuality: 50,
      maxHeight: 900,
      maxWidth: 1000,
    );
    File files = File(file!.path);
    return files;
  }

  static Future<File?> galleryCapture() async {
    await Permission.storage.request();
    final XFile? file = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
      maxHeight: 900,
      maxWidth: 1000,
    );
    File files = File(file!.path);
    return files;
  }

  static Future<Position?> getCurrentLocation() async {
    await Geolocator.requestPermission();
    await Permission.locationAlways.request();
    if (Platform.isAndroid) {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
        forceAndroidLocationManager: true,
        locationSettings: LocationSettings(),
      );
      log('latitude : ${position.latitude} longitude : ${position.longitude}');
      return position;
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
