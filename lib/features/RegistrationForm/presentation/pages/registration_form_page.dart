import 'package:flutter/services.dart';
import 'package:pbg_app/ExportFile/export_file.dart';
import 'package:flutter/material.dart';
import 'package:pbg_app/Utils/common_widgets/background_widget.dart';
import 'package:pbg_app/Utils/common_widgets/drop_down_search_widget.dart';
import 'package:pbg_app/Utils/common_widgets/res/app_config.dart';
import 'package:pbg_app/Utils/common_widgets/res/enums.dart';
import 'package:pbg_app/Utils/common_widgets/res/environment_config.dart';
import 'package:pbg_app/Utils/common_widgets/search_text_field.dart';
import 'package:pbg_app/features/dashboard/domain/model/get_connection_type_model.dart';
import 'package:pbg_app/features/dashboard/domain/model/get_name_title_model.dart';
import 'package:pbg_app/features/dashboard/domain/model/get_property_type_model.dart';

class RegistrationFormPage extends StatefulWidget {
  final bool isUpdate;
  final int index;
  final SaveRegistrationFormModel localData;

  const RegistrationFormPage({
    Key? key,
    required this.isUpdate,
    required this.index,
    required this.localData,
  }) : super(key: key);

  @override
  State<RegistrationFormPage> createState() => _RegistrationFormPageState();
}

class _RegistrationFormPageState extends State<RegistrationFormPage> {
  final formGlobalKey = GlobalKey<FormState>();

  // ---------- scroll-to-error support ----------
  final ScrollController _scrollController = ScrollController();

  final _mobileFieldKey = GlobalKey<FormFieldState>();
  final _firstNameFieldKey = GlobalKey<FormFieldState>();
  final _emailFieldKey = GlobalKey<FormFieldState>();
  final _houseFieldKey = GlobalKey<FormFieldState>();
  final _wardNumberFieldKey = GlobalKey<FormFieldState>();
  final _pinCodeFieldKey = GlobalKey<FormFieldState>();
  final _kyc1NumberFieldKey = GlobalKey<FormFieldState>();
  final _kyc2NumberFieldKey = GlobalKey<FormFieldState>();
  final _kyc3NumberFieldKey = GlobalKey<FormFieldState>();
  final _schemeAmountFieldKey = GlobalKey<FormFieldState>();
  final _chequeNoFieldKey = GlobalKey<FormFieldState>();
  final _chequeAccountNoFieldKey = GlobalKey<FormFieldState>();
  final _chequeMicrNoFieldKey = GlobalKey<FormFieldState>();

  /// Same top-to-bottom order the fields appear on screen.
  late final List<GlobalKey<FormFieldState>> _orderedFieldKeys = [
    _mobileFieldKey,
    _firstNameFieldKey,
    _emailFieldKey,
    _houseFieldKey,
    _wardNumberFieldKey,
    _pinCodeFieldKey,
    _kyc1NumberFieldKey,
    _kyc2NumberFieldKey,
    _kyc3NumberFieldKey,
    _schemeAmountFieldKey,
    _chequeNoFieldKey,
    _chequeAccountNoFieldKey,
    _chequeMicrNoFieldKey,
  ];

  void _scrollToFirstInvalidField() {
    for (final key in _orderedFieldKeys) {
      final fieldState = key.currentState;
      // Fields not currently in the tree (hidden sections) have null
      // currentState and are skipped safely.
      if (fieldState != null && fieldState.hasError) {
        final ctx = key.currentContext;
        if (ctx != null) {
          Scrollable.ensureVisible(
            ctx,
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeInOut,
            alignment: 0.15,
          );
        }
        return;
      }
    }
  }
  // ---------- end scroll-to-error support ----------

  late final Client _client;

  bool get _isVPPL => _client == Client.vppl;

  bool get _isVRPL => _client == Client.vrpl;

  bool get _isHPOIL => _client == Client.hpoil;

  bool get _isAGCL => _client == Client.agcl;

  bool get _isMGL => _client == Client.mahaNagar;

  bool get _isPBGPL => _client == Client.purvaBharti;

  String _regKey(RegiFormUpdateDataState s) =>
      _isAGCL
          ? (s.regFromVal?.name?.toString() ?? "")
          : (s.registrationTypeValue?.value?.toString() ?? "");

  bool _showPropertyDropdowns(RegiFormUpdateDataState s) {
    if (_isAGCL) return true;
    return s.registrationTypeValue?.value?.toString() == "Registration For LMC";
  }

