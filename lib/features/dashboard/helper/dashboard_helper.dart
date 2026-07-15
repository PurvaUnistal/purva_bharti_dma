import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:pbg_app/ExportFile/export_file.dart';
import 'package:pbg_app/Service/api_server_dio.dart';
import 'package:pbg_app/Utils/common_widgets/res/app_config.dart';
import 'package:pbg_app/features/dashboard/domain/model/get_connection_type_model.dart';
import 'package:pbg_app/features/dashboard/domain/model/get_customer_details_model.dart';
import 'package:pbg_app/features/dashboard/domain/model/get_name_title_model.dart';
import 'package:pbg_app/features/dashboard/domain/model/get_property_type_model.dart';

class DashboardHelper {
  static Future<T?> _fetchOne<T>({
    required BuildContext context,
    required bool online,
    required String urlEndPoint,
    required T Function(dynamic res) parse,
    required String tag,
    Box<dynamic>? box,
  }) async {
    if (!online) {
      if (box != null && box.isOpen && box.isNotEmpty) {
        return box.values.first as T;
      }
      return null;
    }
    try {
      final res = await ServerRequest.getData(urlEndPoint: urlEndPoint);
      if (res == null) return null;

      final T model = parse(res);
      if (box != null && box.isOpen) {
        await box.clear();
        await box.add(model);
      }
      return model;
    } catch (e, st) {
      log('$tag -->$e', error: e, stackTrace: st);
      if (context.mounted) {
        Utils.errorSnackBar(msg: e.toString(), context: context);
      }
      return null;
    }
  }

  static Future<List<T>?> _fetchList<T>({
    required BuildContext context,
    required bool online,
    required String urlEndPoint,
    required List<T> Function(dynamic res) parse,
    required String tag,
    Box<dynamic>? box,
  }) async {
    if (!online) {
      if (box != null && box.isOpen) {
        return box.values.cast<T>().toList();
      }
      return null;
    }
    try {
      final res = await ServerRequest.getData(urlEndPoint: urlEndPoint);
      if (res == null) return null;

      final List<T> list = parse(res);
      if (list.isNotEmpty && box != null && box.isOpen) {
        await box.clear();
        await box.addAll(list);
      }
      return list;
    } catch (e, st) {
      log('$tag -->$e', error: e, stackTrace: st);
      if (context.mounted) {
        Utils.errorSnackBar(msg: e.toString(), context: context);
      }
      return null;
    }
  }

  static String _schema() =>
      AppConfig.instanceInit()?.loginData.user?.schema ?? '';

  static Future<GetLabelModel?> getLabelApi({
    required BuildContext context,
    required bool online,
  }) => _fetchOne<GetLabelModel>(
    context: context,
    online: online,
    urlEndPoint: AppUrl.getLabel,
    parse: (res) => GetLabelModel.fromJson(res),
    box: HiveDataBase.allLabelBox,
    tag: 'GetLabelModel',
  );

  static Future<List<T>?> fetchConstantData<T>({
    required BuildContext context,
    required bool online,
    required String key,
    required T Function(String id, dynamic value) fromEntry,
    required Box<T> box,
  }) => _fetchList<T>(
    context: context,
    online: online,
    urlEndPoint: "${AppUrl.getConstant}?key=$key",
    parse: (res) {
      if (res is Map<String, dynamic>) {
        return res.entries
            .map((entry) => fromEntry(entry.key, entry.value))
            .toList();
      }
      return [];
    },
    box: box,
    tag: 'constant_$key',
  );

  static Future<List<GetNotInterestedModel>?> getNotInterestedApi({
    required BuildContext context,
    required bool online,
  }) {
    final box = HiveDataBase.notInterestedBox;
    if (box == null) return Future.value(null);

    return fetchConstantData<GetNotInterestedModel>(
      context: context,
      online: online,
      key: 'notIntrested',
      fromEntry: (id, value) => GetNotInterestedModel(key: id, value: value.toString()),
      box: box,
    );
  }

  static Future<List<GetEBillingModel>?> getEBillingApi({
    required BuildContext context,
    required bool online,
  }) {
    final box = HiveDataBase.eBillingBox;
    if (box == null) return Future.value(null);

    return fetchConstantData<GetEBillingModel>(
      context: context,
      online: online,
      key: 'ebilling',
      fromEntry: (id, value) => GetEBillingModel(key: id, value: value.toString()),
      box: box,
    );
  }

  static Future<List<GetKycDocModel>?> getKycDocApi({
    required BuildContext context,
    required bool online,
  }) {
    final box = HiveDataBase.kycDocBox;
    if (box == null) return Future.value(null);

    return fetchConstantData<GetKycDocModel>(
      context: context,
      online: online,
      key: 'kycDoc',
      fromEntry: (id, value) => GetKycDocModel(key: id, value: value.toString()),
      box: box,
    );
  }

