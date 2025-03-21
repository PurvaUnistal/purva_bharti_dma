import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pbg_app/ExportFile/export_file.dart';
import 'package:pbg_app/Utils/common_widgets/HiveDatabase/app_update_message_widget.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardInitState()) {
    on<DashboardPageLoadingEvent>(_pageLoadEvent);
    on<SelectSyncFetchAllDataEvent>(_selectSyncFetchAllData);
  }

  bool isPageLoader = false;
  bool isLoader = false;
  bool isConnective = false;

  String schema = "";
  GetLabelModel getLabelModel = GetLabelModel();

  List<GetLabelModel> listOfAllLabel = [];
  List<GetNotInterestedModel> listOfNotInterested = [];
  List<GetInitialDepositStatusModel> listOfInitialDepositStatus = [];
  List<GetAcceptExtraFittingCostModel> listOfExtraFittingCost = [];
  List<GetAcceptConversionPolicyModel> listOfConversionPolicy = [];
  List<GetAllDistrictModel> listOfAllDistrict = [];
  List<GetResidentStatusModel> listOfResidentStatus = [];
  List<GetModeOfDepositModel> listOfModeOfDeposit = [];
  List<GetEBillingModel> listOfEBilling = [];
  List<GetKycDocModel> listOfKycDoc = [];
  List<GetOwnershipProofModel> listOfOwnershipProof = [];
  List<GetIdentityProofModel> listOfIdentityProof = [];
  List<GetGuardianTypeModel> listOfGuardianType = [];
  List<GetExistingCookingFuelModel> listOfCookingFuel = [];
  List<GetSocietyAllowModel> listOfSocietyAllow = [];
  List<GetPropertyClassModel> listOfProClass = [];
  List<GetPropertyCategoryModel> listOfProCategory = [];
  List<GetAllAreaModel> listOfAllArea = [];
  List<GetChargeAreaListModel> listOfChargeArea = [];
  List<GetAllDepositOfflineModel> listOfDepositOffline = [];
  List<String> listOfCustBankName = [];
  List<String> listOChqBankName = [];

  _pageLoadEvent(DashboardPageLoadingEvent event, emit) async {
    emit(DashboardPageLoadState());
    isPageLoader = false;
    isLoader = false;
    isConnective = false;
    listOfAllLabel = [];
    listOfNotInterested = [];
    listOfInitialDepositStatus = [];
    listOfExtraFittingCost = [];
    listOfConversionPolicy = [];
    listOfAllDistrict = [];
    listOfResidentStatus = [];
    listOfModeOfDeposit = [];
    listOfEBilling = [];
    listOfKycDoc = [];
    listOfOwnershipProof = [];
    listOfIdentityProof = [];
    listOfGuardianType = [];
    listOfCookingFuel = [];
    listOfSocietyAllow = [];
    listOfProClass = [];
    listOfProCategory = [];
    listOfAllArea = [];
    listOfChargeArea = [];
    listOfDepositOffline = [];
    listOfCustBankName = [];
    listOChqBankName = [];
    getLabelModel = GetLabelModel();
    _eventCompleted(emit);
  }


  _selectSyncFetchAllData(SelectSyncFetchAllDataEvent event, emit) async {
    isLoader = true;
    _eventCompleted(emit);
    await Future.wait(<Future>[
      fetchLabelApi(context: event.context),
      fetchNotInterestedApi(context: event.context),
      fetchInitialDepositStatusApi(context: event.context),
      fetchAcceptExtraFittingCostApi(context: event.context),
      fetchAcceptConversionPolicyApi(context: event.context),
      fetchAllDistrictModelApi(context: event.context),
      fetchResidentStatusApi(context: event.context),
      fetchModeOfDepositApi(context: event.context),
      fetchEBillingApi(context: event.context),
      fetchKycDocApi(context: event.context),
      fetchOwnershipProofApi(context: event.context),
      fetchIdentityProofApi(context: event.context),
      fetchGuardianTypeApi(context: event.context),
      fetchExistingCookingFuelApi(context: event.context),
      fetchSocietyAllowApi(context: event.context),
      fetchPropertyClassApi(context: event.context),
      fetchPropertyCategoryApi(context: event.context),
      fetchAllAreaApi(context: event.context),
      fetchChargeAreaListApi(context: event.context),
      fetchAllDepositOfflineApi(context: event.context),
      fetchBankNameListApi(context: event.context),
    ]);

    isLoader = false;
    _eventCompleted(emit);
  }

  fetchLabelApi({required BuildContext context}) async {
    if (await DashboardHelper.isInternetConnected()) {
      var res = await DashboardHelper.getLabelApi(context: context);
      if (res != null) {
        getLabelModel = res;
      }
    } else {
      listOfAllLabel = HiveDataBase.allLabelBox!.values.toList();
    }
  }

  fetchNotInterestedApi({required BuildContext context}) async {
    if (await DashboardHelper.isInternetConnected()) {
      var res = await DashboardHelper.getNotInterestedApi(context: context);
      if (res != null) {
        listOfNotInterested = res;
      }
    } else {
      listOfNotInterested = HiveDataBase.notInterestedBox!.values.toList();
    }
  }

  fetchInitialDepositStatusApi({required BuildContext context}) async {
    if (await DashboardHelper.isInternetConnected()) {
      var res =
          await DashboardHelper.getInitialDepositStatusApi(context: context);
      if (res != null) {
        listOfInitialDepositStatus = res;
      }
    } else {
      listOfInitialDepositStatus =
          HiveDataBase.initDepositStatusBox!.values.toList();
    }
  }

  fetchAcceptExtraFittingCostApi({required BuildContext context}) async {
    if (await DashboardHelper.isInternetConnected()) {
      var res =
          await DashboardHelper.getAcceptExtraFittingCostApi(context: context);
      if (res != null) {
        listOfExtraFittingCost = res;
      }
    } else {
      listOfExtraFittingCost =
          HiveDataBase.acceptExtraFittingCostBox!.values.toList();
    }
  }

  fetchAcceptConversionPolicyApi({required BuildContext context}) async {
    if (await DashboardHelper.isInternetConnected()) {
      var res =
          await DashboardHelper.getAcceptConversionPolicyApi(context: context);
      if (res != null) {
        listOfConversionPolicy = res;
      }
    } else {
      listOfConversionPolicy =
          HiveDataBase.acceptConversionPolicyBox!.values.toList();
    }
  }

  fetchAllDistrictModelApi({required BuildContext context}) async {
    if (await DashboardHelper.isInternetConnected()) {
      var res = await DashboardHelper.getAllDistrictModelApi(context: context);
      if (res != null) {
        listOfAllDistrict = res;
      }
    } else {
      listOfAllDistrict = HiveDataBase.allDistrictBox!.values.toList();
    }
  }

  fetchResidentStatusApi({required BuildContext context}) async {
    if (await DashboardHelper.isInternetConnected()) {
      var res = await DashboardHelper.getResidentStatusApi(context: context);
      if (res != null) {
        listOfResidentStatus = res;
      }
    } else {
      listOfResidentStatus = HiveDataBase.resStatusBox!.values.toList();
    }
  }

  fetchModeOfDepositApi({required BuildContext context}) async {
    if (await DashboardHelper.isInternetConnected()) {
      var res = await DashboardHelper.getModeOfDepositApi(context: context);
      if (res != null) {
        listOfModeOfDeposit = res;
      }
    } else {
      listOfModeOfDeposit = HiveDataBase.modeOfDepositBox!.values.toList();
    }
  }

  fetchEBillingApi({required BuildContext context}) async {
    if (await DashboardHelper.isInternetConnected()) {
      var res = await DashboardHelper.getEBillingApi(context: context);
      if (res != null) {
        listOfEBilling = res;
      }
    } else {
      listOfEBilling = HiveDataBase.eBillingBox!.values.toList();
    }
  }

  fetchKycDocApi({required BuildContext context}) async {
    if (await DashboardHelper.isInternetConnected()) {
      var res = await DashboardHelper.getKycDocApi(context: context);
      if (res != null) {
        listOfKycDoc = res;
      }
    } else {
      listOfKycDoc = HiveDataBase.kycDocBox!.values.toList();
    }
  }

  fetchOwnershipProofApi({required BuildContext context}) async {
    if (await DashboardHelper.isInternetConnected()) {
      var res = await DashboardHelper.getOwnershipProofApi(context: context);
      if (res != null) {
        listOfOwnershipProof = res;
      }
    } else {
      listOfOwnershipProof = HiveDataBase.ownershipProofBox!.values.toList();
    }
  }

  fetchIdentityProofApi({required BuildContext context}) async {
    if (await DashboardHelper.isInternetConnected()) {
      var res = await DashboardHelper.getIdentityProofApi(context: context);
      if (res != null) {
        listOfIdentityProof = res;
      }
    } else {
      listOfIdentityProof = HiveDataBase.idProofBox!.values.toList();
    }
  }

  fetchGuardianTypeApi({required BuildContext context}) async {
    if (await DashboardHelper.isInternetConnected()) {
      var res = await DashboardHelper.getGuardianTypeApi(context: context);
      if (res != null) {
        listOfGuardianType = res;
      }
    } else {
      listOfGuardianType = HiveDataBase.guardianTypeBox!.values.toList();
    }
  }

  fetchExistingCookingFuelApi({required BuildContext context}) async {
    if (await DashboardHelper.isInternetConnected()) {
      var res =
          await DashboardHelper.getExistingCookingFuelApi(context: context);
      if (res != null) {
        listOfCookingFuel = res;
      }
    } else {
      listOfCookingFuel = HiveDataBase.cookingFuelBox!.values.toList();
    }
  }

  fetchSocietyAllowApi({required BuildContext context}) async {
    if (await DashboardHelper.isInternetConnected()) {
      var res = await DashboardHelper.getSocietyAllowApi(context: context);
      if (res != null) {
        listOfSocietyAllow = res;
      }
    } else {
      listOfSocietyAllow = HiveDataBase.societyAllowBox!.values.toList();
    }
  }

  fetchPropertyClassApi({required BuildContext context}) async {
    if (await DashboardHelper.isInternetConnected()) {
      var res = await DashboardHelper.getPropertyClassApi(context: context);
      if (res != null) {
        listOfProClass = res;
      }
    } else {
      listOfProClass = HiveDataBase.proClassBox!.values.toList();
    }
  }

  fetchPropertyCategoryApi({required BuildContext context}) async {
    if (await DashboardHelper.isInternetConnected()) {
      var res = await DashboardHelper.getPropertyCategoryApi(context: context);
      if (res != null) {
        listOfProCategory = res;
      }
    } else {
      listOfProCategory = HiveDataBase.proCateBox!.values.toList();
    }
  }

  fetchAllAreaApi({required BuildContext context}) async {
    if (await DashboardHelper.isInternetConnected()) {
      var res = await DashboardHelper.getAllAreaApi(context: context);
      if (res != null) {
        listOfAllArea = res;
      }
    } else {
      listOfAllArea = HiveDataBase.allAreaBox!.values.toList();
    }
  }

  fetchChargeAreaListApi({required BuildContext context}) async {
    if (await DashboardHelper.isInternetConnected()) {
      var res = await DashboardHelper.getChargeAreaListApi(context: context);
      if (res != null) {
        listOfChargeArea = res;
      }
    } else {
      listOfChargeArea = HiveDataBase.chargeAreaListBox!.values.toList();
    }
  }

  fetchAllDepositOfflineApi({required BuildContext context}) async {
    if (await DashboardHelper.isInternetConnected()) {
      var res = await DashboardHelper.getAllDepositOfflineApi(context: context);
      if (res != null) {
        listOfDepositOffline = res;
      }
    } else {
      listOfDepositOffline = HiveDataBase.allDepositOfflineBox!.values.toList();
    }
  }

  fetchBankNameListApi({required BuildContext context}) async {
    var res = await DashboardHelper.getBankNameListApi(context: context);
    if (res != null) {
      listOfCustBankName = res;
      listOChqBankName = res;
    }
  }

  _eventCompleted(emit) {
    emit(DashboardGetAllDataState(
      isLoader: isLoader,
      schema: schema,
      isPageLoader: isPageLoader,
    ));
  }
}
