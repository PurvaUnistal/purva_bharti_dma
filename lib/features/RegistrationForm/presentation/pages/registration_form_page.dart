import 'dart:io';

import 'package:flutter/services.dart';
import 'package:pbg_app/ExportFile/export_file.dart';
import 'package:flutter/material.dart';
import 'package:pbg_app/Utils/common_widgets/Image/photo_upload_widget.dart';
import 'package:pbg_app/Utils/common_widgets/background_widget.dart';
import 'package:pbg_app/Utils/common_widgets/drop_down_search_widget.dart';
import 'package:pbg_app/Utils/common_widgets/res/app_config.dart';
import 'package:pbg_app/Utils/common_widgets/res/enums.dart';
import 'package:pbg_app/Utils/common_widgets/res/environment_config.dart';
import 'package:pbg_app/features/dashboard/domain/model/get_premise_type_model.dart';

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

  @override
  void initState() {
    super.initState();

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
              if (state is RegistrationFormGetAllDataState) {
                return _buildLayout(dataState: state);
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
      builder: (BuildContext mContext) => MessageBoxTwoButtonPopWidget(
        message: "Do you want to exit an Registration Form Page?",
        okButtonText: "Exit",
        onPressed: () => Navigator.of(context).pop(true),
      ),
    )) ??
        false;
  }

  Widget _buildLayout({required RegistrationFormGetAllDataState dataState}) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formGlobalKey,
          child: Column(
            children: [
              _registrationTypeDropdown(dataState: dataState),
              _reasonRegistrationController(dataState: dataState),
              _chargeAreaDropdown(dataState: dataState),
              _verticalSpace(),
              _areaDropdown(dataState: dataState),
              _verticalSpace(),
              _mobileNumberWidget(dataState: dataState),
              _verticalSpace(),
              _altMobileNumberWidget(dataState: dataState),
              _firstNameWidget(dataState: dataState),
              _middleNameWidget(dataState: dataState),
              _lastNameWidget(dataState: dataState),
              if (AppConfig.instanceInit()!.client == Client.purvaBharti ||
                  AppConfig.instanceInit()!.client == Client.hpoil ||
                  AppConfig.instanceInit()!.client == Client.hngpl) ...[
                _dobWidget(dataState: dataState),
              ],
              _guardianDropdown(dataState: dataState),
              _guardianNameWidget(dataState: dataState),
              _emailIdWidget(dataState: dataState),
              if (AppConfig.instanceInit()!.client == Client.purvaBharti ||
                  AppConfig.instanceInit()!.client == Client.hpoil ||
                  AppConfig.instanceInit()!.client == Client.hngpl) ...[
                _doorNumberWidget(dataState: dataState),
                _floorNumberWidget(dataState: dataState),
                _wardNumberWidget(dataState: dataState),
              ],
              dataState.registrationTypeValue.key == "1"
                  ? Column(
                children: [
                  Row(
                    children: [
                      Flexible(
                        flex: 3,
                        child: _propertyCategoryDropdown(
                          dataState: dataState,
                        ),
                      ),
                      _widthSpace(),
                      Flexible(
                        flex: 3,
                        child:
                        _propertyClassDropdown(dataState: dataState),
                      ),
                    ],
                  ),
                  _verticalSpace(),
                ],
              )
                  : Container(),
              _buildNumberWidget(dataState: dataState),
              if (AppConfig.instanceInit()!.client == Client.purvaBharti ||
                  AppConfig.instanceInit()!.client == Client.hngpl) ...[
                _premiseTypeDropdown(dataState: dataState),
              ] else if (AppConfig.instanceInit()!.client == Client.hpoil) ...[
                _premiseTypeController(dataState: dataState),
              ],
              _houseNumberWidget(dataState: dataState),
              _colonyWidget(dataState: dataState),
              _streetNameWidget(dataState: dataState),
              _townWidget(dataState: dataState),
              _districtDropdown(dataState: dataState),
              _nearestLandmarkWidget(dataState: dataState),
              _pinCodeWidget(dataState: dataState),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  dataState.isLocationLoader == false
                      ? Flexible(
                    child: Row(
                      children: [
                        Flexible(
                          flex: 3,
                          child: _latWidget(dataState: dataState),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.02,
                        ),
                        Flexible(
                          flex: 3,
                          child: _longWidget(dataState: dataState),
                        ),
                      ],
                    ),
                  )
                      : DottedLoaderWidget(),
                  IconButton(
                    icon: Icon(
                      Icons.location_on_outlined,
                      color: EnvironmentConfig.of(context)?.primaryTheme,
                    ),
                    onPressed: () {
                      BlocProvider.of<RegistrationFormBloc>(
                        context,
                      ).add(RegistrationFormSetLocation(context: context));
                    },
                  ),
                ],
              ),
              if (dataState.registrationTypeValue.key != "0") ...[
                _verticalSpace(),
                Row(
                  children: [
                    Flexible(
                      flex: 3,
                      child: _existCookingFuelDropdown(dataState: dataState),
                    ),
                    _widthSpace(),
                    Flexible(
                      flex: 3,
                      child: _numberKitchenWidget(dataState: dataState),
                    ),
                  ],
                ),
                _verticalSpace(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 3,
                      child: _numberBathroomWidget(dataState: dataState),
                    ),
                    _widthSpace(),
                    Flexible(
                      flex: 3,
                      child: _familyMemberWidget(dataState: dataState),
                    ),
                  ],
                ),
              ],
              _verticalSpace(),

              // ---------------- KYC DOC 1 ----------------
              _kycDoc1Dropdown(dataState: dataState),
              _kycDoc1Widget(dataState: dataState),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(child: _idFrontFileImg(dataState: dataState)),
                  _widthSpace(),
                  Flexible(child: _idBackFileImg(dataState: dataState)),
                ],
              ),
              _verticalSpace(),

              // ---------------- KYC DOC 2 ----------------
              _kycDoc2Dropdown(dataState: dataState),
              _kycDoc2Widget(dataState: dataState),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(child: _eleBillFrontImg(dataState: dataState)),
                  _widthSpace(),
                  Flexible(child: _eleBillBackImg(dataState: dataState)),
                ],
              ),
              _verticalSpace(),

              if (dataState.registrationTypeValue.key != "0") ...[
                // ---------------- KYC DOC 3 ----------------
                _kycDoc3Dropdown(dataState: dataState),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(child: _uploadCustomerImg(dataState: dataState)),
                    _widthSpace(),
                    Flexible(child: _uploadHouseImg(dataState: dataState)),
                    if (dataState.kycDoc3Value.value == "Rented") ...[
                      _widthSpace(),
                      Flexible(child: _nocDocImg(dataState: dataState)),
                    ],
                  ],
                ),
                _verticalSpace(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: _acceptConversionPolicyDropdown(
                        dataState: dataState,
                      ),
                    ),
                    _widthSpace(),
                    Flexible(
                      child: _acceptExtraFittingCostDropdown(
                        dataState: dataState,
                      ),
                    ),
                    _widthSpace(),
                    Flexible(
                      child: _societyAllowDropdown(dataState: dataState),
                    ),
                  ],
                ),
                BorderWidget(
                  children: [
                    Text("Security Deposit", style: Styles.title),
                    _verticalSpace(),
                    _initialDepositStatusDropdown(dataState: dataState),
                    _reasonDepositStatusWidget(dataState: dataState),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 6,
                          child: _schemeTypeDropdown(dataState: dataState),
                        ),
                        _widthSpace(),
                        Flexible(
                          flex: 3,
                          child: _depositTypeDetailsButton(
                            dataState: dataState,
                          ),
                        ),
                      ],
                    ),
                    _verticalSpace(),
                    _depositAmountWidget(dataState: dataState),
                    _modeDepositDropdown(dataState: dataState),
                  ],
                ),
                if (dataState.modeDepositValue != null &&
                    dataState.modeDepositValue.value == "Cheque") ...[
                  BorderWidget(
                    children: [
                      Text("Cheque", style: Styles.title),
                      _verticalSpace(),
                      _chequeNoWidget(dataState: dataState),
                      _chequeDateWidget(dataState: dataState),
                      _chequePaymentBankDropdown(dataState: dataState),
                      _chequeAccountNoWidget(dataState: dataState),
                      _chequeMICRNoWidget(dataState: dataState),
                      _chequeImg(dataState: dataState),
                    ],
                  ),
                ],
              ],
              _verticalSpace(),
              _verticalSpace(),
              _previewButton(dataState: dataState),
              _verticalSpace(),
            ],
          ),
        ),
      ),
    );
  }

  // ===========================================================================
  // DROPDOWNS & TEXT FIELDS
  // ===========================================================================

  Widget _registrationTypeDropdown({
    required RegistrationFormGetAllDataState dataState,
  }) {
    return ColumnWidget(
      child: DropdownWidget<GetNotInterestedModel>(
        isRequired: true,
        hint: dataState.labelModel.registration == null
            ? AppString.registrationType
            : dataState.labelModel.registration!.registrationType,
        dropdownValue: dataState.registrationTypeValue.key == null
            ? null
            : dataState.registrationTypeValue,
        items: dataState.getNotInterestedList,
        onChanged: (val) {
          log(
            "dataState.registrationTypeValue-->${dataState.registrationTypeValue}",
          );
          BlocProvider.of<RegistrationFormBloc>(
            context,
          ).add(RegistrationFormSetInterestValue(registrationTypeValue: val!));
        },
      ),
    );
  }

  Widget _reasonRegistrationController({
    required RegistrationFormGetAllDataState dataState,
  }) {
    return dataState.registrationTypeValue.key == "0"
        ? ColumnWidget(
      child: TextFieldWidget(
        labelText: AppString.reasonRegistration,
        controller: dataState.reasonRegistrationController,
        keyboardType: TextInputType.text,
      ),
    )
        : Container();
  }

  Widget _acceptConversionPolicyDropdown({
    required RegistrationFormGetAllDataState dataState,
  }) {
    return ColumnWidget(
      child: DropdownWidget<GetAcceptConversionPolicyModel>(
        hint: AppString.conversionPolicy,
        dropdownValue: dataState.conversionPolicyValue.key == null
            ? null
            : dataState.conversionPolicyValue,
        items: dataState.conversionPolicyList,
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

  Widget _acceptExtraFittingCostDropdown({
    required RegistrationFormGetAllDataState dataState,
  }) {
    return ColumnWidget(
      child: DropdownWidget<GetAcceptExtraFittingCostModel>(
        hint: AppString.fittingCost,
        dropdownValue: dataState.extraFittingValue.key == null
            ? null
            : dataState.extraFittingValue,
        items: dataState.extraFittingCostList,
        onChanged: (val) {
          BlocProvider.of<RegistrationFormBloc>(
            context,
          ).add(RegistrationFormSetExtraFittingValue(extraFittingValue: val));
        },
      ),
    );
  }

  Widget _societyAllowDropdown({
    required RegistrationFormGetAllDataState dataState,
  }) {
    return ColumnWidget(
      child: DropdownWidget<GetSocietyAllowModel>(
        hint: dataState.labelModel.registration == null
            ? AppString.mdpeAllow
            : dataState.labelModel.registration!.mdpe,
        dropdownValue: dataState.societyAllowValue.key == null
            ? null
            : dataState.societyAllowValue,
        items: dataState.societyAllowList,
        onChanged: (val) {
          BlocProvider.of<RegistrationFormBloc>(
            context,
          ).add(RegistrationFormSetSocietyAllowValue(societyAllowValue: val));
        },
      ),
    );
  }

  Widget _chargeAreaDropdown({
    required RegistrationFormGetAllDataState dataState,
  }) {
    return DropDownSearchWidget(
      isRequired: true,
      hint: dataState.labelModel.registration == null
          ? AppString.chargeArea
          : dataState.labelModel.registration!.chargeArea,
      dropdownValue: dataState.chargeAreaValue.gid == null
          ? null
          : dataState.chargeAreaValue,
      itemAsString: (alignmentData) => alignmentData.chargeAreaName.toString(),
      items: dataState.getChargeAreaListModel,
      onChanged: (val) {
        BlocProvider.of<RegistrationFormBloc>(
          context,
        ).add(RegistrationFormSetChargeAreaValue(chargeAreaValue: val));
      },
    );
  }

  Widget _areaDropdown({required RegistrationFormGetAllDataState dataState}) {
    return DropDownSearchWidget(
      isRequired: true,
      hint: dataState.labelModel.registration == null
          ? AppString.area
          : dataState.labelModel.registration!.area,
      dropdownValue:
      dataState.areaValue.gid == null ? null : dataState.areaValue,
      itemAsString: (alignmentData) => alignmentData.areaName.toString(),
      items: dataState.getAllAreaModel,
      onChanged: (val) {
        BlocProvider.of<RegistrationFormBloc>(
          context,
        ).add(RegistrationFormSetAreaValue(areaValue: val));
      },
    );
  }

  Widget _mobileNumberWidget({
    required RegistrationFormGetAllDataState dataState,
  }) {
    return TextFieldWidget(
      isRequired: true,
      labelText: dataState.labelModel.steps == null
          ? AppString.mobileNo
          : dataState.labelModel.steps!.mobile,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9]"))],
      maxLength: 10,
      controller: dataState.mobileController,
      validator: (String? value) {
        if (value != dataState.mobileController.text.trim()) {
          return "Blank space";
        } else if (value!.isEmpty) {
          return "Please enter Mobile Number";
        } else if (value.length <= 9) {
          return 'Mobile Number must be of 10 digit';
        }
        return null;
      },
      onChanged: (v) {
        formGlobalKey.currentState?.validate();
      },
    );
  }

  Widget _altMobileNumberWidget({
    required RegistrationFormGetAllDataState dataState,
  }) {
    return ColumnWidget(
      child: TextFieldWidget(
        labelText: AppString.alternateMobileNo,
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9]"))],
        maxLength: 10,
        controller: dataState.altMobileController,
      ),
    );
  }

  Widget _firstNameWidget({
    required RegistrationFormGetAllDataState dataState,
  }) {
    return ColumnWidget(
      child: TextFieldWidget(
        isRequired: true,
        labelText: dataState.labelModel.steps == null
            ? AppString.firstName
            : dataState.labelModel.steps!.firstname,
        controller: dataState.firstController,
        keyboardType: TextInputType.text,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp("[a-z A-Z]")),
        ],
        validator: (value) {
          if (value != dataState.firstController.text.trim()) {
            return "Blank space";
          } else if (value!.isEmpty ||
              !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
            return "Enter First Name";
          } else if (value.length <= 2) {
            return "First Name must be of minimum 2+ Letters";
          }
          return null;
        },
        onChanged: (v) {
          formGlobalKey.currentState?.validate();
        },
      ),
    );
  }

  Widget _middleNameWidget({
    required RegistrationFormGetAllDataState dataState,
  }) {
    return ColumnWidget(
      child: TextFieldWidget(
        labelText: dataState.labelModel.steps == null
            ? AppString.middleName
            : dataState.labelModel.steps!.middlename,
        controller: dataState.middleController,
        keyboardType: TextInputType.text,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp("[a-z A-Z]")),
        ],
        validator: (value) {
          if (value != dataState.middleController.text.trim()) {
            return "Blank space";
          }
          return null;
        },
      ),
    );
  }

  Widget _lastNameWidget({required RegistrationFormGetAllDataState dataState}) {
    return ColumnWidget(
      child: TextFieldWidget(
        isRequired: true,
        labelText: dataState.labelModel.steps == null
            ? AppString.lastName
            : dataState.labelModel.steps!.lastname,
        controller: dataState.lastController,
        keyboardType: TextInputType.text,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp("[a-z A-Z]")),
        ],
        validator: (value) {
          if (value != dataState.lastController.text.trim()) {
            return "Blank space";
          } else if (value!.isEmpty ||
              !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
            return "Enter Last Name";
          }
          return null;
        },
        onChanged: (v) {
          formGlobalKey.currentState?.validate();
        },
      ),
    );
  }

  Widget _dobWidget({required RegistrationFormGetAllDataState dataState}) {
    return ColumnWidget(
      child: TextFieldWidget(
        labelText: AppString.dob,
        isRequired: true,
        enabled: true,
        readOnly: true,
        controller: dataState.dobController,
        keyboardType: TextInputType.text,
        validator: (value) {
          if (value!.isEmpty) {
            return "Please enter Date of Birth";
          }
          return null;
        },
        onChanged: (v) {
          formGlobalKey.currentState?.validate();
        },
        onTap: () {
          BlocProvider.of<RegistrationFormBloc>(
            context,
          ).add(RegistrationFormSelectDateEvent(context: context));
        },
      ),
    );
  }

  Widget _guardianDropdown({
    required RegistrationFormGetAllDataState dataState,
  }) {
    return ColumnWidget(
      child: DropdownWidget<GetGuardianTypeModel>(
        isRequired: dataState.registrationTypeValue.key != "0",
        hint: dataState.labelModel.registration == null
            ? AppString.guardianType
            : dataState.labelModel.registration!.guardianType,
        dropdownValue: dataState.guardianTypeValue.key == null
            ? null
            : dataState.guardianTypeValue,
        items: dataState.getGuardianTypeList,
        onChanged: (val) {
          BlocProvider.of<RegistrationFormBloc>(
            context,
          ).add(RegistrationFormSetGuardianTypeValue(guardianTypeValue: val));
        },
      ),
    );
  }

  Widget _guardianNameWidget({
    required RegistrationFormGetAllDataState dataState,
  }) {
    return ColumnWidget(
      child: TextFieldWidget(
        isRequired: dataState.registrationTypeValue.key != "0",
        labelText: dataState.labelModel.registration == null
            ? AppString.guardianName
            : dataState.labelModel.registration!.guardian,
        controller: dataState.guardianNameController,
        keyboardType: TextInputType.text,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp("[a-z A-Z]")),
        ],
        validator: (value) {
          if (value != dataState.guardianNameController.text.trim()) {
            return "Blank space";
          } else if (value!.isEmpty) {
            return "Please enter Guardian name";
          } else if (!RegExp('.*[A-Z].*').hasMatch(value)) {
            return 'Input should contain an uppercase letter A-Z.';
          } else if (value.length <= 2) {
            return "Enter a Guardian name 2+char long";
          }
          return null;
        },
        onChanged: (v) {
          formGlobalKey.currentState?.validate();
        },
      ),
    );
  }

  Widget _emailIdWidget({required RegistrationFormGetAllDataState dataState}) {
    return ColumnWidget(
      child: TextFieldWidget(
        labelText: dataState.labelModel.registration == null
            ? AppString.emailAddress
            : dataState.labelModel.registration!.email,
        controller: dataState.emailIdController,
        keyboardType: TextInputType.emailAddress,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp("[a-z0-9@._-]")),
        ],
        validator: (value) {
          if (dataState.emailIdController.text.trim().isNotEmpty) {
            if (value != dataState.emailIdController.text.trim()) {
              return AppString.blankSpace;
            } else if (!AppString.emailValid.hasMatch(value!)) {
              return AppString.invalidFormat;
            }
            return null;
          }
          return null;
        },
        onChanged: (v) {
          formGlobalKey.currentState?.validate();
        },
      ),
    );
  }

  Widget _doorNumberWidget({
    required RegistrationFormGetAllDataState dataState,
  }) {
    return ColumnWidget(
      child: TextFieldWidget(
        labelText: AppString.doorNumber,
        controller: dataState.doorNumberController,
      ),
    );
  }

  Widget _floorNumberWidget({
    required RegistrationFormGetAllDataState dataState,
  }) {
    return ColumnWidget(
      child: TextFieldWidget(
        labelText: AppString.floorNumber,
        controller: dataState.floorNumberController,
      ),
    );
  }

  Widget _wardNumberWidget({
    required RegistrationFormGetAllDataState dataState,
  }) {
    return ColumnWidget(
      child: TextFieldWidget(
        labelText: AppString.wardNumber,
        controller: dataState.wardNumberController,
      ),
    );
  }

  Widget _propertyCategoryDropdown({
    required RegistrationFormGetAllDataState dataState,
  }) {
    return DropdownWidget<GetPropertyCategoryModel>(
      isRequired: true,
      hint: dataState.labelModel.registration == null
          ? AppString.propertyCategory
          : dataState.labelModel.registration!.propertyCategory,
      dropdownValue: dataState.propertyCategoryValue.name != null
          ? dataState.propertyCategoryValue
          : null,
      items: dataState.getPropertyCategoryModel,
      onChanged: (val) {
        BlocProvider.of<RegistrationFormBloc>(context).add(
          RegistrationFormSetPropertyCategoryValue(propertyCategoryValue: val),
        );
      },
    );
  }

  Widget _premiseTypeDropdown({
    required RegistrationFormGetAllDataState dataState,
  }) {
    return ColumnWidget(
      child: DropdownWidget<GetPremiseTypeModel>(
        hint: AppString.premiseType,
        dropdownValue: dataState.premiseTypeValue.key != null
            ? dataState.premiseTypeValue
            : null,
        items: dataState.listOfPremiseType,
        onChanged: (val) {
          BlocProvider.of<RegistrationFormBloc>(
            context,
          ).add(RegistrationFormSetPremiseTypeValue(premiseTypeValue: val!));
        },
      ),
    );
  }

  Widget _premiseTypeController({
    required RegistrationFormGetAllDataState dataState,
  }) {
    return ColumnWidget(
      child: TextFieldWidget(
        labelText: AppString.premiseType,
        controller: dataState.premiseTypeController,
        keyboardType: TextInputType.text,
      ),
    );
  }

  Widget _propertyClassDropdown({
    required RegistrationFormGetAllDataState dataState,
  }) {
    return DropdownWidget<GetPropertyClassModel>(
      isRequired: true,
      hint: dataState.labelModel.registration == null
          ? AppString.propertyClass
          : dataState.labelModel.registration!.propertyClass,
      dropdownValue: dataState.propertyClassValue.name != null
          ? dataState.propertyClassValue
          : null,
      items: dataState.getPropertyClassModel,
      onChanged: (val) {
        BlocProvider.of<RegistrationFormBloc>(
          context,
        ).add(RegistrationFormSetPropertyClassValue(propertyClassValue: val));
      },
    );
  }

  Widget _buildNumberWidget({
    required RegistrationFormGetAllDataState dataState,
  }) {
    return ColumnWidget(
      child: TextFieldWidget(
        labelText: AppString.buildingNumber,
        controller: dataState.buildingNumberController,
        keyboardType: TextInputType.text,
        validator: (value) {
          if (value != dataState.buildingNumberController.text.trim()) {
            return "Blank space";
          } else if (value!.isEmpty) {
            return "Please enter building number";
          }
          return null;
        },
        onChanged: (v) {
          formGlobalKey.currentState?.validate();
        },
      ),
    );
  }

  Widget _houseNumberWidget({
    required RegistrationFormGetAllDataState dataState,
  }) {
    return ColumnWidget(
      child: TextFieldWidget(
        isRequired: true,
        labelText: dataState.labelModel.registration == null
            ? AppString.houseNumber
            : dataState.labelModel.registration!.house,
        controller: dataState.houseNumberController,
        keyboardType: TextInputType.text,
        validator: (value) {
          if (value != dataState.houseNumberController.text.trim()) {
            return "Blank space";
          } else if (value!.isEmpty) {
            return "Please enter house number";
          }
          return null;
        },
        onChanged: (v) {
          formGlobalKey.currentState?.validate();
        },
      ),
    );
  }

  Widget _colonyWidget({required RegistrationFormGetAllDataState dataState}) {
    return ColumnWidget(
      child: TextFieldWidget(
        isRequired: true,
        labelText: AppString.colony,
        controller: dataState.colonyController,
        keyboardType: TextInputType.text,
        validator: (value) {
          if (value != dataState.colonyController.text.trim()) {
            return "Blank space";
          } else if (value!.isEmpty) {
            return "Please enter Colony/Society/Apartment";
          }
          return null;
        },
        onChanged: (v) {
          formGlobalKey.currentState?.validate();
        },
      ),
    );
  }

  Widget _streetNameWidget({
    required RegistrationFormGetAllDataState dataState,
  }) {
    return ColumnWidget(
      child: TextFieldWidget(
        isRequired: true,
        labelText: AppString.streetName,
        controller: dataState.streetController,
        keyboardType: TextInputType.text,
        validator: (value) {
          if (value != dataState.streetController.text.trim()) {
            return "Blank space";
          } else if (value!.isEmpty) {
            return "Please enter street name";
          }
          return null;
        },
        onChanged: (v) {
          formGlobalKey.currentState?.validate();
        },
      ),
    );
  }

  Widget _townWidget({required RegistrationFormGetAllDataState dataState}) {
    return ColumnWidget(
      child: TextFieldWidget(
        labelText: dataState.labelModel.registration == null
            ? AppString.town
            : dataState.labelModel.registration!.town,
        controller: dataState.townController,
        keyboardType: TextInputType.name,
        validator: (value) {
          if (value != dataState.townController.text.trim()) {
            return "Blank space";
          } else if (value!.isEmpty) {
            return "Please enter the town";
          }
          return null;
        },
        onChanged: (v) {
          formGlobalKey.currentState?.validate();
        },
      ),
    );
  }

  Widget _districtDropdown({
    required RegistrationFormGetAllDataState dataState,
  }) {
    return ColumnWidget(
      child: DropdownWidget<GetAllDistrictModel>(
        isRequired: true,
        hint: dataState.labelModel.registration == null
            ? AppString.district
            : dataState.labelModel.registration!.district,
        dropdownValue: dataState.allDistrictValue.districtName != null
            ? dataState.allDistrictValue
            : null,
        items: dataState.getAllDistrictModel,
        onChanged: (val) {
          BlocProvider.of<RegistrationFormBloc>(
            context,
          ).add(RegistrationFormSetDistrictValue(allDistrictValue: val));
        },
      ),
    );
  }

  Widget _pinCodeWidget({required RegistrationFormGetAllDataState dataState}) {
    return ColumnWidget(
      child: TextFieldWidget(
        isRequired: true,
        labelText: dataState.labelModel.registration == null
            ? AppString.pinCode
            : dataState.labelModel.registration!.pincode,
        controller: dataState.pinCodeController,
        keyboardType: TextInputType.number,
        maxLength: 6,
        validator: (value) {
          if (value != dataState.pinCodeController.text.trim()) {
            return "Blank space";
          } else if (value!.isEmpty) {
            return "Please enter Pin Number";
          } else if (value.length <= 5) {
            return 'Pin Number must be of 6 digit';
          }
          return null;
        },
        onChanged: (v) {
          formGlobalKey.currentState?.validate();
        },
      ),
    );
  }

  Widget _numberKitchenWidget({
    required RegistrationFormGetAllDataState dataState,
  }) {
    return TextFieldWidget(
      labelText: dataState.labelModel.registration == null
          ? AppString.noOfKitchen
          : dataState.labelModel.registration!.kitchen,
      controller: dataState.numberKitchenController,
      keyboardType: TextInputType.number,
      inputFormatters: [LengthLimitingTextInputFormatter(2)],
    );
  }

  Widget _numberBathroomWidget({
    required RegistrationFormGetAllDataState dataState,
  }) {
    return TextFieldWidget(
      labelText: dataState.labelModel.registration == null
          ? AppString.noOfBathroom
          : dataState.labelModel.registration!.bathroom,
      controller: dataState.numberBathroomController,
      keyboardType: TextInputType.number,
      inputFormatters: [LengthLimitingTextInputFormatter(2)],
    );
  }

  Widget _existCookingFuelDropdown({
    required RegistrationFormGetAllDataState dataState,
  }) {
    return DropdownWidget<GetExistingCookingFuelModel>(
      hint: AppString.fuel,
      dropdownValue: dataState.existingCookingFuelValue.key == null
          ? null
          : dataState.existingCookingFuelValue,
      items: dataState.existingCookingFuelList,
      onChanged: (val) {
        BlocProvider.of<RegistrationFormBloc>(context).add(
          RegistrationFormSetExistingCookingFuelValue(
            existingCookingFuelValue: val,
          ),
        );
      },
    );
  }

  Widget _familyMemberWidget({
    required RegistrationFormGetAllDataState dataState,
  }) {
    return TextFieldWidget(
      labelText: dataState.labelModel.registration == null
          ? AppString.noOfFamilyMembers
          : dataState.labelModel.registration!.family,
      controller: dataState.familyMemberController,
      keyboardType: TextInputType.number,
      inputFormatters: [LengthLimitingTextInputFormatter(2)],
    );
  }

  Widget _latWidget({required RegistrationFormGetAllDataState dataState}) {
    return TextFieldWidget(
      isRequired: true,
      labelText: dataState.labelModel.registration == null
          ? AppString.locationLat
          : dataState.labelModel.registration!.lat,
      controller: dataState.latitudeController,
    );
  }

  Widget _longWidget({required RegistrationFormGetAllDataState dataState}) {
    return TextFieldWidget(
      isRequired: true,
      labelText: dataState.labelModel.registration == null
          ? AppString.locationLong
          : dataState.labelModel.registration!.long,
      controller: dataState.longitudeController,
    );
  }

  Widget _nearestLandmarkWidget({required RegistrationFormGetAllDataState dataState}) {
    return ColumnWidget(
      child: TextFieldWidget(
        labelText: AppString.nearestLandmark,
        controller: dataState.nearestLandmarkController,
        keyboardType: TextInputType.text,
        validator: (value) {
          if (value != dataState.nearestLandmarkController.text.trim()) {
            return "Blank space";
          }
          return null;
        },
        onChanged: (v) {
          formGlobalKey.currentState?.validate();
        },
      ),
    );
  }

  Widget _kycDoc1Dropdown({required RegistrationFormGetAllDataState dataState}) {
    return ColumnWidget(
      child: DropdownWidget(
        isRequired: true,
        hint: AppString.idProof,
        dropdownValue: dataState.identityProofValue.key == null
            ? null
            : dataState.identityProofValue,
        items: dataState.identityProofList,
        onChanged: (val) {
          print("dataState.identityProofValue.value-->${dataState.identityProofValue.value}");
          formGlobalKey.currentState?.validate();
          BlocProvider.of<RegistrationFormBloc>(context)
              .add(RegistrationFormSetKycDoc1Value(identityProofValue: val));
        },
      ),
    );
  }

  Widget _kycDoc1Widget({required RegistrationFormGetAllDataState dataState}) {
    final idValue = (dataState.identityProofValue.value ?? "").toLowerCase().trim();
    final isAadhaarSelected = idValue.startsWith("aadha");
    final showMasked = isAadhaarSelected && dataState.isAadhaar;

    return ColumnWidget(
      child: TextFieldWidget(
          key: ValueKey("kyc1_$showMasked"),
          isRequired: true,
          obscureText: false,                 // never true
          readOnly: showMasked,               // can't type into "****"
          labelText: AppString.idProofNo,
          controller: showMasked
              ? dataState.kyc1MaskedController
              : dataState.kyc1NumberController,
          keyboardType:
          isAadhaarSelected ? TextInputType.number : TextInputType.text,
          maxLength: showMasked ? null : (isAadhaarSelected ? 12 : 20),
          suffixIcon: isAadhaarSelected ? IconButton(
            icon: Icon(
              showMasked ? Icons.visibility_off : Icons.visibility,
              color: EnvironmentConfig.of(context)!.primaryTheme,
            ),
            onPressed: () {
              BlocProvider.of<RegistrationFormBloc>(context).add(
                RegistrationFormIsAadhaarEvent(),
              );
            },
          ) : null,
          validator: (value) {
            final real = dataState.kyc1NumberController.text;
            if (real != real.trim()) {
              return "Blank space";
            }
            return null;
          },
          onChanged: (v) {
            formGlobalKey.currentState?.validate();
          }),
    );
  }

  Widget _kycDoc2Dropdown(
      {required RegistrationFormGetAllDataState dataState}) {
    return ColumnWidget(
      child: DropdownWidget<GetOwnershipProofModel>(
        isRequired: dataState.registrationTypeValue.key != "0" ? true : false,
        hint: dataState.labelModel.kyc == null
            ? AppString.addProof
            : dataState.labelModel.kyc!.uploadDoc2,
        dropdownValue: dataState.ownershipProofValue.key == null
            ? null
            : dataState.ownershipProofValue,
        items: dataState.ownershipProofList,
        onChanged: (val) {
          BlocProvider.of<RegistrationFormBloc>(context)
              .add(RegistrationFormSetKycDoc2Value(kycDoc2Value: val));
        },
      ),
    );
  }

  Widget _kycDoc2Widget({required RegistrationFormGetAllDataState dataState}) {
    return ColumnWidget(
      child: TextFieldWidget(
        isRequired: dataState.registrationTypeValue.key != "0",
        labelText: dataState.labelModel.kyc == null
            ? AppString.addProofNo
            : dataState.labelModel.kyc!.uploadDoc2No,
        controller: dataState.kyc2NumberController,
        keyboardType: TextInputType.text,
        maxLength: 20,
        validator: (value) {
          if (value != dataState.kyc2NumberController.text.trim()) {
            return "Blank space";
          }
          return null;
        },
        onChanged: (v) {
          formGlobalKey.currentState?.validate();
        },
      ),
    );
  }

  Widget _kycDoc3Dropdown({
    required RegistrationFormGetAllDataState dataState,
  }) {
    return ColumnWidget(
      child: DropdownWidget<GetKycDocModel>(
        isRequired: true,
        hint: AppString.ownershipProperty,
        dropdownValue:
        dataState.kycDoc3Value.key == null ? null : dataState.kycDoc3Value,
        items: dataState.kycDocList,
        onChanged: (val) {
          BlocProvider.of<RegistrationFormBloc>(
            context,
          ).add(RegistrationFormSetKycDoc3Value(kycDoc3Value: val));
        },
      ),
    );
  }

  Widget _initialDepositStatusDropdown({
    required RegistrationFormGetAllDataState dataState,
  }) {
    return ColumnWidget(
      child: DropdownWidget(
        isRequired: true,
        hint: AppString.initDepositStatus,
        dropdownValue: dataState.initialDepositStatusValue.key == null
            ? null
            : dataState.initialDepositStatusValue,
        items: dataState.initialDepositStatusList,
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
    required RegistrationFormGetAllDataState dataState,
  }) {
    return dataState.initialDepositStatusValue.value == "No"
        ? ColumnWidget(
      child: TextFieldWidget(
        labelText: AppString.reasonDeposit,
        controller: dataState.reasonDepositStsController,
        keyboardType: TextInputType.text,
      ),
    )
        : Container();
  }

  Widget _schemeTypeDropdown({
    required RegistrationFormGetAllDataState dataState,
  }) {
    return DropdownWidget<GetAllDepositOfflineModel>(
      isRequired: true,
      hint: AppString.schemeType,
      dropdownValue: dataState.depositOfflineValue.depositName == null
          ? null
          : dataState.depositOfflineValue,
      items: dataState.getAllDepositOfflineList,
      onChanged: (val) {
        log("depositTypeValue-->${dataState.depositOfflineValue.depositName}");
        BlocProvider.of<RegistrationFormBloc>(
          context,
        ).add(RegistrationFormSchemeTypeValue(schemeTypeValue: val!));
      },
    );
  }

  Widget _depositTypeDetailsButton({
    required RegistrationFormGetAllDataState dataState,
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

  Widget _depositAmountWidget({
    required RegistrationFormGetAllDataState dataState,
  }) {
    return ColumnWidget(
      child: TextFieldWidget(
        isRequired: true,
        enabled: false,
        labelText: dataState.labelModel.deposit == null
            ? AppString.schemeAmt
            : dataState.labelModel.deposit!.depositAmt,
        controller: dataState.schemeAmountController,
        keyboardType: TextInputType.number,
        validator: (value) {
          if (value != dataState.schemeAmountController.text.trim()) {
            return "Blank space";
          }
          return null;
        },
      ),
    );
  }

  Widget _modeDepositDropdown({
    required RegistrationFormGetAllDataState dataState,
  }) {
    return ColumnWidget(
      child: DropdownWidget(
        isRequired: true,
        hint: AppString.modeDeposit,
        dropdownValue: dataState.modeDepositValue.key == null
            ? null
            : dataState.modeDepositValue,
        items: dataState.modeDepositList,
        onChanged: (val) {
          BlocProvider.of<RegistrationFormBloc>(
            context,
          ).add(RegistrationFormSetModeDepositValue(modeDepositValue: val));
        },
      ),
    );
  }

  Widget _chequeNoWidget({required RegistrationFormGetAllDataState dataState}) {
    return ColumnWidget(
      child: TextFieldWidget(
        isRequired: true,
        labelText: dataState.labelModel.deposit == null
            ? AppString.chqNo
            : dataState.labelModel.deposit!.chqNum,
        controller: dataState.chequeNoController,
        maxLength: 6,
        keyboardType: TextInputType.number,
        validator: (value) {
          if (value != dataState.chequeNoController.text.trim()) {
            return "Blank space";
          } else if (value!.isEmpty) {
            return "Please enter Cheque Number";
          } else if (value.length <= 5) {
            return 'Cheque Number must be of 6 digit';
          }
          return null;
        },
        onChanged: (v) {
          formGlobalKey.currentState?.validate();
        },
      ),
    );
  }

  Widget _chequeDateWidget({
    required RegistrationFormGetAllDataState dataState,
  }) {
    return ColumnWidget(
      child: TextFieldWidget(
        isRequired: true,
        labelText: dataState.labelModel.deposit == null
            ? AppString.chqDate
            : dataState.labelModel.deposit!.chqDate,
        suffixIcon: Icon(
          Icons.calendar_today,
          color: EnvironmentConfig.of(context)?.primaryTheme,
        ),
        controller: dataState.chequeDateController,
        enabled: true,
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
    required RegistrationFormGetAllDataState dataState,
  }) {
    return ColumnWidget(
      child: DropdownWidget<String>(
        isRequired: true,
        hint: AppString.chqBank,
        dropdownValue: dataState.paymentBankNameValue.isEmpty
            ? null
            : dataState.paymentBankNameValue,
        items: dataState.paymentBankNameList,
        onChanged: (val) {
          BlocProvider.of<RegistrationFormBloc>(context).add(
            RegistrationFormSetPaymentBankNameValue(paymentBankNameValue: val),
          );
        },
      ),
    );
  }

  Widget _chequeAccountNoWidget({
    required RegistrationFormGetAllDataState dataState,
  }) {
    return ColumnWidget(
      child: TextFieldWidget(
        isRequired: true,
        maxLength: 20,
        labelText: dataState.labelModel.deposit == null
            ? AppString.chequeAccountNo
            : dataState.labelModel.deposit!.chqNum,
        controller: dataState.chequeAccountNoController,
        keyboardType: TextInputType.text,
        validator: (value) {
          if (value != dataState.chequeAccountNoController.text.trim()) {
            return "Blank space";
          } else if (value!.isEmpty) {
            return "Please enter bank account number";
          } else if (value.length <= 7) {
            return 'bank account number must be of 6 digit';
          }
          return null;
        },
        onChanged: (v) {
          formGlobalKey.currentState?.validate();
        },
      ),
    );
  }

  Widget _chequeMICRNoWidget({
    required RegistrationFormGetAllDataState dataState,
  }) {
    return ColumnWidget(
      child: TextFieldWidget(
        isRequired: true,
        labelText: AppString.chequeMICRNo,
        maxLength: 9,
        controller: dataState.chequeMicrNoController,
        keyboardType: TextInputType.number,
        validator: (value) {
          if (value != dataState.chequeMicrNoController.text.trim()) {
            return "Blank space";
          } else if (value!.isEmpty) {
            return "Please enter MICR Code";
          } else if (value.length <= 8) {
            return 'MICR Code must be of 9 digit';
          }
          return null;
        },
        onChanged: (v) {
          formGlobalKey.currentState?.validate();
        },
      ),
    );
  }

  // ===========================================================================
  // PHOTO FIELDS — sab ek hi helper se (PhotoUploadWidget + MediaPickerSheet)
  // ===========================================================================

  /// MediaPickerSheet khud band hota hai — yahan Navigator.pop() MAT lagana,
  /// warna RegistrationFormPage hi pop ho jayega.
  Widget _photoField({
    required String title,
    required File file,
    bool isRequired = false,
    required RegistrationFormEvent Function(BuildContext ctx) cameraEvent,
    required RegistrationFormEvent Function(BuildContext ctx) galleryEvent,
  }) {
    return PhotoUploadWidget(
      isRequired: isRequired,
      title: title,
      imagePath: file,
      onTap: () {
        FocusScope.of(context).unfocus();
        MediaPickerSheet.show(
          context: context,
          onCamera: () {
            if (!mounted) return;
            Navigator.of(context).pop();
            context.read<RegistrationFormBloc>().add(cameraEvent(context));
          },
          onGallery: () {
            if (!mounted) return;
            Navigator.of(context).pop();
            context.read<RegistrationFormBloc>().add(galleryEvent(context));
          },
        );
      },
    );
  }

  Widget _idFrontFileImg({required RegistrationFormGetAllDataState dataState}) {
    return _photoField(
      isRequired: true,
      title: AppString.idProofFront,
      file: dataState.idFrontFilePath,
      cameraEvent: (c) => SelectIdFrontCameraCapture(context: c),
      galleryEvent: (c) => SelectIdFrontGalleryCapture(context: c),
    );
  }

  Widget _idBackFileImg({required RegistrationFormGetAllDataState dataState}) {
    return _photoField(
      title: AppString.idProofBack,
      file: dataState.idBackFilePath,
      cameraEvent: (c) => SelectIdBackCameraCapture(context: c),
      galleryEvent: (c) => SelectIdBackGalleryCapture(context: c),
    );
  }

  Widget _eleBillFrontImg({
    required RegistrationFormGetAllDataState dataState,
  }) {
    return _photoField(
      isRequired: dataState.registrationTypeValue.key != "0",
      title: AppString.addProofFront,
      file: dataState.eleBillFrontPath,
      cameraEvent: (c) => SelectAddFrontCameraCapture(context: c),
      galleryEvent: (c) => SelectAddFrontGalleryCapture(context: c),
    );
  }

  Widget _eleBillBackImg({required RegistrationFormGetAllDataState dataState}) {
    return _photoField(
      title: AppString.addProofBack,
      file: dataState.eleBillBackPath,
      cameraEvent: (c) => SelectAddBackCameraCapture(context: c),
      galleryEvent: (c) => SelectAddBackGalleryCapture(context: c),
    );
  }

  Widget _uploadCustomerImg({
    required RegistrationFormGetAllDataState dataState,
  }) {
    return _photoField(
      title: AppString.customerImg,
      file: dataState.uploadCustomerPath,
      cameraEvent: (c) => SelectCustomerCameraCapture(context: c),
      galleryEvent: (c) => SelectCustomerGalleryCapture(context: c),
    );
  }

  Widget _uploadHouseImg({required RegistrationFormGetAllDataState dataState}) {
    return _photoField(
      title: AppString.houseImg,
      file: dataState.uploadHousePath,
      cameraEvent: (c) => SelectHouseCameraCapture(context: c),
      galleryEvent: (c) => SelectHouseGalleryCapture(context: c),
    );
  }

  Widget _nocDocImg({required RegistrationFormGetAllDataState dataState}) {
    return _photoField(
      isRequired: true,
      title: AppString.nocDoc,
      file: dataState.nocDocPath,
      cameraEvent: (c) => SelectNocDocCameraCapture(context: c),
      galleryEvent: (c) => SelectNocDocBackGalleryCapture(context: c),
    );
  }

  Widget _chequeImg({required RegistrationFormGetAllDataState dataState}) {
    return _photoField(
      isRequired: true,
      title: AppString.chqPhoto,
      file: dataState.chequePath,
      cameraEvent: (c) => SelectChqCameraCapture(context: c),
      galleryEvent: (c) => SelectChqGalleryCapture(context: c),
    );
  }

  // ===========================================================================
  // PREVIEW BUTTON & SPACING
  // ===========================================================================

  Widget _previewButton({required RegistrationFormGetAllDataState dataState}) {
    return ButtonWidget(
      text: dataState.isUpdate == true ? "Update" : AppString.preview,
      onPressed: () {
        if (formGlobalKey.currentState!.validate()) {
          formGlobalKey.currentState?.save();
          FocusScope.of(context).unfocus();
          TextInput.finishAutofillContext();
          BlocProvider.of<RegistrationFormBloc>(
            context,
          ).add(RegistrationFormPreviewPageEvent(context: context));
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
}