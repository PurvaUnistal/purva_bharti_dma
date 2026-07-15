import 'package:flutter/material.dart';
import 'package:pbg_app/ExportFile/export_file.dart';
import 'package:pbg_app/features/dashboard/domain/model/get_name_title_model.dart';

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
  List<GetOwnershipProofModel> listOfIdentityProof = [];
  List<GetGuardianTypeModel> listOfGuardianType = [];
  List<GetExistingCookingFuelModel> listOfCookingFuel = [];
  List<GetSocietyAllowModel> listOfSocietyAllow = [];
  List<GetPropertyClassModel> listOfProClass = [];
  List<GetNameTitleModel> listOfNameTitle = [];
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
    getLabelModel = GetLabelModel();
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
    listOfNameTitle = [];
    listOfProCategory = [];
    listOfAllArea = [];
    listOfChargeArea = [];
    listOfDepositOffline = [];
    listOfCustBankName = [];
    listOChqBankName = [];
    _eventCompleted(emit);
  }

  _selectSyncFetchAllData(SelectSyncFetchAllDataEvent event, emit) async {
    isLoader = true;
    _eventCompleted(emit);

    final ctx = event.context;

    // Check connectivity ONCE; the helper uses this flag to decide whether to
    // hit the API (online) or read the cached Hive box (offline).
    final online = await DashboardHelper.isInternetConnected();
    isConnective = online;

    await Future.wait(<Future>[
      // ---- single object ----
      _assign(
        DashboardHelper.getLabelApi(context: ctx, online: online),
            (v) => getLabelModel = v,
      ),

      // ---- reference-data lists (no schema) ----
      _assign(
        DashboardHelper.getNotInterestedApi(context: ctx, online: online),
            (v) => listOfNotInterested = v,
      ),
      _assign(
        DashboardHelper.getInitialDepositStatusApi(context: ctx, online: online),
            (v) => listOfInitialDepositStatus = v,
      ),
      _assign(
        DashboardHelper.getAcceptExtraFittingCostApi(context: ctx, online: online),
            (v) => listOfExtraFittingCost = v,
      ),
      _assign(
        DashboardHelper.getAcceptConversionPolicyApi(context: ctx, online: online),
            (v) => listOfConversionPolicy = v,
      ),
      _assign(
        DashboardHelper.getResidentStatusApi(context: ctx, online: online),
            (v) => listOfResidentStatus = v,
      ),
      _assign(
        DashboardHelper.getModeOfDepositApi(context: ctx, online: online),
            (v) => listOfModeOfDeposit = v,
      ),
      _assign(
        DashboardHelper.getEBillingApi(context: ctx, online: online),
            (v) => listOfEBilling = v,
      ),
      _assign(
        DashboardHelper.getKycDocApi(context: ctx, online: online),
            (v) => listOfKycDoc = v,
      ),
      _assign(
        DashboardHelper.getOwnershipProofApi(context: ctx, online: online),
            (v) => listOfOwnershipProof = v,
      ),
      _assign(
        DashboardHelper.getIdentityProofApi(context: ctx, online: online),
            (v) => listOfIdentityProof = v,
      ),
      _assign(
        DashboardHelper.getGuardianTypeApi(context: ctx, online: online),
            (v) => listOfGuardianType = v,
      ),
      _assign(
        DashboardHelper.getExistingCookingFuelApi(context: ctx, online: online),
            (v) => listOfCookingFuel = v,
      ),
      _assign(
        DashboardHelper.getSocietyAllowApi(context: ctx, online: online),
            (v) => listOfSocietyAllow = v,
      ),

      // ---- schema-scoped lists ----
      _assign(
        DashboardHelper.getAllDistrictModelApi(context: ctx, online: online),
            (v) => listOfAllDistrict = v,
      ),
      _assign(
        DashboardHelper.getPropertyClassApi(context: ctx, online: online),
            (v) => listOfProClass = v,
      ),
      _assign(
        DashboardHelper.getTitleApi(context: ctx, online: online),
            (v) => listOfNameTitle = v,
      ),
      _assign(
        DashboardHelper.getPropertyCategoryApi(context: ctx, online: online),
            (v) => listOfProCategory = v,
      ),
      _assign(
        DashboardHelper.getAllAreaApi(context: ctx, online: online),
            (v) => listOfAllArea = v,
      ),
      _assign(
        DashboardHelper.getChargeAreaListApi(context: ctx, online: online),
            (v) => listOfChargeArea = v,
      ),
      _assign(
        DashboardHelper.getAllDepositOfflineApi(context: ctx, online: online),
            (v) => listOfDepositOffline = v,
      ),

      // ---- bank names (same list feeds two fields) ----
      _assign(
        DashboardHelper.getBankNameListApi(context: ctx, online: online),
            (v) {
          listOfCustBankName = v;
          listOChqBankName = v;
        },
      ),

      // ---- online-only cache warmers (no in-memory list in this bloc) ----
      if (online)
        DashboardHelper.getDmaRegFormApi(context: ctx, online: online),
      if (online)
        DashboardHelper.getMeterTypeApi(context: ctx, online: online),
      if (online)
        DashboardHelper.getHouseHoldTypeApi(
          context: ctx,
          online: online,
          propertyCategoryId: "",
        ),
    ]);

    isLoader = false;
    _eventCompleted(emit);
  }

  // Thin assignment wrapper: awaits the helper result and writes it to the
  // bloc field only when non-null. No online/offline logic here anymore.
  Future<void> _assign<T>(
      Future<T?> future,
      void Function(T) set,
      ) async {
    final v = await future;
    if (v != null) set(v);
  }

  _eventCompleted(emit) {
    emit(DashboardGetAllDataState(
      isLoader: isLoader,
      schema: schema,
      isPageLoader: isPageLoader,
    ));
  }
}
