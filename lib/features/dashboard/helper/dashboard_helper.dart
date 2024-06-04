import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pbg_app/ExportFile/export_file.dart';
import 'package:pbg_app/features/dashboard/domain/model/get_bank_name_list_model.dart';

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

  static Future< List<GetNotInterestedModel>?> getNotInterestedApi({required BuildContext context}) async {
    try {
      var res = await ApiServer.getData(urlEndPoint: AppUrl.notInterested, context: context);
      if (res != null) {
        List<GetNotInterestedModel> response = GetNotInterestedModel.mapToList(jsonDecode(res));
        if (response.isNotEmpty) {
          if (await HiveDataBase.notInterestedBox!.isOpen) {
            await HiveDataBase.notInterestedBox!.clear();
            HiveDataBase.notInterestedBox!.addAll(response);
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


  static Future<List<GetInitialDepositStatusModel>?> getInitialDepositStatusApi({required BuildContext context}) async {
    try {
      var res = await ApiServer.getData(urlEndPoint: AppUrl.initialDepositStatus, context: context);
      if (res != null) {
        List<GetInitialDepositStatusModel> response = GetInitialDepositStatusModel.mapToList(jsonDecode(res));
        if (response.isNotEmpty) {
          if (await HiveDataBase.initDepositStatusBox!.isOpen) {
            await HiveDataBase.initDepositStatusBox!.clear();
            HiveDataBase.initDepositStatusBox!.addAll(response);
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

  static Future<List<GetAcceptExtraFittingCostModel>?> getAcceptExtraFittingCostApi({required BuildContext context}) async {
    try {
      var res = await ApiServer.getData(urlEndPoint: AppUrl.acceptExtraFittingCost, context: context);
        if (res != null) {
          List<GetAcceptExtraFittingCostModel> response = GetAcceptExtraFittingCostModel.mapToList(jsonDecode(res));
          if (response.isNotEmpty) {
            if (await HiveDataBase.acceptExtraFittingCostBox!.isOpen) {
              await HiveDataBase.acceptExtraFittingCostBox!.clear();
              HiveDataBase.acceptExtraFittingCostBox!.addAll(response);
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

  static Future<List<GetAcceptConversionPolicyModel>?> getAcceptConversionPolicyApi({required BuildContext context}) async {
    try {
        var res = await ApiServer.getData(urlEndPoint: AppUrl.acceptConversionPolicy, context: context);
      if (res != null) {
        List<GetAcceptConversionPolicyModel> response = GetAcceptConversionPolicyModel.mapToList(jsonDecode(res));
        if (response.isNotEmpty) {
          if (await HiveDataBase.acceptConversionPolicyBox!.isOpen) {
            await HiveDataBase.acceptConversionPolicyBox!.clear();
            HiveDataBase.acceptConversionPolicyBox!.addAll(response);
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
    String schema = await SharedPref.getString(key: PrefsValue.schema);
    try {
        var res = await ApiServer.getData(urlEndPoint: AppUrl.getAllDistrict + schema, context: context);
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

  static Future<List<GetResidentStatusModel>?> getResidentStatusApi({required BuildContext context}) async {
    try {
        var res = await ApiServer.getData(urlEndPoint: AppUrl.residentStatus, context: context);
      if (res != null) {
        List<GetResidentStatusModel> response = GetResidentStatusModel.mapToList(jsonDecode(res));
        if (response.isNotEmpty) {
          if (await HiveDataBase.resStatusBox!.isOpen) {
            await HiveDataBase.resStatusBox!.clear();
            HiveDataBase.resStatusBox!.addAll(response);
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

  static Future<List<GetModeOfDepositModel>?> getModeOfDepositApi({required BuildContext context}) async {
    try {
        var res = await ApiServer.getData(urlEndPoint: AppUrl.modeOfDeposit, context: context);
        if (res != null) {
        List<GetModeOfDepositModel> response = GetModeOfDepositModel.mapToList(jsonDecode(res));
        if (response.isNotEmpty) {
          if (await HiveDataBase.modeOfDepositBox!.isOpen) {
            await HiveDataBase.modeOfDepositBox!.clear();
            HiveDataBase.modeOfDepositBox!.addAll(response);
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

  static Future<List<GetEBillingModel>?> getEBillingApi({required BuildContext context}) async {
    try {
        var res = await ApiServer.getData(urlEndPoint: AppUrl.eBilling, context: context,);
        if (res != null) {
        List<GetEBillingModel> response = GetEBillingModel.mapToList(jsonDecode(res));
        if (response.isNotEmpty) {
          if (await HiveDataBase.eBillingBox!.isOpen) {
            await HiveDataBase.eBillingBox!.clear();
            HiveDataBase.eBillingBox!.addAll(response);
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

  static Future<List<GetKycDocModel>?> getKycDocApi({required BuildContext context}) async {
    try {
        var res = await ApiServer.getData(urlEndPoint: AppUrl.kycDoc, context: context);
        if (res != null) {
          List<GetKycDocModel> response = GetKycDocModel.mapToList(jsonDecode(res));
          if (response.isNotEmpty) {
            if (await HiveDataBase.kycDocBox!.isOpen) {
              await HiveDataBase.kycDocBox!.clear();
              HiveDataBase.kycDocBox!.addAll(response);
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

  static Future<List<GetOwnershipProofModel>?> getOwnershipProofApi({required BuildContext context}) async {
    try {
        final res = await ApiServer.getData(urlEndPoint: AppUrl.ownershipProof, context: context);
        if (res != null) {
          List<GetOwnershipProofModel> response = GetOwnershipProofModel.mapToList(jsonDecode(res));
          if (response.isNotEmpty) {
            if (await HiveDataBase.ownershipProofBox!.isOpen) {
              await HiveDataBase.ownershipProofBox!.clear();
              HiveDataBase.ownershipProofBox!.addAll(response);
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

  static Future<List<GetIdentityProofModel>?> getIdentityProofApi({required BuildContext context}) async {
    try {
        var res = await ApiServer.getData(urlEndPoint: AppUrl.identityProof, context: context);
        if (res != null) {
          List<GetIdentityProofModel> response = GetIdentityProofModel.mapToList(jsonDecode(res));
          if (response.isNotEmpty) {
            if (await HiveDataBase.idProofBox!.isOpen) {
              await HiveDataBase.idProofBox!.clear();
              HiveDataBase.idProofBox!.addAll(response);
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

  static Future<List<GetGuardianTypeModel>?> getGuardianTypeApi({required BuildContext context}) async {
    try {
        var res = await ApiServer.getData(urlEndPoint: AppUrl.guardianType, context: context);
        if (res != null) {
          List<GetGuardianTypeModel> response = GetGuardianTypeModel.mapToList(jsonDecode(res));
          if (response.isNotEmpty) {
            if (await HiveDataBase.guardianTypeBox!.isOpen) {
              await HiveDataBase.guardianTypeBox!.clear();
              HiveDataBase.guardianTypeBox!.addAll(response);
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

  static Future<List<GetExistingCookingFuelModel>?> getExistingCookingFuelApi({required BuildContext context}) async {
    try {
        var res = await ApiServer.getData(urlEndPoint: AppUrl.existingCookingFuel, context: context);
        if (res != null) {
          List<GetExistingCookingFuelModel> response = GetExistingCookingFuelModel.mapToList(jsonDecode(res));
          if (response.isNotEmpty) {
            if (await HiveDataBase.cookingFuelBox!.isOpen) {
              await HiveDataBase.cookingFuelBox!.clear();
              HiveDataBase.cookingFuelBox!.addAll(response);
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

  static Future<List<GetSocietyAllowModel>?> getSocietyAllowApi({required BuildContext context}) async {
    try {
        var res = await ApiServer.getData(urlEndPoint: AppUrl.societyAllow, context: context);
        if (res != null) {
          List<GetSocietyAllowModel> response = GetSocietyAllowModel.mapToList(jsonDecode(res));
          if (response.isNotEmpty) {
            if (await HiveDataBase.societyAllowBox!.isOpen) {
              await HiveDataBase.societyAllowBox!.clear();
              HiveDataBase.societyAllowBox!.addAll(response);
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
    String schema = await SharedPref.getString(key: PrefsValue.schema);
    try {
        var res = await ApiServer.getData(urlEndPoint: AppUrl.getPropertyClass + schema, context: context);
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
    String schema = await SharedPref.getString(key: PrefsValue.schema);
    try {
        var res = await ApiServer.getData(urlEndPoint: AppUrl.getPropertyCategory + schema, context: context);
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
    String schema = await SharedPref.getString(key: PrefsValue.schema);
    try {
        var res = await ApiServer.getData(urlEndPoint: AppUrl.getAllArea + schema, context: context);
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
    String schema = await SharedPref.getString(key: PrefsValue.schema);
    try {
      var res = await ApiServer.getData(urlEndPoint: AppUrl.getChargeAreaList + schema, context: context);
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
    String schema = await SharedPref.getString(key: PrefsValue.schema);
    try {
        var res = await ApiServer.getData(urlEndPoint: AppUrl.getAllDepositOffline + schema, context: context);
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
          SharedPref.setString(key: PrefsValue.getAllBanks, value: jsonEncode(bankNameListModelFromJson(res)));
          return bankNameListModelFromJson(res);
        }
      } else {
        return bankNameListModelFromJson(SharedPref.getString(key: PrefsValue.getAllBanks) ?? "");
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