  @override
  void initState() {
    super.initState();
    _client = AppConfig.instanceInit()!.client!;

    final bloc = BlocProvider.of<RegistrationFormBloc>(context);
    bloc.add(RegistrationFormPageLoadEvent(context: context));

    if (widget.isUpdate) {
      bloc.add(
        UpdateLocalDataEvent(
          context: context,
          isUpdate: true,
          index: widget.index,
          updatedModel: widget.localData,
        ),
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBarWidget(boolLeading: true, title: "Registration Form"),
        ),
        body: BackgroundWidget(
          child: BlocBuilder<RegistrationFormBloc, RegistrationFormState>(
            builder: (context, state) {
              if (state is RegiFormUpdateDataState) {
                return _buildLayout(stateData: state);
              } else {
                return const Center(child: SpinLoader());
              }
            },
          ),
        ),
      ),
    );
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
      context: context,
      builder:
          (BuildContext mContext) => MessageBoxTwoButtonPopWidget(
        message: "Do you want to exit an Registration Form Page?",
        okButtonText: "Exit",
        onPressed: () => Navigator.of(context).pop(true),
      ),
    )) ??
        false;
  }

  Widget _buildLayout({required RegiFormUpdateDataState stateData}) {
    return SingleChildScrollView(
      controller: _scrollController,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formGlobalKey,
          child: Column(
            children: [
              if (!_isAGCL) ...[
                _registrationTypeDropdown(stateData: stateData),
              ],
              if (_isAGCL) ...[_registrationFromDropdown(stateData: stateData)],
              _applicationNumberController(stateData: stateData),
              _reasonRegistrationController(stateData: stateData),
              _chargeAreaDropdown(stateData: stateData),
              _verticalSpace(),
              _areaDropdown(stateData: stateData),
              _verticalSpace(),
              _mobileNumberWidget(stateData: stateData),
              _verticalSpace(),
              _altMobileNumberWidget(stateData: stateData),
              !_isAGCL
                  ? SizedBox.shrink()
                  : _nameTitleDropdown(stateData: stateData),
              _verticalSpace(),
              _firstNameWidget(stateData: stateData),
              _middleNameWidget(stateData: stateData),
              _lastNameWidget(stateData: stateData),
              !_isAGCL ? SizedBox.shrink() : _dobWidget(stateData: stateData),
              _guardianDropdown(stateData: stateData),
              _guardianNameWidget(stateData: stateData),
              _emailIdWidget(stateData: stateData),
              _showPropertyDropdowns(stateData)
                  ? Column(
                children: [
                  Row(
                    children: [
                      Flexible(
                        flex: 3,
                        child: _propertyCategoryDropdown(
                          stateData: stateData,
                        ),
                      ),
                      _widthSpace(),
                      Flexible(
                        flex: 3,
                        child: _propertyClassDropdown(stateData: stateData),
                      ),
                    ],
                  ),
                  _verticalSpace(),
                ],
              )
                  : Container(),
              _houseHoldTypeDropdown(stateData: stateData),
              !_isAGCL
                  ? SizedBox.shrink()
                  : _floorNumberWidget(stateData: stateData),
              _buildNumberWidget(stateData: stateData),
              _houseNumberWidget(stateData: stateData),
              _colonyWidget(stateData: stateData),
              _streetNameWidget(stateData: stateData),
              _townWidget(stateData: stateData),
              _districtDropdown(stateData: stateData),
              _nearestLandmarkWidget(stateData: stateData),
              _pinCodeWidget(stateData: stateData),
              !_isAGCL
                  ? SizedBox.shrink()
                  : _wardNumberWidget(stateData: stateData),
              !_isAGCL
                  ? SizedBox.shrink()
                  : _premiseTypeWidget(stateData: stateData),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  stateData.isLocationLoader == false
                      ? Flexible(
                    child: Row(
                      children: [
                        Flexible(
                          flex: 3,
                          child: _latWidget(stateData: stateData),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.02,
                        ),
                        Flexible(
                          flex: 3,
                          child: _longWidget(stateData: stateData),
                        ),
                      ],
                    ),
                  )
                      : DottedLoaderWidget(),
                  IconButton(
                    icon: Icon(
                      Icons.location_on_outlined,
                      color: EnvironmentConfig.of(context)!.primaryTheme,
                    ),
                    onPressed: () {
                      BlocProvider.of<RegistrationFormBloc>(
                        context,
                      ).add(RegistrationFormSetLocation(context: context));
                    },
                  ),
                ],
              ),
              if (_regKey(stateData) != "Future Registration") ...[
                _verticalSpace(),
                Row(
                  children: [
                    Flexible(
                      flex: 3,
                      child: _existCookingFuelDropdown(stateData: stateData),
                    ),
                    _widthSpace(),
                    Flexible(
                      flex: 3,
                      child: _numberKitchenWidget(stateData: stateData),
                    ),
                  ],
                ),
                _verticalSpace(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 3,
                      child: _numberBathroomWidget(stateData: stateData),
                    ),
                    _widthSpace(),
                    Flexible(
                      flex: 3,
                      child: _familyMemberWidget(stateData: stateData),
                    ),
                  ],
                ),
              ],
              _verticalSpace(),
              _kycDoc1Dropdown(stateData: stateData),
              _kycDoc1Widget(stateData: stateData),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(child: _idFrontFileImg(stateData: stateData)),
                  _widthSpace(),
                  Flexible(child: _idBackFileImg(stateData: stateData)),
                ],
              ),
              _verticalSpace(),
              _kycDoc2Dropdown(stateData: stateData),
              _kycDoc2Widget(stateData: stateData),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(child: _eleBillFrontImg(stateData: stateData)),
                  _widthSpace(),
                  Flexible(child: _eleBillBackImg(stateData: stateData)),
                ],
              ),
              _verticalSpace(),
              if (_regKey(stateData) != "Future Registration") ...[
                _isAGCL ? _kycDoc33Dropdown(stateData: stateData) : _kycDoc3Dropdown(stateData: stateData),
                _isAGCL
                    ? _kycDoc3Widget(stateData: stateData)
                    : SizedBox.shrink(),
                _isAGCL
                    ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(child: _nocFrontImg(stateData: stateData)),
                    _widthSpace(),
                    Flexible(child: _nocBackImg(stateData: stateData)),
                  ],
                )
                    : SizedBox.shrink(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(child: _uploadCustomerImg(stateData: stateData)),
                    _widthSpace(),
                    Flexible(child: _uploadHouseImg(stateData: stateData)),
                    if (stateData.kycDoc3Value?.value == "Rented") ...[
                      _widthSpace(),
                      Flexible(child: _nocDocImg(stateData: stateData)),
                    ],
                  ],
                ),
                _verticalSpace(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: _acceptConversionPolicyDropdown(
                        stateData: stateData,
                      ),
                    ),
                    _widthSpace(),
                    Flexible(
                      child: _acceptExtraFittingCostDropdown(
                        stateData: stateData,
                      ),
                    ),
                    _widthSpace(),
                    Flexible(
                      child: _societyAllowDropdown(stateData: stateData),
                    ),
                  ],
                ),
                BorderWidget(
                  children: [
                    Text("Security Deposit", style: Styles.title),
                    _verticalSpace(),
                    _meterTypeDropdown(stateData: stateData),
                    _initialDepositStatusDropdown(stateData: stateData),
                    _reasonDepositStatusWidget(stateData: stateData),
                    if(_isAGCL)...[
                      _schemeTypeDropdown(stateData: stateData),
                    ]else...[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            flex: 6,
                            child: _schemeTypeDropdown(stateData: stateData),
                          ),
                          _widthSpace(),
                          Flexible(
                            flex: 3,
                            child: _depositTypeDetailsButton(
                              stateData: stateData,
                            ),
                          ),
                        ],
                      ),
                    ],
                    _verticalSpace(),
                    _depositAmountWidget(stateData: stateData),
                    _isAGCL
                        ? SizedBox.shrink()
                        : _modeDepositDropdown(stateData: stateData),
                  ],
                ),
                if (stateData.modeDepositValue != null &&
                    stateData.modeDepositValue?.value == "Cheque") ...[
                  BorderWidget(
                    children: [
                      Text("Cheque", style: Styles.title),
                      _verticalSpace(),
                      _chequeNoWidget(stateData: stateData),
                      _chequeDateWidget(stateData: stateData),
                      _chequePaymentBankDropdown(stateData: stateData),
                      _chequeAccountNoWidget(stateData: stateData),
                      _chequeMICRNoWidget(stateData: stateData),
                      _chequeImg(stateData: stateData),
                    ],
                  ),
                ],
              ],
              _verticalSpace(),
              _verticalSpace(),
              _previewButton(stateData: stateData),
              _verticalSpace(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _registrationTypeDropdown({required RegiFormUpdateDataState stateData,}) {
    return ColumnWidget(
      child: DropdownWidget<GetNotInterestedModel>(
        isRequired: true,
        hint:
        stateData.labelModel.registration == null
            ? AppString.registrationType
            : stateData.labelModel.registration!.registrationType,
        dropdownValue:
        stateData.registrationTypeValue?.key == null
            ? null
            : stateData.registrationTypeValue,
        items: stateData.getNotInterestedList,
        onChanged: (val) {
          log(
            "stateData.registrationTypeValue-->${stateData.registrationTypeValue}",
          );
          BlocProvider.of<RegistrationFormBloc>(
            context,
          ).add(RegistrationFormSetInterestValue(registrationTypeValue: val!));
        },
      ),
    );
  }

  Widget _registrationFromDropdown({required RegiFormUpdateDataState stateData,}) {
    return ColumnWidget(
      child: DropdownWidget<ConnectionTypeModel>(
        isRequired: true,
        hint: "Registration From",
        dropdownValue:
        stateData.regFromVal?.key == null ? null : stateData.regFromVal,
        items: stateData.listOfDmaRegForm,
        onChanged: (val) {
          BlocProvider.of<RegistrationFormBloc>(
            context,
          ).add(RegistrationFormRegTypeValue(regFromVal: val!));
          log(
            "key=${stateData.regFromVal?.key} value=${stateData.regFromVal?.name}",
          );
        },
      ),
    );
  }

  Widget _applicationNumberController({required RegiFormUpdateDataState stateData,}) {
    if (_regKey(stateData) != "PNGRB") return Container();
    return ColumnWidget(
      child: SearchTextField(
        isLoader: stateData.searchCustomerLoader,
        controller: stateData.applicationNumberController,
        label: AppString.applicationNumber,
        list: stateData.customerSuggestions,
        itemLabel:
            (item) =>
        "${item.applicationNumber ?? ''} — ${item.firstName ?? ''} ${item.lastName ?? ''}",
        onChange: (value) {
          if (value.toString().isNotEmpty) {
            BlocProvider.of<RegistrationFormBloc>(context).add(
              RegistrationFormApplicationNoEvent(
                applicationNo: value.toString(),
                context: context,
              ),
            );
          }
        },
        onClick: (value) {
          FocusScope.of(context).unfocus();
          BlocProvider.of<RegistrationFormBloc>(
            context,
          ).add(RegistrationFormCustomerSelectedEvent(customer: value));
        },
      ),
    );
  }

  Widget _reasonRegistrationController({required RegiFormUpdateDataState stateData,}) {
    return _regKey(stateData) == "Future Registration"
        ? ColumnWidget(
      child: TextFieldWidget(
        labelText: AppString.reasonRegistration,
        controller: stateData.reasonRegistrationController,
        keyboardType: TextInputType.text,
      ),
    )
        : Container();
  }

  Widget _acceptConversionPolicyDropdown({required RegiFormUpdateDataState stateData,}) {
    return ColumnWidget(
      child: DropdownWidget<GetAcceptConversionPolicyModel>(
        hint: AppString.conversionPolicy,
        dropdownValue:
        stateData.conversionPolicyValue?.key == null
            ? null
            : stateData.conversionPolicyValue,
        items: stateData.conversionPolicyList,
        onChanged: (val) {
          BlocProvider.of<RegistrationFormBloc>(context).add(
            RegistrationFormSetConversionPolicyValue(
              conversionPolicyValue: val!,
            ),
          );
        },
      ),
    );
  }

  Widget _acceptExtraFittingCostDropdown({required RegiFormUpdateDataState stateData,}) {
    return ColumnWidget(
      child: DropdownWidget<GetAcceptExtraFittingCostModel>(
        hint: AppString.fittingCost,
        dropdownValue:
        stateData.extraFittingValue?.key == null
            ? null
            : stateData.extraFittingValue,
        items: stateData.extraFittingCostList,
        onChanged: (val) {
          BlocProvider.of<RegistrationFormBloc>(
            context,
          ).add(RegistrationFormSetExtraFittingValue(extraFittingValue: val));
        },
      ),
    );
  }

  Widget _societyAllowDropdown({required RegiFormUpdateDataState stateData}) {
    return ColumnWidget(
      child: DropdownWidget<GetSocietyAllowModel>(
        hint: stateData.labelModel.registration == null
            ? AppString.mdpeAllow
            : stateData.labelModel.registration!.mdpe,
        dropdownValue:
        stateData.societyAllowValue?.key == null
            ? null
            : stateData.societyAllowValue,
        items: stateData.societyAllowList,
        onChanged: (val) {
          BlocProvider.of<RegistrationFormBloc>(
            context,
          ).add(RegistrationFormSetSocietyAllowValue(societyAllowValue: val));
        },
      ),
    );
  }

  Widget _chargeAreaDropdown({required RegiFormUpdateDataState stateData}) {
    return DropDownSearchWidget<GetChargeAreaListModel>(
      isRequired: true,
      label: _isAGCL ? "Grid": stateData.labelModel.registration == null
          ? AppString.chargeArea
          : stateData.labelModel.registration!.chargeArea,
      hint: _isAGCL ? "Grid":  stateData.labelModel.registration == null
          ? AppString.chargeArea
          : stateData.labelModel.registration!.chargeArea,
      dropdownValue:
      stateData.chargeAreaValue?.gid == null
          ? null
          : stateData.chargeAreaValue,
      itemAsString: (alignmentData) => alignmentData.chargeAreaName.toString(),
      items: stateData.getChargeAreaListModel,
      onChanged: (val) {
        BlocProvider.of<RegistrationFormBloc>(
          context,
        ).add(RegistrationFormSetChargeAreaValue(chargeAreaValue: val));
      },
    );
  }

  Widget _areaDropdown({required RegiFormUpdateDataState stateData}) {
    return DropDownSearchWidget<GetAllAreaModel>(
      isRequired: true,
      label: stateData.labelModel.registration == null
          ? AppString.area
          : stateData.labelModel.registration!.area,
      hint:
      stateData.labelModel.registration == null
          ? AppString.area
          : stateData.labelModel.registration!.area,
      dropdownValue:
      stateData.areaValue?.gid == null ? null : stateData.areaValue,
      itemAsString: (alignmentData) => alignmentData.areaName.toString(),
      items: stateData.getAllAreaModel,
      onChanged: (val) {
        BlocProvider.of<RegistrationFormBloc>(
          context,
        ).add(RegistrationFormSetAreaValue(areaValue: val));
      },
    );
  }

  Widget _mobileNumberWidget({required RegiFormUpdateDataState stateData}) {
    return TextFieldWidget(
      fieldKey: _mobileFieldKey,
      isRequired: true,
      labelText:
      stateData.labelModel.steps == null
          ? AppString.mobileNo
          : stateData.labelModel.steps!.mobile,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9]"))],
      maxLength: 10,
      controller: stateData.mobileController,
      validator: (String? value) {
        if (value != stateData.mobileController.text.trim()) {
          return "Blank space";
        } else if (value!.isEmpty) {
          return "Please enter Mobile Number";
        } else if (value.length <= 9) {
          return 'Mobile Number must be of 10 digit';
        }
        return null;
      },
    );
  }

  Widget _altMobileNumberWidget({required RegiFormUpdateDataState stateData}) {
    return ColumnWidget(
      child: TextFieldWidget(
        labelText: AppString.alternateMobileNo,
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9]"))],
        maxLength: 10,
        controller: stateData.altMobileController,
      ),
    );
  }

  Widget _firstNameWidget({required RegiFormUpdateDataState stateData}) {
    return ColumnWidget(
      child: TextFieldWidget(
        fieldKey: _firstNameFieldKey,
        isRequired: true,
        labelText:
        stateData.labelModel.steps == null
            ? AppString.firstName
            : stateData.labelModel.steps!.firstname,
        controller: stateData.firstController,
        keyboardType: TextInputType.text,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp("[a-z A-Z]")),
        ],
        validator: (value) {
          if (value != stateData.firstController.text.trim()) {
            return "Blank space";
          } else if (value!.isEmpty ||
              !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
            return "Enter First Name";
          } else if (value.length <= 2) {
            return "First Name must be of minimum 2+ Letters";
          }
          return null;
        },
      ),
    );
  }

  Widget _middleNameWidget({required RegiFormUpdateDataState stateData}) {
    return ColumnWidget(
      child: TextFieldWidget(
        labelText: stateData.labelModel.steps == null
            ? AppString.middleName
            : stateData.labelModel.steps!.middlename,
        controller: stateData.middleController,
        keyboardType: TextInputType.text,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp("[a-z A-Z]")),
        ],
      ),
    );
  }

  Widget _lastNameWidget({required RegiFormUpdateDataState stateData}) {
    return ColumnWidget(
      child: TextFieldWidget(
        labelText: stateData.labelModel.steps == null
            ? AppString.lastName
            : stateData.labelModel.steps!.lastname,
        controller: stateData.lastController,
        keyboardType: TextInputType.text,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp("[a-z A-Z]")),
        ],
      ),
    );
  }

  Widget _dobWidget({required RegiFormUpdateDataState stateData}) {
    return ColumnWidget(
      child: TextFieldWidget(
        labelText: AppString.dob,
        controller: stateData.dobController,
        enabled: true,
        readOnly: true,
        keyboardType: TextInputType.datetime,
        suffixIcon: Icon(
          Icons.calendar_today,
          color: EnvironmentConfig.of(context)!.primaryTheme,
        ),
        onTap: () async {
          FocusScope.of(context).unfocus();
          final picked = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime(2900),
          );
          if (picked != null) {
            stateData.dobController.text = DateFormat(
              'dd-MM-yyyy',
            ).format(picked);
          }
        },
      ),
    );
  }

  Widget _guardianDropdown({required RegiFormUpdateDataState stateData}) {
    return ColumnWidget(
      child: DropdownWidget<GetGuardianTypeModel>(
        isRequired: _regKey(stateData) != "Future Registration" ? true : false,
        hint:
        stateData.labelModel.registration == null
            ? AppString.guardianType
            : stateData.labelModel.registration!.guardianType,
        dropdownValue:
        stateData.guardianTypeValue?.key == null
            ? null
            : stateData.guardianTypeValue,
        items: stateData.getGuardianTypeList,
        onChanged: (val) {
          BlocProvider.of<RegistrationFormBloc>(
            context,
          ).add(RegistrationFormSetGuardianTypeValue(guardianTypeValue: val));
        },
      ),
    );
  }

  Widget _houseHoldTypeDropdown({required RegiFormUpdateDataState stateData}) {
    return ColumnWidget(
      child: DropdownWidget<PropertyTypeModel>(
        isRequired: true,
        hint: AppString.houseHoldType,
        dropdownValue:
        stateData.houseHoldTypeValue?.name == null
            ? null
            : stateData.houseHoldTypeValue,
        items: stateData.listOfHouseHoldType,
        onChanged: (val) {
          BlocProvider.of<RegistrationFormBloc>(context).add(
            RegistrationFormSetHouseHoldTypeValue(houseHoldTypeValue: val!),
          );
        },
      ),
    );
  }

  Widget _guardianNameWidget({required RegiFormUpdateDataState stateData}) {
    return ColumnWidget(
      child: TextFieldWidget(
        isRequired: _isAGCL ? false : _regKey(stateData) != "Future Registration" ? true : false,
        labelText:
        stateData.labelModel.registration == null
            ? AppString.guardianName
            : stateData.labelModel.registration!.guardian,
        controller: stateData.guardianNameController,
        keyboardType: TextInputType.text,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp("[a-z A-Z]")),
        ],
        validator: (value) {
          if(!_isAGCL){
            if (stateData.guardianNameController.text.trim().isEmpty &&
                _regKey(stateData) == "Future Registration") {
              return null;
            }
            if (value != stateData.guardianNameController.text.trim()) {
              return "Blank space";
            } else if (value!.isEmpty) {
              return "Please enter Guardian name";
            } else if (!RegExp('.*[A-Z].*').hasMatch(value)) {
              return 'Input should contain an uppercase letter A-Z.';
            } else if (value.length <= 2) {
              return "Enter a Guardian name 2+char long";
            }
            return null;
          }

        },
      ),
    );
  }

  Widget _emailIdWidget({required RegiFormUpdateDataState stateData}) {
    return ColumnWidget(
      child: TextFieldWidget(
        fieldKey: _emailFieldKey,
        labelText:
        stateData.labelModel.registration == null
            ? AppString.emailAddress
            : stateData.labelModel.registration!.email,
        controller: stateData.emailIdController,
        keyboardType: TextInputType.emailAddress,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp("[a-z0-9@._-]")),
        ],
        validator: (value) {
          if (stateData.emailIdController.text.trim().isNotEmpty) {
            if (value != stateData.emailIdController.text.trim()) {
              return AppString.blankSpace;
            } else if (!AppString.emailValid.hasMatch(value!)) {
              return AppString.invalidFormat;
            }
            return null;
          }
          return null;
        },
      ),
    );
  }

  Widget _propertyCategoryDropdown({required RegiFormUpdateDataState stateData,}) {
    return DropdownWidget<GetPropertyCategoryModel>(
      isRequired: true,
      hint:
      stateData.labelModel.registration == null
          ? AppString.propertyCategory
          : stateData.labelModel.registration!.propertyCategory,
      dropdownValue:
      stateData.propertyCategoryValue?.name != null
          ? stateData.propertyCategoryValue
          : null,
      items: stateData.getPropertyCategoryModel,
      onChanged: (val) {
        BlocProvider.of<RegistrationFormBloc>(context).add(
          RegistrationFormSetPropertyCategoryValue(propertyCategoryValue: val),
        );
      },
    );
  }

  Widget _propertyClassDropdown({required RegiFormUpdateDataState stateData}) {
    return DropdownWidget<GetPropertyClassModel>(
      isRequired: true,
      hint:
      stateData.labelModel.registration == null
          ? AppString.propertyClass
          : stateData.labelModel.registration!.propertyClass,
      dropdownValue:
      stateData.propertyClassValue?.name != null
          ? stateData.propertyClassValue
          : null,
      items: stateData.getPropertyClassModel,
      onChanged: (val) {
        BlocProvider.of<RegistrationFormBloc>(
          context,
        ).add(RegistrationFormSetPropertyClassValue(propertyClassValue: val));
      },
    );
  }

  Widget _nameTitleDropdown({required RegiFormUpdateDataState stateData}) {
    return DropdownWidget<GetNameTitleModel>(
      hint: AppString.titleName,
      dropdownValue: stateData.nameTitleValue?.name != null
          ? stateData.nameTitleValue
          : null,
      items: stateData.listOfNameTitle,
      onChanged: (val) {
        BlocProvider.of<RegistrationFormBloc>(
          context,
        ).add(RegistrationFormNameTitleValue(nameTitleVal: val!));
      },
    );
  }

  Widget _buildNumberWidget({required RegiFormUpdateDataState stateData}) {
    return ColumnWidget(
      child: TextFieldWidget(
        labelText: AppString.buildingNumber,
        controller: stateData.buildingNumberController,
        keyboardType: TextInputType.text,
      ),
    );
  }

  Widget _floorNumberWidget({required RegiFormUpdateDataState stateData}) {
    return ColumnWidget(
      child: TextFieldWidget(
        labelText: AppString.floorNumber,
        controller: stateData.floorNumberController,
        keyboardType: TextInputType.text,
      ),
    );
  }

  Widget _houseNumberWidget({required RegiFormUpdateDataState stateData}) {
    return ColumnWidget(
      child: TextFieldWidget(
        isRequired: true,
        fieldKey: _houseFieldKey,
        labelText: stateData.labelModel.registration == null
            ? AppString.houseNumber
            : stateData.labelModel.registration!.house,
        controller: stateData.houseNumberController,
        keyboardType: TextInputType.text,
        validator: (value) {
          if (value != stateData.houseNumberController.text.trim()) {
            return "Blank space";
          } else if (value!.isEmpty) {
            return "Please enter house number";
          }
          return null;
        },
      ),
    );
  }

  Widget _colonyWidget({required RegiFormUpdateDataState stateData}) {
    return ColumnWidget(
      child: TextFieldWidget(
        labelText: AppString.colony,
        controller: stateData.colonyController,
        keyboardType: TextInputType.text,
      ),
    );
  }

  Widget _streetNameWidget({required RegiFormUpdateDataState stateData}) {
    return ColumnWidget(
      child: TextFieldWidget(
        labelText: AppString.streetName,
        controller: stateData.streetController,
        keyboardType: TextInputType.text,
      ),
    );
  }

  Widget _townWidget({required RegiFormUpdateDataState stateData}) {
    return ColumnWidget(
      child: TextFieldWidget(
        labelText: stateData.labelModel.registration == null
            ? AppString.town
            : stateData.labelModel.registration!.town,
        controller: stateData.townController,
        keyboardType: TextInputType.name,
      ),
    );
  }

  Widget _districtDropdown({required RegiFormUpdateDataState stateData}) {
    return ColumnWidget(
      child: DropdownWidget<GetAllDistrictModel>(
        isRequired: true,
        hint:
        stateData.labelModel.registration == null
            ? AppString.district
            : stateData.labelModel.registration!.district,
        dropdownValue:
        stateData.allDistrictValue?.districtName != null
            ? stateData.allDistrictValue
            : null,
        items: stateData.getAllDistrictModel,
        onChanged: (val) {
          BlocProvider.of<RegistrationFormBloc>(
            context,
          ).add(RegistrationFormSetDistrictValue(allDistrictValue: val));
        },
      ),
    );
  }

  Widget _pinCodeWidget({required RegiFormUpdateDataState stateData}) {
    return ColumnWidget(
      child: TextFieldWidget(
        fieldKey: _pinCodeFieldKey,
        isRequired: true,
        labelText:
        stateData.labelModel.registration == null
            ? AppString.pinCode
            : stateData.labelModel.registration!.pincode,
        controller: stateData.pinCodeController,
        keyboardType: TextInputType.number,
        maxLength: 6,
        validator: (value) {
          if (value != stateData.pinCodeController.text.trim()) {
            return "Blank space";
          } else if (value!.isEmpty) {
            return "Please enter Pin Number";
          } else if (value.length <= 5) {
            return 'Pin Number must be of 6 digit';
          }
          return null;
        },
      ),
    );
  }

  Widget _wardNumberWidget({required RegiFormUpdateDataState stateData}) {
    return ColumnWidget(
      child: TextFieldWidget(
        isRequired: true,
        fieldKey: _wardNumberFieldKey,
        labelText: AppString.wardNumber,
        controller: stateData.wardNumberController,
        validator: (value) {
          if (value != stateData.wardNumberController.text.trim()) {
            return "Blank space";
          } else if (value!.isEmpty) {
            return "Please enter the Ward Number";
          }
          return null;
        },
      ),
    );
  }

  Widget _premiseTypeWidget({required RegiFormUpdateDataState stateData}) {
    return ColumnWidget(
      child: TextFieldWidget(
        labelText: AppString.premiseType,
        controller: stateData.premiseTypeController,
      ),
    );
  }

  Widget _residentStatusDropdown({required RegiFormUpdateDataState stateData}) {
    return ColumnWidget(
      child: DropdownWidget<GetResidentStatusModel>(
        hint:
        stateData.labelModel.registration == null
            ? AppString.residentStatus
            : stateData.labelModel.registration!.resident,
        dropdownValue:
        stateData.residentStatusValue?.key == null
            ? null
            : stateData.residentStatusValue,
        items: stateData.getResidentStatusList,
        onChanged: (val) {
          BlocProvider.of<RegistrationFormBloc>(context).add(
            RegistrationFormSetResidentStatusValue(residentStatusValue: val),
          );
        },
      ),
    );
  }

  Widget _numberKitchenWidget({required RegiFormUpdateDataState stateData}) {
    return TextFieldWidget(
      labelText:
      stateData.labelModel.registration == null
          ? AppString.noOfKitchen
          : stateData.labelModel.registration!.kitchen,
      controller: stateData.numberKitchenController,
      keyboardType: TextInputType.number,
      inputFormatters: [new LengthLimitingTextInputFormatter(2)],
    );
  }

  Widget _numberBathroomWidget({required RegiFormUpdateDataState stateData}) {
    return TextFieldWidget(
      labelText:
      stateData.labelModel.registration == null
          ? AppString.noOfBathroom
          : stateData.labelModel.registration!.bathroom,
      controller: stateData.numberBathroomController,
      keyboardType: TextInputType.number,
      inputFormatters: [new LengthLimitingTextInputFormatter(2)],
    );
  }

  Widget _existCookingFuelDropdown({
    required RegiFormUpdateDataState stateData,
  }) {
    return DropdownWidget<GetExistingCookingFuelModel>(
      hint: AppString.fuel,
      dropdownValue:
      stateData.existingCookingFuelValue?.key == null
          ? null
          : stateData.existingCookingFuelValue,
      items: stateData.existingCookingFuelList,
      onChanged: (val) {
        BlocProvider.of<RegistrationFormBloc>(context).add(
          RegistrationFormSetExistingCookingFuelValue(
            existingCookingFuelValue: val,
          ),
        );
      },
    );
  }

  Widget _familyMemberWidget({required RegiFormUpdateDataState stateData}) {
    return TextFieldWidget(
      labelText:
      stateData.labelModel.registration == null
          ? AppString.noOfFamilyMembers
          : stateData.labelModel.registration!.family,
      controller: stateData.familyMemberController,
      keyboardType: TextInputType.number,
      inputFormatters: [
        new LengthLimitingTextInputFormatter(2),
      ],
    );
  }

  Widget _latWidget({required RegiFormUpdateDataState stateData}) {
    return TextFieldWidget(
      isRequired: true,
      labelText:
      stateData.labelModel.registration == null
          ? AppString.locationLat
          : stateData.labelModel.registration!.lat,
      controller: stateData.latitudeController,
    );
  }

  Widget _longWidget({required RegiFormUpdateDataState stateData}) {
    return TextFieldWidget(
      isRequired: true,
      labelText:
      stateData.labelModel.registration == null
          ? AppString.locationLong
          : stateData.labelModel.registration!.long,
      controller: stateData.longitudeController,
    );
  }

  Widget _nearestLandmarkWidget({required RegiFormUpdateDataState stateData}) {
    return ColumnWidget(
      child: TextFieldWidget(
        labelText: AppString.nearestLandmark,
        controller: stateData.nearestLandmarkController,
        keyboardType: TextInputType.text,
      ),
    );
  }

  Widget _kycDoc1Dropdown({required RegiFormUpdateDataState stateData}) {
    return ColumnWidget(
      child: DropdownWidget(
        isRequired: true,
        hint: AppString.idProof,
        dropdownValue:
        stateData.identityProofValue?.key == null
            ? null
            : stateData.identityProofValue,
        items: stateData.identityProofList,
        onChanged: (val) {
          BlocProvider.of<RegistrationFormBloc>(
            context,
          ).add(RegistrationFormSetKycDoc1Value(kycDoc1Value: val));
        },
      ),
    );
  }

  Widget _kycDoc1Widget({required RegiFormUpdateDataState stateData}) {
    return ColumnWidget(
      child: TextFieldWidget(
        fieldKey: _kyc1NumberFieldKey,
        isRequired: true,
        labelText: AppString.idProofNo,
        controller: stateData.kyc1NumberController,
        keyboardType: TextInputType.text,
        maxLength: 20,
        validator: (value) {
          if (value != stateData.kyc1NumberController.text.trim()) {
            return "Blank space";
          }
          return null;
        },
      ),
    );
  }

  Widget _kycDoc2Dropdown({required RegiFormUpdateDataState stateData}) {
    return ColumnWidget(
      child: DropdownWidget<GetOwnershipProofModel>(
        isRequired: _isAGCL ? false : _regKey(stateData) != "Future Registration" ? true : false,
        hint:
        stateData.labelModel.kyc == null
            ? AppString.addProof
            : stateData.labelModel.kyc!.uploadDoc2,
        dropdownValue:
        stateData.ownershipProofValue?.key == null
            ? null
            : stateData.ownershipProofValue,
        items: stateData.ownershipProofList,
        onChanged: (val) {
          BlocProvider.of<RegistrationFormBloc>(
            context,
          ).add(RegistrationFormSetKycDoc2Value(kycDoc2Value: val));
        },
      ),
    );
  }

  Widget _kycDoc2Widget({required RegiFormUpdateDataState stateData}) {
    return ColumnWidget(
      child: TextFieldWidget(
        fieldKey: _kyc2NumberFieldKey,
        isRequired: _isAGCL ? false : _regKey(stateData) != "Future Registration" ? true : false,
        labelText: stateData.labelModel.kyc == null
            ? AppString.addProofNo
            : stateData.labelModel.kyc!.uploadDoc2No,
        controller: stateData.kyc2NumberController,
        keyboardType: TextInputType.text,
        maxLength: 20,
        validator: (value) {
          if(!_isAGCL){
            if (value != stateData.kyc2NumberController.text.trim()) {
              return "Blank space";
            }
          }
          return null;
        },
      ),
    );
  }

  Widget _kycDoc3Dropdown({required RegiFormUpdateDataState stateData}) {
    return ColumnWidget(
      child: DropdownWidget<GetKycDocModel>(
        isRequired: _isAGCL ? false  : true,
        hint: AppString.ownershipProperty,
        dropdownValue:
        stateData.kycDoc3Value?.key == null ? null : stateData.kycDoc3Value,
        items: stateData.kycDocList,
        onChanged: (val) {
          BlocProvider.of<RegistrationFormBloc>(
            context,
          ).add(RegistrationFormSetKycDoc3Value(kycDoc3Value: val));
        },
      ),
    );
  }

  Widget _kycDoc33Dropdown({required RegiFormUpdateDataState stateData}) {
    return ColumnWidget(
      child: DropdownWidget<GetOwnershipProofModel>(
        isRequired: _isAGCL ? false : _regKey(stateData) != "Future Registration" ? true : false,
        hint: _isAGCL ? AppString.ownershipProof : AppString.ownershipProperty,
        dropdownValue:
        stateData.addressProofValue?.key == null
            ? null
            : stateData.addressProofValue,
        items: stateData.listOfAddressProof,
        onChanged: (val) {
          BlocProvider.of<RegistrationFormBloc>(
            context,
          ).add(RegistrationFormAddressProofEvent(addressProofValue: val!));
        },
      ),
    );
  }

  Widget _kycDoc3Widget({required RegiFormUpdateDataState stateData}) {
    return ColumnWidget(
      child: TextFieldWidget(
        fieldKey: _kyc3NumberFieldKey,
        labelText: _isAGCL ? AppString.ownershipProofNo3 :
        stateData.labelModel.kyc == null
            ? AppString.ownershipProperty
            : stateData.labelModel.kyc!.uploadDoc3No,
        controller: stateData.kyc3NumberController,
        keyboardType: TextInputType.text,
        maxLength: 20,
        validator: (value) {
          if (value != stateData.kyc3NumberController.text.trim()) {
            return "Blank space";
          }
          return null;
        },
      ),
    );
  }

  Widget _preferredBillDropdown({required RegiFormUpdateDataState stateData}) {
    return ColumnWidget(
      child: DropdownWidget<GetEBillingModel>(
        hint:
        stateData.labelModel.consent == null
            ? AppString.billingMode
            : stateData.labelModel.consent!.preferredBilling,
        dropdownValue:
        stateData.eBillingValue?.key == null
            ? null
            : stateData.eBillingValue,
        items: stateData.eBillingList,
        onChanged: (val) {
          BlocProvider.of<RegistrationFormBloc>(
            context,
          ).add(RegistrationFormSetPreferredBillValue(preferredBillValue: val));
        },
      ),
    );
  }

  Widget _custBankNameDropdown({required RegiFormUpdateDataState stateData}) {
    return DropdownWidget(
      hint:
      stateData.labelModel.consent == null
          ? AppString.customerBankName
          : stateData.labelModel.consent!.custBank,
      dropdownValue:
      stateData.custBankNameValue!.isEmpty
          ? null
          : stateData.custBankNameValue,
      items: stateData.custBankNameList,
      onChanged: (val) {
        BlocProvider.of<RegistrationFormBloc>(
          context,
        ).add(RegistrationFormSetCustBankNameValue(custBankNameValue: val));
      },
    );
  }

  Widget _custBankAccNumberWidget({
    required RegiFormUpdateDataState stateData,
  }) {
    return TextFieldWidget(
      labelText:
      stateData.labelModel.consent == null
          ? AppString.customerAccountNo
          : stateData.labelModel.consent!.custAcc,
      controller: stateData.custBankAccNumberController,
      keyboardType: TextInputType.text,
      maxLength: 20,
    );
  }

  Widget _custIfscCodeWidget({required RegiFormUpdateDataState stateData}) {
    return TextFieldWidget(
      labelText:
      stateData.labelModel.consent == null
          ? AppString.customerIfscCode
          : stateData.labelModel.consent!.custIfsc,
      controller: stateData.custIfscCodeController,
      keyboardType: TextInputType.text,
      maxLength: 11,
      validator: (value) {
        if (value != stateData.custIfscCodeController.text.trim()) {
          return "Blank space";
        } else if (value!.isEmpty) {
          return "Please enter Customer Ifsc Code";
        } else if (value.length <= 10) {
          return "Customer Ifsc Code must be of 11 digit";
        }
        return null;
      },
    );
  }

  Widget _custBankAddWidget({required RegiFormUpdateDataState stateData}) {
    return TextFieldWidget(
      labelText:
      stateData.labelModel.consent == null
          ? AppString.customerBankAdd
          : stateData.labelModel.consent!.custBankAdd,
      controller: stateData.custBankAddController,
      keyboardType: TextInputType.text,
    );
  }

  Widget _meterTypeDropdown({required RegiFormUpdateDataState stateData}) {
    return ColumnWidget(
      child: DropdownWidget<ConnectionTypeModel>(
        isRequired: true,
        hint: AppString.meterType,
        dropdownValue:
        stateData.meterTypeVal?.key == null ? null : stateData.meterTypeVal,
        items: stateData.listOfMeterType,
        onChanged: (val) {
          BlocProvider.of<RegistrationFormBloc>(
            context,
          ).add(RegistrationFormMeterTypeValue(meterTypeVal: val!));
        },
      ),
    );
  }

  Widget _initialDepositStatusDropdown({
    required RegiFormUpdateDataState stateData,
  }) {
    return ColumnWidget(
      child: DropdownWidget(
        isRequired: true,
        hint: AppString.initDepositStatus,
        dropdownValue:
        stateData.initialDepositStatusValue?.key == null
            ? null
            : stateData.initialDepositStatusValue,
        items: stateData.initialDepositStatusList,
        onChanged: (val) {
          BlocProvider.of<RegistrationFormBloc>(context).add(
            RegistrationFormSetInitialDepositStatusValue(
              initialDepositStatusValue: val,
            ),
          );
        },
      ),
    );
  }

  Widget _reasonDepositStatusWidget({
    required RegiFormUpdateDataState stateData,
  }) {
    return stateData.initialDepositStatusValue?.value == "No"
        ? ColumnWidget(
      child: TextFieldWidget(
        labelText: AppString.reasonDeposit,
        controller: stateData.reasonDepositStsController,
        keyboardType: TextInputType.text,
      ),
    )
        : Container();
  }

  Widget _schemeTypeDropdown({required RegiFormUpdateDataState stateData}) {
    return DropdownWidget<GetAllDepositOfflineModel>(
      isRequired: true,
      hint: AppString.schemeType,
      dropdownValue:
      stateData.depositOfflineValue?.depositName == null
          ? null
          : stateData.depositOfflineValue,
      items: stateData.getAllDepositOfflineList,
      onChanged: (val) {
        log("depositTypeValue-->${stateData.depositOfflineValue?.depositName}");
        BlocProvider.of<RegistrationFormBloc>(
          context,
        ).add(RegistrationFormSchemeTypeValue(schemeTypeValue: val!));
      },
    );
  }

  Widget _depositTypeDetailsButton({
    required RegiFormUpdateDataState stateData,
  }) {
    return TextButton(
      child: Text(AppString.details),
      onPressed: () {
        FocusScope.of(context).unfocus();
        TextInput.finishAutofillContext();
        BlocProvider.of<RegistrationFormBloc>(
          context,
        ).add(SchemeTypeDetailEvent(context: context));
      },
    );
  }

  Widget _depositAmountWidget({required RegiFormUpdateDataState stateData}) {
    return ColumnWidget(
      child: TextFieldWidget(
        fieldKey: _schemeAmountFieldKey,
        isRequired: true,
        enabled: false,
        labelText:
        stateData.labelModel.deposit == null
            ? AppString.schemeAmt
            : stateData.labelModel.deposit!.depositAmt,
        controller: stateData.schemeAmountController,
        keyboardType: TextInputType.number,
        validator: (value) {
          if (value != stateData.schemeAmountController.text.trim()) {
            return "Blank space";
          }
          return null;
        },
      ),
    );
  }

  Widget _modeDepositDropdown({required RegiFormUpdateDataState stateData}) {
    return ColumnWidget(
      child: DropdownWidget(
        isRequired: true,
        hint: AppString.modeDeposit,
        dropdownValue:
        stateData.modeDepositValue?.key == null
            ? null
            : stateData.modeDepositValue,
        items: stateData.modeDepositList,
        onChanged: (val) {
          BlocProvider.of<RegistrationFormBloc>(
            context,
          ).add(RegistrationFormSetModeDepositValue(modeDepositValue: val));
        },
      ),
    );
  }

  Widget _chequeNoWidget({required RegiFormUpdateDataState stateData}) {
    return ColumnWidget(
      child: TextFieldWidget(
        fieldKey: _chequeNoFieldKey,
        isRequired: true,
        labelText:
        stateData.labelModel.deposit == null
            ? AppString.chqNo
            : stateData.labelModel.deposit!.chqNum,
        controller: stateData.chequeNoController,
        maxLength: 6,
        keyboardType: TextInputType.number,
        validator: (value) {
          if (value != stateData.chequeNoController.text.trim()) {
            return "Blank space";
          } else if (value!.isEmpty) {
            return "Please enter Cheque Number";
          } else if (value.length <= 5) {
            return 'Cheque Number must be of 6 digit';
          }
          return null;
        },
      ),
    );
  }

  Widget _chequeDateWidget({required RegiFormUpdateDataState stateData}) {
    return ColumnWidget(
      child: TextFieldWidget(
        isRequired: true,
        labelText:
        stateData.labelModel.deposit == null
            ? AppString.chqDate
            : stateData.labelModel.deposit!.chqDate,
        suffixIcon: Icon(
          Icons.calendar_today,
          color: EnvironmentConfig.of(context)!.primaryTheme,
        ),
        controller: stateData.chequeDateController,
        enabled: true,
        readOnly: true,
        keyboardType: TextInputType.datetime,
        onTap: () {
          BlocProvider.of<RegistrationFormBloc>(
            context,
          ).add(RegistrationFormSetChequeDateEvent(context: context));
        },
      ),
    );
  }

  Widget _chequePaymentBankDropdown({
    required RegiFormUpdateDataState stateData,
  }) {
    return ColumnWidget(
      child: DropdownWidget<String>(
        isRequired: true,
        hint: AppString.chqBank,
        dropdownValue:
        stateData.paymentBankNameValue!.isEmpty
            ? null
            : stateData.paymentBankNameValue,
        items: stateData.paymentBankNameList,
        onChanged: (val) {
          BlocProvider.of<RegistrationFormBloc>(context).add(
            RegistrationFormSetPaymentBankNameValue(paymentBankNameValue: val),
          );
        },
      ),
    );
  }

  Widget _chequeAccountNoWidget({required RegiFormUpdateDataState stateData}) {
    return ColumnWidget(
      child: TextFieldWidget(
        fieldKey: _chequeAccountNoFieldKey,
        isRequired: true,
        maxLength: 20,
        labelText:
        stateData.labelModel.deposit == null
            ? AppString.chequeAccountNo
            : stateData.labelModel.deposit!.chqNum,
        controller: stateData.chequeAccountNoController,
        keyboardType: TextInputType.text,
        validator: (value) {
          if (value != stateData.chequeAccountNoController.text.trim()) {
            return "Blank space";
          } else if (value!.isEmpty) {
            return "Please enter bank account number";
          } else if (value.length <= 7) {
            return 'bank account number must be of 6 digit';
          }
          return null;
        },
      ),
    );
  }

  Widget _chequeMICRNoWidget({required RegiFormUpdateDataState stateData}) {
    return ColumnWidget(
      child: TextFieldWidget(
        fieldKey: _chequeMicrNoFieldKey,
        isRequired: true,
        labelText: AppString.chequeMICRNo,
        maxLength: 9,
        controller: stateData.chequeMicrNoController,
        keyboardType: TextInputType.number,
        validator: (value) {
          if (value != stateData.chequeMicrNoController.text.trim()) {
            return "Blank space";
          } else if (value!.isEmpty) {
            return "Please enter MICR Code";
          } else if (value.length <= 8) {
            return 'MICR Code must be of 9 digit';
          }
          return null;
        },
      ),
    );
  }

  Widget _idFrontFileImg({required RegiFormUpdateDataState stateData}) =>
      ImageWidget(
        star: AppString.star,
        title: AppString.idProofFront,
        imgFile: stateData.idFrontFilePath,
        onPressed:
            () => _imageSheet(
          onCamera:
              () => BlocProvider.of<RegistrationFormBloc>(
            context,
          ).add(SelectIdFrontCameraCapture()),
          onGallery:
              () => BlocProvider.of<RegistrationFormBloc>(
            context,
          ).add(SelectIdFrontGalleryCapture()),
        ),
      );

  Widget _idBackFileImg({required RegiFormUpdateDataState stateData}) =>
      ImageWidget(
        title: AppString.idProofBack,
        imgFile: stateData.idBackFilePath,
        onPressed:
            () => _imageSheet(
          onCamera:
              () => BlocProvider.of<RegistrationFormBloc>(
            context,
          ).add(SelectIdBackCameraCapture()),
          onGallery:
              () => BlocProvider.of<RegistrationFormBloc>(
            context,
          ).add(SelectIdBackGalleryCapture()),
        ),
      );

  Widget _eleBillFrontImg({required RegiFormUpdateDataState stateData}) =>
      ImageWidget(
        star: _isAGCL ? "" : _regKey(stateData) != "Future Registration" ? AppString.star : "",
        title: AppString.addProofFront,
        imgFile: stateData.eleBillFrontPath,
        onPressed:
            () => _imageSheet(
          onCamera:
              () => BlocProvider.of<RegistrationFormBloc>(
            context,
          ).add(SelectAddFrontCameraCapture()),
          onGallery:
              () => BlocProvider.of<RegistrationFormBloc>(
            context,
          ).add(SelectAddFrontGalleryCapture()),
        ),
      );

  Widget _eleBillBackImg({required RegiFormUpdateDataState stateData}) =>
      ImageWidget(
        title: AppString.addProofBack,
        imgFile: stateData.eleBillBackPath,
        onPressed:
            () => _imageSheet(
          onCamera:
              () => BlocProvider.of<RegistrationFormBloc>(
            context,
          ).add(SelectAddBackCameraCapture()),
          onGallery:
              () => BlocProvider.of<RegistrationFormBloc>(
            context,
          ).add(SelectAddBackGalleryCapture()),
        ),
      );

  Widget _nocFrontImg({required RegiFormUpdateDataState stateData}) =>
      ImageWidget(
        title: AppString.ownershipProofFront,
        imgFile: stateData.nocFrontPath,
        onPressed:
            () => _imageSheet(
          onCamera:
              () => BlocProvider.of<RegistrationFormBloc>(
            context,
          ).add(SelectNocDocFrontCameraCapture()),
          onGallery:
              () => BlocProvider.of<RegistrationFormBloc>(
            context,
          ).add(SelectNocDocFrontGalleryCapture()),
        ),
      );

  Widget _nocBackImg({required RegiFormUpdateDataState stateData}) =>
      ImageWidget(
        title: AppString.ownershipProofBack,
        imgFile: stateData.nocBackPath,
        onPressed:
            () => _imageSheet(
          onCamera:
              () => BlocProvider.of<RegistrationFormBloc>(
            context,
          ).add(SelectNocDocBackCameraCapture()),
          onGallery:
              () => BlocProvider.of<RegistrationFormBloc>(
            context,
          ).add(SelectNocDocBackGalleryCapture()),
        ),
      );

  Widget _nocDocImg({required RegiFormUpdateDataState stateData}) =>
      ImageWidget(
        star: AppString.star,
        title: AppString.nocDoc,
        imgFile: stateData.nocDocPath,
        onPressed:
            () => _imageSheet(
          onCamera:
              () => BlocProvider.of<RegistrationFormBloc>(
            context,
          ).add(SelectNocDocCameraCapture()),
          onGallery:
              () => BlocProvider.of<RegistrationFormBloc>(
            context,
          ).add(SelectNocDocGalleryCapture()),
        ),
      );

  Widget _uploadCustomerImg({required RegiFormUpdateDataState stateData}) =>
      ImageWidget(
        title: AppString.customerImg,
        imgFile: stateData.uploadCustomerPath,
        onPressed:
            () => _imageSheet(
          onCamera:
              () => BlocProvider.of<RegistrationFormBloc>(
            context,
          ).add(SelectCustomerCameraCapture()),
          onGallery:
              () => BlocProvider.of<RegistrationFormBloc>(
            context,
          ).add(SelectCustomerGalleryCapture()),
        ),
      );

  Widget _uploadHouseImg({required RegiFormUpdateDataState stateData}) =>
      ImageWidget(
        title: AppString.houseImg,
        imgFile: stateData.uploadHousePath,
        onPressed:
            () => _imageSheet(
          onCamera:
              () => BlocProvider.of<RegistrationFormBloc>(
            context,
          ).add(SelectHouseCameraCapture()),
          onGallery:
              () => BlocProvider.of<RegistrationFormBloc>(
            context,
          ).add(SelectHouseGalleryCapture()),
        ),
      );

  Widget _chequeImg({required RegiFormUpdateDataState stateData}) =>
      ImageWidget(
        title: AppString.chqPhoto,
        imgFile: stateData.chequePath,
        onPressed:
            () => _imageSheet(
          onCamera:
              () => BlocProvider.of<RegistrationFormBloc>(
            context,
          ).add(SelectChqCameraCapture()),
          onGallery:
              () => BlocProvider.of<RegistrationFormBloc>(
            context,
          ).add(SelectChqGalleryCapture()),
        ),
      );

  Widget _previewButton({required RegiFormUpdateDataState stateData}) {
    return ButtonWidget(
      text: stateData.isUpdate == true ? "Update" : AppString.preview,
      onPressed: () {
        FocusScope.of(context).unfocus();
        if (formGlobalKey.currentState!.validate()) {
          formGlobalKey.currentState?.save();
          TextInput.finishAutofillContext();
          BlocProvider.of<RegistrationFormBloc>(
            context,
          ).add(RegistrationFormPreviewPageEvent(context: context));
        } else {
          _scrollToFirstInvalidField();
        }
      },
    );
  }

  Widget _verticalSpace() {
    return SizedBox(height: MediaQuery.of(context).size.height * 0.009);
  }

  Widget _widthSpace() {
    return SizedBox(width: MediaQuery.of(context).size.width * 0.02);
  }

  void _imageSheet({
    required VoidCallback onCamera,
    required VoidCallback onGallery,
  }) {
    showModalBottomSheet(
      enableDrag: true,
      isScrollControlled: true,
      context: context,
      builder:
          (sheetCtx) => ImagePopWidget(
        onTapCamera: () {
          Navigator.of(sheetCtx).pop();
          onCamera();
        },
        onTapGallery: () {
          Navigator.of(sheetCtx).pop();
          onGallery();
        },
      ),
    );
  }
}