  static Future<List<GetOwnershipProofModel>?> getOwnershipProofApi({
    required BuildContext context,
    required bool online,
  }) {
    final box = HiveDataBase.ownershipProofBox;
    if (box == null) return Future.value(null);
    return fetchConstantData<GetOwnershipProofModel>(
      context: context,
      online: online,
      key: 'ownershipProof',
      fromEntry: (id, value) => GetOwnershipProofModel(key: id, value: value.toString()),
      box: box,
    );
  }

  static Future<List<GetOwnershipProofModel>?> getIdentityProofApi({
    required BuildContext context,
    required bool online,
  }) {
    final box = HiveDataBase.ownershipProofBox;
    if (box == null) return Future.value(null);
    return fetchConstantData<GetOwnershipProofModel>(
      context: context,
      online: online,
      key: 'identityProof',
      fromEntry:(id, value) => GetOwnershipProofModel(key: id, value: value.toString()),
      box: box,
    );
  }

  static Future<List<GetGuardianTypeModel>?> getGuardianTypeApi({
    required BuildContext context,
    required bool online,
  }) {
    final box = HiveDataBase.guardianTypeBox;
    if (box == null) return Future.value(null);
    return fetchConstantData<GetGuardianTypeModel>(
      context: context,
      online: online,
      key: 'guardian_type',
      fromEntry: (id, value) => GetGuardianTypeModel(key: id, value: value.toString()),
      box: box,
    );
  }

  static Future<List<GetExistingCookingFuelModel>?> getExistingCookingFuelApi({
    required BuildContext context,
    required bool online,
  }) {
    final box = HiveDataBase.cookingFuelBox;
    if (box == null) return Future.value(null);
    return fetchConstantData<GetExistingCookingFuelModel>(
      context: context,
      online: online,
      key: 'existingCookingFuel',
      fromEntry: (id, value) => GetExistingCookingFuelModel(key: id, value: value.toString()),
      box: box,
    );
  }

  static Future<List<GetResidentStatusModel>?> getResidentStatusApi({
    required BuildContext context,
    required bool online,
  }) {
    final box = HiveDataBase.resStatusBox;
    if (box == null) return Future.value(null);
    return fetchConstantData<GetResidentStatusModel>(
      context: context,
      online: online,
      key: 'residentStatus',
      fromEntry: (id, value) => GetResidentStatusModel(key: id, value: value.toString()),
      box: box,
    );
  }

  static Future<List<GetSocietyAllowModel>?> getSocietyAllowApi({
    required BuildContext context,
    required bool online,
  }) {
    final box = HiveDataBase.societyAllowBox;
    if (box == null) return Future.value(null);
    return fetchConstantData<GetSocietyAllowModel>(
      context: context,
      online: online,
      key: 'societyAllow',
      fromEntry: (id, value) => GetSocietyAllowModel(key: id, value: value.toString()),
      box: box,
    );
  }

  static Future<List<GetInitialDepositStatusModel>?>
  getInitialDepositStatusApi({
    required BuildContext context,
    required bool online,
  }) {
    final box = HiveDataBase.initDepositStatusBox;
    if (box == null) return Future.value(null);
    return fetchConstantData<GetInitialDepositStatusModel>(
      context: context,
      online: online,
      key: 'initialDepositeStatus',
      fromEntry: (id, value) => GetInitialDepositStatusModel(key: id, value: value.toString()),
      box: box,
    );
  }

  static Future<List<GetModeOfDepositModel>?> getModeOfDepositApi({
    required BuildContext context,
    required bool online,
  }) {
    final box = HiveDataBase.modeOfDepositBox;
    if (box == null) return Future.value(null);
    return fetchConstantData<GetModeOfDepositModel>(
      context: context,
      online: online,
      key: 'modeOfDeposite',
      fromEntry: (id, value) => GetModeOfDepositModel(key: id, value: value.toString()),
      box: box,
    );
  }

  static Future<List<GetAcceptExtraFittingCostModel>?>
  getAcceptExtraFittingCostApi({
    required BuildContext context,
    required bool online,
  }) {
    final box = HiveDataBase.acceptExtraFittingCostBox;
    if (box == null) return Future.value(null);
    return fetchConstantData<GetAcceptExtraFittingCostModel>(
      context: context,
      online: online,
      key: 'acceptExtraFittingCost',
      fromEntry: (id, value) => GetAcceptExtraFittingCostModel(key: id, value: value.toString()),
      box: box,
    );
  }

  static Future<List<GetAcceptConversionPolicyModel>?>
  getAcceptConversionPolicyApi({
    required BuildContext context,
    required bool online,
  }) {
    final box = HiveDataBase.acceptConversionPolicyBox;
    if (box == null) return Future.value(null);
    return fetchConstantData<GetAcceptConversionPolicyModel>(
      context: context,
      online: online,
      key: 'acceptConversionPolicy',
      fromEntry: (id, value) => GetAcceptConversionPolicyModel(key: id, value: value.toString()),
      box: box,
    );
  }
  static Future<List<CustomerDetailsModel>?> getPngrbCustomerDataApi({
    required BuildContext context,
    required String applicationNo,
  }) {

    if (applicationNo.trim().isEmpty) {
      if (context.mounted) {
        Utils.errorSnackBar(msg: 'Application number is required', context: context);
      }
      return Future.value(null);
    }
    var param = {
      "schema": _schema(),
      "application_number": applicationNo.trim(),
    };
    String query = Uri(queryParameters: param).query;
    String url = "${AppUrl.getPngrbCustomerData}?$query";
    return _fetchList<CustomerDetailsModel>(
      context: context,
      online: true,
      urlEndPoint: url,
      parse: (res) {
        if (res is Map<String, dynamic>) {
          if (res['status'] == 'error') {
          //  throw Exception(res['message']?.toString() ?? 'Server error');
          }
          return [CustomerDetailsModel.fromJson(res)];
        }
        return <CustomerDetailsModel>[];
      },
      box: null,
      tag: 'getPngrbCustomerData',
    );
  }

  static Future<List<String>?> getBankNameListApi({
    required BuildContext context,
    required bool online,
  }) => _fetchList<String>(
    context: context,
    online: online,
    urlEndPoint: AppUrl.getAllBanks,
    parse: (res) => List<String>.from(res),
    box: HiveDataBase.getAllBanksBox,
    tag: 'getAllBanksBox',
  );

  static Future<List<GetAllDistrictModel>?> getAllDistrictModelApi({
    required BuildContext context,
    required bool online,
  }) {
    var param = {"schema": _schema()};
    String json = Uri(queryParameters: param).query;
    String url = "${AppUrl.getAllDistrict}?$json";
    return _fetchList<GetAllDistrictModel>(
      context: context,
      online: online,
      urlEndPoint: url,
      parse: (res) => (res as List).map((json) => GetAllDistrictModel.fromJson(json)).toList(),
      box: HiveDataBase.allDistrictBox,
      tag: 'GetAllDistrictModel',
    );
  }

  static Future<List<GetPropertyClassModel>?> getPropertyClassApi({
    required BuildContext context,
    required bool online,
  }) {
    var param = {"schema": _schema()};
    String json = Uri(queryParameters: param).query;
    String url = "${AppUrl.getPropertyClass}?$json";
    return _fetchList<GetPropertyClassModel>(
      context: context,
      online: online,
      urlEndPoint: url,
      parse: (res) => (res as List).map((json) {
                final model = GetPropertyClassModel.fromJson(json);
                return model;
              }).toList(),
      box: HiveDataBase.proClassBox,
      tag: 'GetPropertyClassModel',
    );
  }

  static Future<List<GetNameTitleModel>?> getTitleApi({
    required BuildContext context,
    required bool online,
  }) {
    var param = {"schema": _schema()};
    String json = Uri(queryParameters: param).query;
    String url = "${AppUrl.getTitle}?$json";
    return _fetchList<GetNameTitleModel>(
      context: context,
      online: online,
      urlEndPoint: url,
      parse: (res) => (res as List).map((json) {
                final model = GetNameTitleModel.fromJson(json);
                return model;
              }).toList(),
      box: HiveDataBase.nameTitleBox,
      tag: 'GetNameTitleModel',
    );
  }

  static Future<List<ConnectionTypeModel>?> getDmaRegFormApi({
    required BuildContext context,
    required bool online,
  }) {
    var param = {"schema": _schema()};
    String json = Uri(queryParameters: param).query;
    String url = "${AppUrl.getDmaRegForm}?$json";
    return _fetchList<ConnectionTypeModel>(
      context: context,
      online: online,
      urlEndPoint:url,
      parse: (res) => (res as List).map((json) {
                final model = ConnectionTypeModel.fromJson(json);
                return model;
              }).toList(),
      box: HiveDataBase.dmaRegFormBox,
      tag: 'getDmaRegForm',
    );
  }

  static Future<List<ConnectionTypeModel>?> getMeterTypeApi({
    required BuildContext context,
    required bool online,
  }) {
    var param = {"schema": _schema()};
    String json = Uri(queryParameters: param).query;
    String url = "${AppUrl.getMeterType}?$json";
    return _fetchList<ConnectionTypeModel>(
      context: context,
      online: online,
      urlEndPoint: url,
      parse: (res) => (res as List).map((json) {
                final model = ConnectionTypeModel.fromJson(json);
                return model;
              }).toList(),
      box: HiveDataBase.meterTypeBox,
      tag: 'getMeterType',
    );
  }

  static Future<List<PropertyTypeModel>?> getHouseHoldTypeApi({
    required BuildContext context,
    required bool online,
    required String propertyCategoryId,
  }) {
    var param = {
      "schema": _schema(),
      "property_category_id":
      propertyCategoryId.isNotEmpty ? propertyCategoryId : "89",
    };
    String json = Uri(queryParameters: param).query;
    String url = "${AppUrl.getHouseHoldType}?$json";
    return _fetchList<PropertyTypeModel>(
      context: context,
      online: online,
      urlEndPoint:url,
      parse: (res) => (res as List).map((json) {
        final model = PropertyTypeModel.fromJson(json);
                return model;
              }).toList(),
      box: HiveDataBase.houseHoldTypeBox,
      tag: 'houseHoldTypeBox',
    );
  }

  static Future<List<GetPropertyCategoryModel>?> getPropertyCategoryApi({
    required BuildContext context,
    required bool online,
  }) {
    var param = {"schema": _schema()};
    String json = Uri(queryParameters: param).query;
    String url = "${AppUrl.getPropertyCategory}?$json";
    return _fetchList<GetPropertyCategoryModel>(
      context: context,
      online: online,
      urlEndPoint: url,
      parse: (res) => (res as List).map((json) => GetPropertyCategoryModel.fromJson(json)).toList(),
      box: HiveDataBase.proCateBox,
      tag: 'GetPropertyCategoryModel',
    );
  }

  static Future<List<GetAllAreaModel>?> getAllAreaApi({
    required BuildContext context,
    required bool online,
}) {
    var param = {"schema": _schema()};
    String json = Uri(queryParameters: param).query;
    String url = "${AppUrl.getAllArea}?$json";
    return _fetchList<GetAllAreaModel>(
      context: context,
      online: online,
      urlEndPoint: url,
      parse: (res) => (res as List).map((json) => GetAllAreaModel.fromJson(json)).toList(),
      box: HiveDataBase.allAreaBox,
      tag: 'GetAllAreaModel',
    );
  }

  static Future<List<GetChargeAreaListModel>?> getChargeAreaListApi({
    required BuildContext context,
    required bool online,
}) {
    var param = {"schema": _schema()};
    String json = Uri(queryParameters: param).query;
    String url = "${AppUrl.getChargeAreaList}?$json";
    return _fetchList<GetChargeAreaListModel>(
      context: context,
      online: online,
      urlEndPoint:url,
      parse: (res) => (res as List).map((json) => GetChargeAreaListModel.fromJson(json)).toList(),
      box: HiveDataBase.chargeAreaListBox,
      tag: 'GetChargeAreaListModel',
    );
  }

  static Future<List<GetAllDepositOfflineModel>?> getAllDepositOfflineApi({
    required BuildContext context,
    required bool online,
}) {
    var param = {"schema": _schema()};
    String json = Uri(queryParameters: param).query;
    String url = "${AppUrl.getAllDepositOffline}?$json";
    return _fetchList<GetAllDepositOfflineModel>(
      context: context,
      online: online,
      urlEndPoint: url,
      parse: (res) => (res as List).map((json) => GetAllDepositOfflineModel.fromJson(json)).toList(),
      box: HiveDataBase.allDepositOfflineBox,
      tag: 'GetAllDepositOfflineModel',
    );
  }

  static Future<File?> cameraCapture() async {
    await Permission.camera.request();
    final XFile? file = await ImagePicker().pickImage(
      source: ImageSource.camera,
      imageQuality: 50,
      maxHeight: 900,
      maxWidth: 1000,
    );
    if (file == null) return null;
    return File(file.path);
  }

  static Future<File?> galleryCapture() async {
    await Permission.storage.request();
    final XFile? file = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
      maxHeight: 900,
      maxWidth: 1000,
    );
    if (file == null) return null;
    return File(file.path);
  }

  static Future<Position?> getCurrentLocation() async {
    final permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      return null;
    }
    await Permission.locationAlways.request();
    final position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
      forceAndroidLocationManager: Platform.isAndroid,
      locationSettings: const LocationSettings(),
    );
    log('latitude : ${position.latitude} longitude : ${position.longitude}');
    return position;
  }

  static Future<bool> isInternetConnected() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result.first.rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }
}
