import 'package:flutter/services.dart';
import 'package:pbg_app/ExportFile/export_file.dart';
import 'package:flutter/material.dart';
import 'package:pbg_app/features/RegistrationForm/domain/model/save_registration_form_model.dart';

class RegistrationFormPage extends StatefulWidget {
  final bool isUpdate;
  final int position;
  final SaveRegistrationFormModel? localData;
  const  RegistrationFormPage({Key? key,required this.isUpdate, required this.position, this.localData }) : super(key: key);

  @override
  State<RegistrationFormPage> createState() => _RegistrationFormPageState();
}

class _RegistrationFormPageState extends State<RegistrationFormPage> {


  final formGlobalKey = GlobalKey<FormState>();

  @override
  void initState() {
     BlocProvider.of<RegistrationFormBloc>(context).add(RegistrationFormPageLoadEvent(
      context: context,
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBarWidget(
            boolLeading: true,
            title: RoutesName.customerRegistrationForm,
          ),
        ),
        body: BlocBuilder<RegistrationFormBloc, RegistrationFormState>(
          builder: (context, state) {
            if (state is RegistrationFormGetAllDataState){
              return _buildLayout(stateData: state);
            } else {
              return const Center(child: SpinLoader());
            }
          },
        ),
      ),
    );
  }
  // _buildLayout(stateData: state);

  Future<bool> _onWillPop() async {
    return (await showDialog(
        context: context,
        builder: (BuildContext mContext) => MessageBoxTwoButtonPopWidget(
            message: "Do you want to exit an Registration Form Page?",
            okButtonText: "Exit",
            onPressed: () =>  Navigator.of(context).pop(true)
        ))
    ) ?? false;
  }

  Widget _buildLayout({required RegistrationFormGetAllDataState stateData}) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            _verticalSpace(),
            _interestDropdown(stateData: stateData),
             _remarkWidget(stateData: stateData),
            _chargeAreaDropdown(stateData: stateData),
            _areaDropdown(stateData: stateData),
            _mobileNumberWidget(stateData: stateData),
            _altMobileNumberWidget(stateData: stateData),
            _firstNameWidget(stateData: stateData),
            _middleNameWidget(stateData: stateData),
            _lastNameWidget(stateData: stateData),
            _guardianDropdown(stateData: stateData),
            _guardianNameWidget(stateData: stateData),
            _emailIdWidget(stateData: stateData),
            Row(
              children: [
                Flexible(flex: 3, child: _propertyCategoryDropdown(stateData: stateData)),
                _widthSpace(),
                Flexible(flex: 3, child: _propertyClassDropdown(stateData: stateData)),
              ],
            ),
            _verticalSpace(),
            _buildNumberWidget(stateData: stateData),
            _houseNumberWidget(stateData: stateData),
            _colonyWidget(stateData: stateData),
            _streetNameWidget(stateData: stateData),
            _townWidget(stateData: stateData),
            _districtDropdown(stateData: stateData),
            _nearestLandmarkWidget(stateData: stateData),
            _pinCodeWidget(stateData: stateData),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Flexible(flex: 3, child: _latWidget(stateData: stateData)),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.02,
                ),
                Flexible(flex: 3, child: _longWidget(stateData: stateData)),
                IconButton(
                  icon: Icon(Icons.location_on_outlined, color:  AppColor.prime),
                  onPressed: (){
                    BlocProvider.of<RegistrationFormBloc>(context)
                        .add(RegistrationFormSetLocation(context: context));
                  },
                  //  stateData: stateData
                ),
              ],
            ),
            _verticalSpace(),
            if(stateData.interestValue?.value != "Future Registration")...[
              Row(
                children: [
                  Flexible(flex: 3, child: _existCookingFuelDropdown(stateData: stateData)),
                  _widthSpace(),
                  Flexible(flex: 3, child: _numberKitchenWidget(stateData: stateData)),
                ],
              ),
              _verticalSpace(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(flex: 3, child: _numberBathroomWidget(stateData: stateData)),
                  _widthSpace(),
                  Flexible(flex: 3, child: _familyMemberWidget(stateData: stateData)),
                ],
              ),
            ],
            _verticalSpace(),
            _kycDoc1Dropdown(stateData: stateData),
            _kycDoc1Widget(stateData: stateData),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _idFrontFileImg( stateData: stateData),
                _idBackFileImg(context: context, stateData: stateData),
              ],
            ),
            _verticalSpace(),
            _kycDoc2Dropdown(stateData: stateData),
            _kycDoc2Widget(stateData: stateData),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _eleBillFrontImg(context: context, stateData: stateData),
                _eleBillBackImg(context: context, stateData: stateData),
              ],
            ),
            _verticalSpace(),
            if(stateData.interestValue?.value != "Future Registration")...[
              _kycDoc3Dropdown(stateData: stateData),
                  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _uploadCustomerImg(context: context, stateData: stateData),
                  stateData.kycDoc3Value?.value == "Rented" ? _nocDocImg(context: context, stateData: stateData) : _uploadHouseImg(context: context, stateData: stateData),
                ],
              ),
              _verticalSpace(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  stateData.kycDoc3Value?.value == "Rented" ?  _uploadHouseImg(context: context, stateData: stateData) : Container(),
                ],
              ),
              _verticalSpace(),
              Row(
                children: [
                  Flexible(flex: 3, child: _acceptConversionPolicyDropdown(stateData: stateData)),
                  _widthSpace(),
                  Flexible(flex: 3, child: _acceptExtraFittingCostDropdown(stateData: stateData)),
                  _widthSpace(),
                  Flexible(flex: 3, child: _societyAllowDropdown(stateData: stateData)),
                ],
              ),
              BorderWidget(
                children: [
                  Text("Security Deposit",style: Styles.title,),
                  _verticalSpace(),
                  _initialDepositStatusDropdown(stateData: stateData),
                  _reasonDepositStatusWidget(stateData: stateData),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(flex: 6, child: _depositTypeDropdown(stateData: stateData)),
                      _widthSpace(),
                      Flexible(flex: 3, child: _depositTypeDetailsButton(stateData: stateData)),
                    ],
                  ),
                  _verticalSpace(),
                  _depositAmountWidget(stateData: stateData),
                  _modeDepositDropdown(stateData: stateData),
                ],
              ),
              _verticalSpace(),
              if (stateData.modeDepositValue != null && stateData.modeDepositValue?.value == "Cheque") ...[
                BorderWidget(
                  children: [
                    Text("Cheque",style: Styles.title,),
                    _verticalSpace(),
                    _chequeNoWidget(stateData: stateData),
                    _chequeDateWidget(stateData: stateData),
                    _verticalSpace(),
                    _chequePaymentBankDropdown(stateData: stateData),
                    _verticalSpace(),
                    _chequeAccountNoWidget(stateData: stateData),
                    _chequeMICRNoWidget(stateData: stateData),
                    _chequeImg(context: context, stateData: stateData),
                    _verticalSpace(),
                  ],
                ),
              ],
            ],
            _previewButton(),
            _verticalSpace(),
          ],
        ),
      ),
    );
  }

  Widget _interestDropdown({required RegistrationFormGetAllDataState stateData}) {
    return ColumnWidget(
      child: DropdownWidget<GetNotInterestedModel>(
        star: AppString.star,
        label:stateData.labelModel.registration == null ? AppString.registrationType :stateData.labelModel.registration!.registrationType,
        hint: stateData.labelModel.registration == null ? AppString.registrationType :stateData.labelModel.registration!.registrationType ,
        dropdownValue: stateData.interestValue == null ? null : stateData.interestValue,
        items: stateData.getNotInterestedList,
        onChanged: (val) {
          log("stateData.interestValue-->${stateData.interestValue}");
          BlocProvider.of<RegistrationFormBloc>(context).add(RegistrationFormSetInterestValue(interestValue: val!));
        },
      ),
    );
  }

  Widget _remarkWidget({required RegistrationFormGetAllDataState stateData}) {
    return stateData.interestValue?.value == "Future Registration" ? ColumnWidget(
      child: TextFieldWidget(
        label: AppString.reasonRegistration ,
        hintText: AppString.reasonRegistration ,
        controller: stateData.reasonRegistrationController,
        keyboardType: TextInputType.text,
      ),
    ): Container();
  }

  Widget _acceptConversionPolicyDropdown({required RegistrationFormGetAllDataState stateData}) {
    return ColumnWidget(
      child: DropdownWidget<GetAcceptConversionPolicyModel>(
        label:AppString.conversionPolicy,
        hint: AppString.conversionPolicy,
        dropdownValue: stateData.conversionPolicyValue == null? null:stateData.conversionPolicyValue,
        items: stateData.conversionPolicyList,
        onChanged: (val) {
          BlocProvider.of<RegistrationFormBloc>(context).add(RegistrationFormSetConversionPolicyValue(conversionPolicyValue: val!));
        },
      ),
    );
  }

  Widget _acceptExtraFittingCostDropdown({required RegistrationFormGetAllDataState stateData}) {
    return ColumnWidget(
      child: DropdownWidget<GetAcceptExtraFittingCostModel>(
        label: AppString.fittingCost,
        hint: AppString.fittingCost,
        dropdownValue: stateData.extraFittingValue == null ? null : stateData.extraFittingValue ,
        items: stateData.extraFittingCostList,
        onChanged: (val) {
          BlocProvider.of<RegistrationFormBloc>(context).add(RegistrationFormSetExtraFittingValue(extraFittingValue: val));
        },
      ),
    );
  }

  Widget _societyAllowDropdown({required RegistrationFormGetAllDataState stateData}) {
    return ColumnWidget(
      child: DropdownWidget<GetSocietyAllowModel>(
        label: stateData.labelModel.registration == null ?AppString.mdpeAllow :stateData.labelModel.registration!.mdpe,
        hint: stateData.labelModel.registration == null ?AppString.mdpeAllow :stateData.labelModel.registration!.mdpe,
        dropdownValue: stateData.societyAllowValue == null ? null :stateData.societyAllowValue,
        items: stateData.societyAllowList,
        onChanged: (val) {
          BlocProvider.of<RegistrationFormBloc>(context).add(RegistrationFormSetSocietyAllowValue(societyAllowValue: val));
        },
      ),
    );
  }

  Widget _chargeAreaDropdown({required RegistrationFormGetAllDataState stateData}) {
    return ColumnWidget(
      child: DropdownWidget<GetChargeAreaListModel>(
        star: AppString.star,
        label:stateData.labelModel.registration == null ? AppString.chargeArea :stateData.labelModel.registration!.chargeArea,
        hint: stateData.labelModel.registration == null ? AppString.chargeArea :stateData.labelModel.registration!.chargeArea,
        dropdownValue: stateData.chargeAreaValue == null ? null : stateData.chargeAreaValue,
        items: stateData.getChargeAreaListModel,
        onChanged: (val) {
          BlocProvider.of<RegistrationFormBloc>(context).add(RegistrationFormSetChargeAreaValue(chargeAreaValue: val));
        },
      ),
    );
  }

  Widget _areaDropdown({required RegistrationFormGetAllDataState stateData}) {
    return ColumnWidget(
      child: DropdownWidget<GetAllAreaModel>(
        star: AppString.star,
        label: stateData.labelModel.registration == null ? AppString.area :stateData.labelModel.registration!.area,
        hint: stateData.labelModel.registration == null ? AppString.area :stateData.labelModel.registration!.area,
        dropdownValue: stateData.areaValue == null ? null : stateData.areaValue,
        items: stateData.getAllAreaModel,
        onChanged: (val) {
          BlocProvider.of<RegistrationFormBloc>(context).add(RegistrationFormSetAreaValue(areaValue: val));
        },
      ),
    );
  }

  Widget _mobileNumberWidget({required RegistrationFormGetAllDataState stateData}) {
    return ColumnWidget(
      child: TextFieldWidget(
          star: AppString.star,
          hintText: stateData.labelModel.steps == null ? AppString.mobileNo : stateData.labelModel.steps!.mobile,
          label: stateData.labelModel.steps == null ? AppString.mobileNo : stateData.labelModel.steps!.mobile,
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
          onChanged: (v) {
            formGlobalKey.currentState?.validate();
          }),
    );
  }

  Widget _altMobileNumberWidget({required RegistrationFormGetAllDataState stateData}) {
    return ColumnWidget(
      child: TextFieldWidget(
        hintText: AppString.alternateMobileNo,
        label:AppString.alternateMobileNo,
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9]"))],
        maxLength: 10,
        controller: stateData.altMobileController,
      ),
    );
  }

  Widget _firstNameWidget({required RegistrationFormGetAllDataState stateData}) {
    return ColumnWidget(
      child: TextFieldWidget(
        star: AppString.star,
        label: stateData.labelModel.steps == null ? AppString.firstName : stateData.labelModel.steps!.firstname,
        hintText: stateData.labelModel.steps == null ? AppString.firstName : stateData.labelModel.steps!.firstname,
        controller: stateData.firstController,
        keyboardType: TextInputType.text,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp("[a-z A-Z]")),
        ],
        validator: (value) {
          if (value != stateData.firstController.text.trim()) {
            return "Blank space";
          } else if (value!.isEmpty || !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
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

  Widget _middleNameWidget({required RegistrationFormGetAllDataState stateData}) {
    return ColumnWidget(
      child: TextFieldWidget(
        label: stateData.labelModel.steps == null ? AppString.middleName : stateData.labelModel.steps!.middlename,
        hintText: stateData.labelModel.steps == null ? AppString.middleName : stateData.labelModel.steps!.middlename,
        controller: stateData.middleController,
        keyboardType: TextInputType.text,
        inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[a-z A-Z]"))],
        validator: (value) {
          if (value != stateData.middleController.text.trim()) {
            return "Blank space";
          }
          return null;
        },
      ),
    );
  }

  Widget _lastNameWidget({required RegistrationFormGetAllDataState stateData}) {
    return ColumnWidget(
      child: TextFieldWidget(
        star: AppString.star,
        label: stateData.labelModel.steps == null ? AppString.lastName : stateData.labelModel.steps!.lastname,
        hintText: stateData.labelModel.steps == null ? AppString.lastName : stateData.labelModel.steps!.lastname,
        controller: stateData.lastController,
        keyboardType: TextInputType.text,
        inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[a-z A-Z]"))],
        validator: (value) {
          if (value != stateData.lastController.text.trim()) {
            return "Blank space";
          } else if (value!.isEmpty || !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
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

  Widget _guardianDropdown({required RegistrationFormGetAllDataState stateData}) {
    return ColumnWidget(
      child: DropdownWidget<GetGuardianTypeModel>(
        star:stateData.interestValue?.value != "Future Registration" ? AppString.star : "",
        label: stateData.labelModel.registration == null ? AppString.guardianType :stateData.labelModel.registration!.guardianType,
        hint: stateData.labelModel.registration == null ? AppString.guardianType :stateData.labelModel.registration!.guardianType,
        dropdownValue: stateData.guardianTypeValue == null ? null :stateData.guardianTypeValue,
        items: stateData.getGuardianTypeList,
        onChanged: (val) {
          BlocProvider.of<RegistrationFormBloc>(context).add(RegistrationFormSetGuardianTypeValue(guardianTypeValue: val));
        },
      ),
    );
  }

  Widget _guardianNameWidget({required RegistrationFormGetAllDataState stateData}) {
    return ColumnWidget(
      child: TextFieldWidget(
        star: stateData.interestValue?.value != "Future Registration" ? AppString.star : "",
        label: stateData.labelModel.registration == null ? AppString.guardianName : stateData.labelModel.registration!.guardian,
        hintText:stateData.labelModel.registration == null ? AppString.guardianName : stateData.labelModel.registration!.guardian,
        controller: stateData.guardianNameController,
        keyboardType: TextInputType.text,
        inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[a-z A-Z]"))],
        validator: (value) {
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
        },
        onChanged: (v) {
          formGlobalKey.currentState?.validate();
        },
      ),
    );
  }

  Widget _emailIdWidget({required RegistrationFormGetAllDataState stateData}) {
    return ColumnWidget(
      child: TextFieldWidget(
        label: stateData.labelModel.registration == null ? AppString.emailAddress : stateData.labelModel.registration!.email,
        hintText: stateData.labelModel.registration == null ? AppString.emailAddress : stateData.labelModel.registration!.email,
        controller: stateData.emailIdController,
        textCapitalization: TextCapitalization.none,
        keyboardType: TextInputType.emailAddress,
         inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp("[a-z0-9@._-]")),
        ],
        validator: (value) {
          if(stateData.emailIdController.text.trim().isNotEmpty){
            if (value != stateData.emailIdController.text.trim()) {
              return AppString.blankSpace;
            }
            else if(!AppString.emailValid.hasMatch(value!)){
              return AppString.invalidFormat;
            }
            return null;
          }
          return null;
        },
      ),
    );
  }

  Widget _propertyCategoryDropdown({required RegistrationFormGetAllDataState stateData}) {
    return DropdownWidget<GetPropertyCategoryModel>(
      star: AppString.star,
      label: stateData.labelModel.registration == null ? AppString.propertyCategory : stateData.labelModel.registration!.propertyCategory,
      hint: stateData.labelModel.registration == null ? AppString.propertyCategory : stateData.labelModel.registration!.propertyCategory,
      dropdownValue: stateData.propertyCategoryValue?.name != null ?stateData.propertyCategoryValue :null,
      items: stateData.getPropertyCategoryModel,
      onChanged: (val) {
        BlocProvider.of<RegistrationFormBloc>(context).add(RegistrationFormSetPropertyCategoryValue(propertyCategoryValue: val));
      },
    );
  }

  Widget _propertyClassDropdown({required RegistrationFormGetAllDataState stateData}) {
    return DropdownWidget<GetPropertyClassModel>(
      star: AppString.star,
      label: stateData.labelModel.registration == null ? AppString.propertyClass :stateData.labelModel.registration!.propertyClass,
      hint: stateData.labelModel.registration == null ? AppString.propertyClass :stateData.labelModel.registration!.propertyClass,
      dropdownValue: stateData.propertyClassValue?.name != null ? stateData.propertyClassValue:null,
      items: stateData.getPropertyClassModel,
      onChanged: (val) {
        BlocProvider.of<RegistrationFormBloc>(context).add(RegistrationFormSetPropertyClassValue(propertyClassValue: val));
      },
    );
  }

  Widget _buildNumberWidget({required RegistrationFormGetAllDataState stateData}) {
    return ColumnWidget(
      child: TextFieldWidget(
        label: AppString.buildingNumber,
        hintText: AppString.buildingNumber,
        controller: stateData.buildingNumberController,
        keyboardType: TextInputType.text,
        validator: (value) {
          if (value != stateData.buildingNumberController.text.trim()) {
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

  Widget _houseNumberWidget({required RegistrationFormGetAllDataState stateData}) {
    return ColumnWidget(
      child: TextFieldWidget(
        star: AppString.star,
        label: stateData.labelModel.registration == null ? AppString.houseNumber :stateData.labelModel.registration!.house,
        hintText: stateData.labelModel.registration == null ? AppString.houseNumber :stateData.labelModel.registration!.house,
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
        onChanged: (v) {
          formGlobalKey.currentState?.validate();
        },
      ),
    );
  }

  Widget _colonyWidget({required RegistrationFormGetAllDataState stateData}) {
    return ColumnWidget(
      child: TextFieldWidget(
        star: AppString.star,
        label: AppString.colony,
        hintText: AppString.colony,
        controller: stateData.colonyController,
        keyboardType: TextInputType.text,
        validator: (value) {
          if (value != stateData.colonyController.text.trim()) {
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

  Widget _streetNameWidget({required RegistrationFormGetAllDataState stateData}) {
    return ColumnWidget(
      child: TextFieldWidget(
        star: AppString.star,
        label: AppString.streetName,
        hintText: AppString.streetName,
        controller: stateData.streetController,
        keyboardType: TextInputType.text,
        validator: (value) {
          if (value != stateData.streetController.text.trim()) {
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

  Widget _townWidget({required RegistrationFormGetAllDataState stateData}) {
    return ColumnWidget(
      child: TextFieldWidget(
        label: stateData.labelModel.registration == null ? AppString.town : stateData.labelModel.registration!.town,
        hintText: stateData.labelModel.registration == null ? AppString.town : stateData.labelModel.registration!.town,
        controller: stateData.townController,
        keyboardType: TextInputType.name,
        validator: (value) {
          if (value != stateData.townController.text.trim()) {
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

  Widget _districtDropdown({required RegistrationFormGetAllDataState stateData}) {
    return ColumnWidget(
      child: DropdownWidget<GetAllDistrictModel>(
        star: AppString.star,
        label: stateData.labelModel.registration == null ? AppString.district :stateData.labelModel.registration!.district,
        hint: stateData.labelModel.registration == null ? AppString.district :stateData.labelModel.registration!.district,
        dropdownValue: stateData.allDistrictValue?.districtName != null ? stateData.allDistrictValue :null,
        items: stateData.getAllDistrictModel,
        onChanged: (val) {
          BlocProvider.of<RegistrationFormBloc>(context).add(RegistrationFormSetDistrictValue(allDistrictValue: val));
        },
      ),
    );
  }

  Widget _pinCodeWidget({required RegistrationFormGetAllDataState stateData}) {
    return ColumnWidget(
      child: TextFieldWidget(
          star: AppString.star,
          label: stateData.labelModel.registration == null ? AppString.pinCode : stateData.labelModel.registration!.pincode,
          hintText: stateData.labelModel.registration == null ? AppString.pinCode : stateData.labelModel.registration!.pincode,
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
          onChanged: (v) {
            formGlobalKey.currentState?.validate();
          }),
    );
  }

  Widget _residentStatusDropdown({required RegistrationFormGetAllDataState stateData}) {
    return ColumnWidget(
      child: DropdownWidget<GetResidentStatusModel>(
        label: stateData.labelModel.registration == null ? AppString.residentStatus :stateData.labelModel.registration!.resident,
        hint: stateData.labelModel.registration == null ? AppString.residentStatus :stateData.labelModel.registration!.resident,
        dropdownValue: stateData.residentStatusValue == null ? null : stateData.residentStatusValue,
        items: stateData.getResidentStatusList,
        onChanged: (val) {
          BlocProvider.of<RegistrationFormBloc>(context).add(RegistrationFormSetResidentStatusValue(residentStatusValue: val));
        },
      ),
    );
  }

  Widget _numberKitchenWidget({required RegistrationFormGetAllDataState stateData}) {
    return TextFieldWidget(
      label: stateData.labelModel.registration == null ? AppString.noOfKitchen :stateData.labelModel.registration!.kitchen,
      hintText: stateData.labelModel.registration == null ? AppString.noOfKitchen :stateData.labelModel.registration!.kitchen,
      controller: stateData.numberKitchenController,
      keyboardType: TextInputType.number,
      inputFormatters: [
        new LengthLimitingTextInputFormatter(2), /// here char limit is 5
      ],
     // maxLength: 2,
    );
  }

  Widget _numberBathroomWidget({required RegistrationFormGetAllDataState stateData}) {
    return TextFieldWidget(
      label: stateData.labelModel.registration == null ? AppString.noOfBathroom :stateData.labelModel.registration!.bathroom,
      hintText: stateData.labelModel.registration == null ? AppString.noOfBathroom :stateData.labelModel.registration!.bathroom,
      controller: stateData.numberBathroomController,
      keyboardType: TextInputType.number,
      inputFormatters: [
        new LengthLimitingTextInputFormatter(2), /// here char limit is 5
      ],
   //   maxLength: 2,
    );
  }

  Widget _existCookingFuelDropdown({required RegistrationFormGetAllDataState stateData}) {
    return DropdownWidget<GetExistingCookingFuelModel>(
      label: AppString.fuel,
      hint: AppString.fuel,
      dropdownValue: stateData.existingCookingFuelValue == null ? null : stateData.existingCookingFuelValue,
      items: stateData.existingCookingFuelList,
      onChanged: (val) {
        BlocProvider.of<RegistrationFormBloc>(context).add(RegistrationFormSetExistingCookingFuelValue(existingCookingFuelValue: val));
      },
    );
  }

  Widget _familyMemberWidget({required RegistrationFormGetAllDataState stateData}) {
    return TextFieldWidget(
      label: stateData.labelModel.registration == null ? AppString.noOfFamilyMembers :stateData.labelModel.registration!.family,
      hintText: stateData.labelModel.registration == null ? AppString.noOfFamilyMembers :stateData.labelModel.registration!.family,
      controller: stateData.familyMemberController,
      keyboardType: TextInputType.number,
      inputFormatters: [
        new LengthLimitingTextInputFormatter(2), /// here char limit is 5
      ],
    //  maxLength: 2,
    );
  }

  Widget _latWidget({required RegistrationFormGetAllDataState stateData}) {
    return TextFieldWidget(
      star: AppString.star,
      label: stateData.labelModel.registration == null ? AppString.locationLat :stateData.labelModel.registration!.lat,
      hintText: stateData.labelModel.registration == null ? AppString.locationLat :stateData.labelModel.registration!.lat,
      controller: stateData.latitudeController,
    );
  }

  Widget _longWidget({required RegistrationFormGetAllDataState stateData}) {
    return TextFieldWidget(
      star: AppString.star,
      label: stateData.labelModel.registration == null ? AppString.locationLong :stateData.labelModel.registration!.long,
      hintText: stateData.labelModel.registration == null ? AppString.locationLong :stateData.labelModel.registration!.long,
      controller: stateData.longitudeController,
    );
  }

  Widget _nearestLandmarkWidget({required RegistrationFormGetAllDataState stateData}) {
    return ColumnWidget(
      child: TextFieldWidget(
        label: AppString.nearestLandmark,
        hintText: AppString.nearestLandmark,
        controller: stateData.nearestLandmarkController,
        keyboardType: TextInputType.text,
        validator: (value) {
          if (value != stateData.nearestLandmarkController.text.trim()) {
            return "Blank space";
          }
          return null;
        },
      ),
    );
  }

  Widget _kycDoc1Dropdown({required RegistrationFormGetAllDataState stateData}) {
    return ColumnWidget(
      child: DropdownWidget(
        star: AppString.star,
        label: AppString.idProof,
        hint: AppString.idProof,
        dropdownValue: stateData.identityProofValue == null ? null : stateData.identityProofValue,
        items: stateData.identityProofList,
        onChanged: (val) {
          BlocProvider.of<RegistrationFormBloc>(context).add(RegistrationFormSetKycDoc1Value(kycDoc1Value: val));
        },
      ),
    );
  }

  Widget _kycDoc1Widget({required RegistrationFormGetAllDataState stateData}) {
    return ColumnWidget(
      child: TextFieldWidget(
        star: AppString.star,
        label: AppString.idProofNo,
        hintText:AppString.idProofNo,
        controller: stateData.kyc1NumberController,
        keyboardType: TextInputType.text,
        maxLength: 20,
        validator: (value) {
          if (value != stateData.kyc1NumberController.text.trim()) {
            return "Blank space";
          } else if (value!.isEmpty) {
            return "Please enter id proof no.";
          }
          return null;
        },
      ),
    );
  }


  Widget _kycDoc2Dropdown({required RegistrationFormGetAllDataState stateData}) {
    return ColumnWidget(
      child: DropdownWidget<GetOwnershipProofModel>(
        star: stateData.interestValue?.value != "Future Registration" ?AppString.star : "",
        label: stateData.labelModel.kyc == null ? AppString.addProof :stateData.labelModel.kyc!.uploadDoc2,
        hint:  stateData.labelModel.kyc == null ? AppString.addProof :stateData.labelModel.kyc!.uploadDoc2,
        dropdownValue: stateData.ownershipProofValue == null ? null : stateData.ownershipProofValue,
        items: stateData.ownershipProofList,
        onChanged: (val) {
          BlocProvider.of<RegistrationFormBloc>(context).add(RegistrationFormSetKycDoc2Value(kycDoc2Value: val));
        },
      ),
    );
  }

  Widget _kycDoc2Widget({required RegistrationFormGetAllDataState stateData}) {
    return ColumnWidget(
      child: TextFieldWidget(
        star: stateData.interestValue?.value != "Future Registration" ? AppString.star : "",
        label:  stateData.labelModel.kyc == null ? AppString.addProofNo : stateData.labelModel.kyc!.uploadDoc2No,
        hintText:  stateData.labelModel.kyc == null ? AppString.addProofNo : stateData.labelModel.kyc!.uploadDoc2No,
        controller: stateData.kyc2NumberController,
        keyboardType: TextInputType.text,
        maxLength: 20,
        validator: (value) {
          if (value != stateData.kyc2NumberController.text.trim()) {
            return "Blank space";
          }
          return null;
        },
      ),
    );
  }

  Widget _kycDoc3Dropdown({required RegistrationFormGetAllDataState stateData}) {
    return ColumnWidget(
      child: DropdownWidget<GetKycDocModel>(
        star: AppString.star,
        label: AppString.ownershipProperty,
        hint: AppString.ownershipProperty,
        dropdownValue: stateData.kycDoc3Value == null ? null :stateData.kycDoc3Value,
        items: stateData.kycDocList,
        onChanged: (val) {
          BlocProvider.of<RegistrationFormBloc>(context).add(RegistrationFormSetKycDoc3Value(kycDoc3Value: val));
        },
      ),
    );
  }

  Widget _kycDoc3Widget({required RegistrationFormGetAllDataState stateData}) {
    return ColumnWidget(
      child: TextFieldWidget(
        label: stateData.labelModel.kyc == null ? AppString.ownershipProperty : stateData.labelModel.kyc!.uploadDoc3No,
        hintText: stateData.labelModel.kyc == null ? AppString.ownershipProperty : stateData.labelModel.kyc!.uploadDoc3No,
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

  Widget _preferredBillDropdown({required RegistrationFormGetAllDataState stateData}) {
    return ColumnWidget(
      child: DropdownWidget<GetEBillingModel>(
        label:stateData.labelModel.consent == null ? AppString.billingMode : stateData.labelModel.consent!.preferredBilling,
        hint:stateData.labelModel.consent == null ? AppString.billingMode : stateData.labelModel.consent!.preferredBilling,
        dropdownValue: stateData.eBillingValue == null ? null :stateData.eBillingValue,
        items: stateData.eBillingList,
        onChanged: (val) {
          BlocProvider.of<RegistrationFormBloc>(context).add(RegistrationFormSetPreferredBillValue(preferredBillValue: val));
        },
      ),
    );
  }

  Widget _custBankNameDropdown({required RegistrationFormGetAllDataState stateData}) {
    return DropdownWidget(
      label: stateData.labelModel.consent == null ? AppString.customerBankName : stateData.labelModel.consent!.custBank,
      hint:  stateData.labelModel.consent == null ? AppString.customerBankName : stateData.labelModel.consent!.custBank,
      dropdownValue: stateData.custBankNameValue == null ? null :stateData.custBankNameValue,
      items: stateData.custBankNameList,
      onChanged: (val) {
        BlocProvider.of<RegistrationFormBloc>(context).add(RegistrationFormSetCustBankNameValue(custBankNameValue: val));
      },
    );
  }

  Widget _custBankAccNumberWidget({required RegistrationFormGetAllDataState stateData}) {
    return TextFieldWidget(
      label: stateData.labelModel.consent == null ? AppString.customerAccountNo : stateData.labelModel.consent!.custAcc,
      hintText: stateData.labelModel.consent == null ? AppString.customerAccountNo : stateData.labelModel.consent!.custAcc,
      controller: stateData.custBankAccNumberController,
      keyboardType: TextInputType.text,
      maxLength: 20,
      /*  validator: (value) {
          if (value != customerAccountNum.text.trim()) {
            return "Blank space";
          } else if (value.isEmpty) {
            return "Please enter Customer Account Number";
          } else if (value.length <= 16) {
            return "Customer Account Number must be of 17 digit";
          }
          return null;
        },
        onChanged: (v) {
          formGlobalKey.currentState.validate();
        }*/
    );
  }

  Widget _custIfscCodeWidget({required RegistrationFormGetAllDataState stateData}) {
    return TextFieldWidget(
      label: stateData.labelModel.consent == null ? AppString.customerIfscCode : stateData.labelModel.consent!.custIfsc,
      hintText: stateData.labelModel.consent == null ? AppString.customerIfscCode : stateData.labelModel.consent!.custIfsc,
      controller: stateData.custIfscCodeController,
      keyboardType: TextInputType.text,
      maxLength: 11,
      /*  validator: (value) {
          if (value != IFSCController.text.trim()) {
            return "Blank space";
          } else if (value.isEmpty) {
            return "Please enter Customer Ifsc Code";
          } else if (value.length <= 10) {
            return "Customer Ifsc Code must be of 11 digit";
          }
          return null;
        },
        onChanged: (v) {
          formGlobalKey.currentState.validate();
        }*/
    );
  }

  Widget _custBankAddWidget({required RegistrationFormGetAllDataState stateData}) {
    return TextFieldWidget(
      label: stateData.labelModel.consent == null ? AppString.customerBankAdd : stateData.labelModel.consent!.custBankAdd,
      hintText: stateData.labelModel.consent == null ? AppString.customerBankAdd : stateData.labelModel.consent!.custBankAdd,
      controller: stateData.custBankAddController,
      keyboardType: TextInputType.text,
      /*  validator: (value) {
        if (value != bank_address.text.trim()) {
          return "Blank space";
        } else if (value.isEmpty) {
          return "Please enter the customer bank address";
        }
        return null;
      },
      onChanged: (v) {
        formGlobalKey.currentState.validate();
      },*/
    );
  }

  Widget _initialDepositStatusDropdown({required RegistrationFormGetAllDataState stateData}) {
    return ColumnWidget(
      child: DropdownWidget(
        star:AppString.star,
        label: stateData.labelModel.deposit == null ? AppString.depositStatus : stateData.labelModel.deposit!.depositSta,
        hint: stateData.labelModel.deposit == null ? AppString.depositStatus : stateData.labelModel.deposit!.depositSta,
        dropdownValue: stateData.initialDepositStatusValue == null ? null :stateData.initialDepositStatusValue,
        items: stateData.initialDepositStatusList,
        onChanged: (val) {
          BlocProvider.of<RegistrationFormBloc>(context).add(RegistrationFormSetInitialDepositStatusValue(initialDepositStatusValue: val));
        },
      ),
    );
  }

  Widget _reasonDepositStatusWidget({required RegistrationFormGetAllDataState stateData}) {
    return stateData.initialDepositStatusValue?.value == "No" ? ColumnWidget(
      child: TextFieldWidget(
        label: AppString.reasonDeposit ,
        hintText: AppString.reasonDeposit ,
        controller: stateData.reasonDepositStsController,
        keyboardType: TextInputType.text,
      ),
    ): Container();
  }

  Widget _depositTypeDropdown({required RegistrationFormGetAllDataState stateData}) {
    return DropdownWidget<GetAllDepositOfflineModel>(
      star:AppString.star,
      label: AppString.depositType,
      hint: AppString.depositType,
      dropdownValue: stateData.depositOfflineValue == null ? null : stateData.depositOfflineValue,
      items: stateData.getAllDepositOfflineList,
      onChanged: (val) {
        log("depositTypeValue-->${stateData.depositOfflineValue?.depositName}");
        BlocProvider.of<RegistrationFormBloc>(context).add(RegistrationFormSetDepositTypeValue(depositTypeValue: val));
      },
    );
  }

  Widget _depositTypeDetailsButton({required RegistrationFormGetAllDataState stateData}) {
    return TextButton(
      child:Text( AppString.details),
      onPressed: () {
        FocusScope.of(context).unfocus();
        TextInput.finishAutofillContext();
         BlocProvider.of<RegistrationFormBloc>(context).add(SchemeTypeDetailEvent(
          context: context,
        ));
      },
    );
  }

  Widget _depositAmountWidget({required RegistrationFormGetAllDataState stateData}) {
    return ColumnWidget(
      child: TextFieldWidget(
        star:AppString.star,
        enabled: false,
        label: stateData.labelModel.deposit == null ? AppString.depositAmt : stateData.labelModel.deposit!.depositAmt,
        hintText: stateData.labelModel.deposit == null ? AppString.depositAmt : stateData.labelModel.deposit!.depositAmt,
        controller: stateData.depositAmountController,
        keyboardType: TextInputType.number,
        validator: (value) {
          if (value != stateData.depositAmountController.text.trim()) {
            return "Blank space";
          }
          return null;
        },
      ),
    );
  }

  Widget _modeDepositDropdown({required RegistrationFormGetAllDataState stateData}) {
    return ColumnWidget(
      child: DropdownWidget(
        star:AppString.star,
        label:AppString.modeDeposit,
        hint: AppString.modeDeposit,
        dropdownValue: stateData.modeDepositValue == null ? null :stateData.modeDepositValue,
        items: stateData.modeDepositList,
        onChanged: (val) {
          log("stateData.modeDepositValue-->${val}");
          log("stateData.modeDepositValue-->${stateData.modeDepositValue}");
          BlocProvider.of<RegistrationFormBloc>(context).add(RegistrationFormSetModeDepositValue(modeDepositValue: val));
        },
      ),
    );
  }

  Widget _chequeNoWidget({required RegistrationFormGetAllDataState stateData}) {
    return ColumnWidget(
      child: TextFieldWidget(
          star:AppString.star,
          label: stateData.labelModel.deposit == null ? AppString.chqNo : stateData.labelModel.deposit!.chqNum,
          hintText: stateData.labelModel.deposit == null ? AppString.chqNo : stateData.labelModel.deposit!.chqNum,
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
          onChanged: (v) {
            formGlobalKey.currentState?.validate();
          }),
    );
  }

  Widget _chequeDateWidget({required RegistrationFormGetAllDataState stateData}) {
    return ColumnWidget(
      child: TextFieldWidget(
        star:AppString.star,
        label: stateData.labelModel.deposit == null ? AppString.chqDate : stateData.labelModel.deposit!.chqDate,
        hintText: stateData.labelModel.deposit == null ? AppString.chqDate : stateData.labelModel.deposit!.chqDate,
        suffixIcon: Icon(
          Icons.calendar_today,
          color: AppColor.prime,
        ),
        controller: stateData.chequeDateController,
        enabled: true,
        autofocus: false,
        keyboardType: TextInputType.datetime,
        onTap: () {
          BlocProvider.of<RegistrationFormBloc>(context).add(RegistrationFormSetChequeDateEvent(context: context));
        },
      ),
    );
  }

  Widget _chequePaymentBankDropdown({required RegistrationFormGetAllDataState stateData}) {
    return ColumnWidget(
      child: DropdownWidget(
        star:AppString.star,
        label:stateData.labelModel.deposit == null ? AppString.chqBank :  stateData.labelModel.deposit!.chqBank,
        hint: stateData.labelModel.deposit == null ? AppString.chqBank :  stateData.labelModel.deposit!.chqBank,
        dropdownValue: stateData.paymentBankNameValue,
        items: stateData.paymentBankNameList,
        onChanged: (val) {
          BlocProvider.of<RegistrationFormBloc>(context).add(RegistrationFormSetPaymentBankNameValue(paymentBankNameValue: val));
        },
      ),
    );
  }

  Widget _chequeAccountNoWidget({required RegistrationFormGetAllDataState stateData}) {
    return ColumnWidget(
      child: TextFieldWidget(
          star:AppString.star,
          maxLength: 20,
          label: stateData.labelModel.deposit == null ? AppString.chequeAccountNo :  stateData.labelModel.deposit!.chqNum,
          hintText: stateData.labelModel.deposit == null ? AppString.chequeAccountNo :  stateData.labelModel.deposit!.chqNum,
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
          onChanged: (v) {
            formGlobalKey.currentState?.validate();
          }),
    );
  }

  Widget _chequeMICRNoWidget({required RegistrationFormGetAllDataState stateData}) {
    return ColumnWidget(
      child: TextFieldWidget(
          star:AppString.star,
          label:AppString.chequeMICRNo,
          hintText: AppString.chequeMICRNo,
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
          onChanged: (v) {
            formGlobalKey.currentState?.validate();
          }),
    );
  }


  Widget _idFrontFileImg({required RegistrationFormGetAllDataState stateData}) {
    return ImageWidget(
        star: AppString.star,
        title: AppString.idProofFront ,
        imgFile: stateData.idFrontFilePath,
        onPressed: () {
          showModalBottomSheet(
              enableDrag: true,
              isScrollControlled: true,
              context: context, builder: (BuildContext context){
            return ImagePopWidget(
              onTapCamera: () async {
                Navigator.of(context).pop();
                BlocProvider.of<RegistrationFormBloc>(context).add(SelectIdFrontCameraCapture());
              },
              onTapGallery: () async {
                Navigator.of(context).pop();
                BlocProvider.of<RegistrationFormBloc>(context).add(SelectIdFrontGalleryCapture());
              },
            );
          });
        });
  }

  Widget _idBackFileImg({required BuildContext context, required RegistrationFormGetAllDataState stateData}) {
    return ImageWidget(
       title: AppString.idProofBack,
      imgFile: stateData.idBackFilePath,
      onPressed: () {
        showModalBottomSheet(
            enableDrag: true,
            isScrollControlled: true,
            context: context, builder: (BuildContext context){
          return ImagePopWidget(
            onTapCamera: () async {
              Navigator.of(context).pop();
              BlocProvider.of<RegistrationFormBloc>(context).add(SelectIdBackCameraCapture());
            },
            onTapGallery: () async {
              Navigator.of(context).pop();
              BlocProvider.of<RegistrationFormBloc>(context).add(SelectIdBackGalleryCapture());
            },
          );
        });
      },
    );
  }

  Widget _eleBillFrontImg({required BuildContext context, required RegistrationFormGetAllDataState stateData}) {
    return ImageWidget(
      star: stateData.interestValue?.value != "Future Registration" ?AppString.star : "",
      title: AppString.addProofFront ,
      imgFile: stateData.eleBillFrontPath,
      onPressed: () {
        showModalBottomSheet(
            enableDrag: true,
            isScrollControlled: true,
            context: context, builder: (BuildContext context){
          return ImagePopWidget(
            onTapCamera: () async {
              Navigator.of(context).pop();
              BlocProvider.of<RegistrationFormBloc>(context).add(SelectAddFrontCameraCapture());
            },
            onTapGallery: () async {
              Navigator.of(context).pop();
              BlocProvider.of<RegistrationFormBloc>(context).add(SelectAddFrontGalleryCapture());
            },
          );
        });
      },
    );
  }

  Widget _eleBillBackImg({required BuildContext context, required RegistrationFormGetAllDataState stateData}) {
    return ImageWidget(
        title: AppString.addProofBack,
        imgFile: stateData.eleBillBackPath,
        onPressed: () {
          showModalBottomSheet(
              enableDrag: true,
              isScrollControlled: true,
              context: context, builder: (BuildContext context){
            return ImagePopWidget(
              onTapCamera: () async {
                Navigator.of(context).pop();
                BlocProvider.of<RegistrationFormBloc>(context).add(SelectAddBackCameraCapture());
              },
              onTapGallery: () async {
                Navigator.of(context).pop();
                BlocProvider.of<RegistrationFormBloc>(context).add(SelectAddBackGalleryCapture());
              },
            );
          });
        });
  }

  Widget _customerConsentImg({required BuildContext context, required RegistrationFormGetAllDataState stateData}) {
    return ImageWidget(
        title: AppString.idProofFront ,
        imgFile: stateData.idFrontFilePath,
        onPressed: () {
          showModalBottomSheet(
              enableDrag: true,
              isScrollControlled: true,
              context: context, builder: (BuildContext context){
            return ImagePopWidget(
              onTapCamera: () async {
                Navigator.of(context).pop();
                BlocProvider.of<RegistrationFormBloc>(context).add(SelectIdFrontCameraCapture());
              },
              onTapGallery: () async {
                Navigator.of(context).pop();
                BlocProvider.of<RegistrationFormBloc>(context).add(SelectIdFrontGalleryCapture());
              },
            );
          });
        });
  }

  Widget _nocDocImg({required BuildContext context, required RegistrationFormGetAllDataState stateData}) {
    return ImageWidget(
        star: AppString.star,
        title: AppString.nocDoc,
        imgFile: stateData.nocDocPath,
        onPressed: () {
          showModalBottomSheet(
              enableDrag: true,
              isScrollControlled: true,
              context: context, builder: (BuildContext context){
            return ImagePopWidget(
              onTapCamera: () async {
                Navigator.of(context).pop();
                BlocProvider.of<RegistrationFormBloc>(context).add(SelectNocDocCameraCapture());
              },
              onTapGallery: () async {
                Navigator.of(context).pop();
                BlocProvider.of<RegistrationFormBloc>(context).add(SelectNocDocBackGalleryCapture());
              },
            );
          });
        });
  }

  /* Widget _nocBackImg({required BuildContext context, required RegistrationFormGetAllDataState stateData}) {
    return ImageWidget(
      onTap: () {
        BlocProvider.of<RegistrationFormBloc>(context).add(RegistrationFormSetNocBackPath(nocBackPath: stateData.nocBackPath, context: context));
      },
      child: stateData.nocBackPath.isEmpty ? _localBorderImg() : _fileImage(fileImage: File(stateData.nocBackPath.toString())),
      label: AppString.nocBackImgLabel,
    );
  }*/

  Widget _uploadCustomerImg({required BuildContext context, required RegistrationFormGetAllDataState stateData}) {
    return ImageWidget(
        title: AppString.customerImg,
        imgFile: stateData.uploadCustomerPath,
        onPressed: () {
          showModalBottomSheet(
              enableDrag: true,
              isScrollControlled: true,
              context: context, builder: (BuildContext context){
            return ImagePopWidget(
              onTapCamera: () async {
                Navigator.of(context).pop();
                BlocProvider.of<RegistrationFormBloc>(context).add(SelectCustomerCameraCapture());
              },
              onTapGallery: () async {
                Navigator.of(context).pop();
                BlocProvider.of<RegistrationFormBloc>(context).add(SelectCustomerGalleryCapture());
              },
            );
          });
        }
    );
  }

  Widget _uploadHouseImg({required BuildContext context, required RegistrationFormGetAllDataState stateData}) {
    return ImageWidget(
      title: AppString.houseImg ,
      imgFile: stateData.uploadHousePath,
      onPressed: () {
        showModalBottomSheet(
            enableDrag: true,
            isScrollControlled: true,
            context: context, builder: (BuildContext context){
          return ImagePopWidget(
            onTapCamera: () async {
              Navigator.of(context).pop();
              BlocProvider.of<RegistrationFormBloc>(context).add(SelectHouseCameraCapture());
            },
            onTapGallery: () async {
              Navigator.of(context).pop();
              BlocProvider.of<RegistrationFormBloc>(context).add(SelectHouseGalleryCapture());
            },
          );
        });
      },
    );
  }

  Widget _ownerConsentImg({required BuildContext context, required RegistrationFormGetAllDataState stateData}) {
    return ImageWidget(
     title: AppString.ownerConsentImg,
      imgFile: stateData.ownerConsentPath,
      onPressed: () {
        showModalBottomSheet(
            enableDrag: true,
            isScrollControlled: true,
            context: context, builder: (BuildContext context){
          return ImagePopWidget(
            onTapCamera: () async {
              Navigator.of(context).pop();
              BlocProvider.of<RegistrationFormBloc>(context).add(SelectIdFrontCameraCapture());
            },
            onTapGallery: () async {
              Navigator.of(context).pop();
              BlocProvider.of<RegistrationFormBloc>(context).add(SelectIdFrontGalleryCapture());
            },
          );
        });
      },
    );
  }

  Widget _cancelChequeImg({required BuildContext context, required RegistrationFormGetAllDataState stateData}) {
    return ImageWidget(
        title: AppString.cancelChqPhoto ,
        imgFile: stateData.cancelChequePath,
        onPressed: () {
          showModalBottomSheet(
              enableDrag: true,
              isScrollControlled: true,
              context: context, builder: (BuildContext context) {
            return ImagePopWidget(
              onTapCamera: () async {
                Navigator.of(context).pop();
                BlocProvider.of<RegistrationFormBloc>(context).add(
                    SelectIdFrontCameraCapture());
              },
              onTapGallery: () async {
                Navigator.of(context).pop();
                BlocProvider.of<RegistrationFormBloc>(context).add(
                    SelectIdFrontGalleryCapture());
              },
            );
          });
        }
    );
  }

  Widget _chequeImg({required BuildContext context, required RegistrationFormGetAllDataState stateData}) {
    return ImageWidget(
      star: AppString.star,
      title: AppString.chqPhoto,
      imgFile: stateData.chequePath,
      onPressed: (){
        showModalBottomSheet(
            enableDrag: true,
            isScrollControlled: true,
            context: context, builder: (BuildContext context){
          return ImagePopWidget(
            onTapCamera: () async {
              Navigator.of(context).pop();
              BlocProvider.of<RegistrationFormBloc>(context).add(SelectChqCameraCapture());
            },
            onTapGallery: () async {
              Navigator.of(context).pop();
              BlocProvider.of<RegistrationFormBloc>(context).add(SelectChqGalleryCapture());
            },
          );
        });
      },
    );
  }
  Widget _previewButton() {
    return ButtonWidget(
      text: AppString.preview,
      onPressed: () {
        FocusScope.of(context).unfocus();
        TextInput.finishAutofillContext();
        BlocProvider.of<RegistrationFormBloc>(context).add(RegistrationFormPreviewPageEvent(
          context: context,
        ));
      },
    );
  }



  Widget _verticalSpace() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.02,
    );
  }

  Widget _widthSpace() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.02,
    );
  }




  editPageData({required RegistrationFormGetAllDataState stateData}){
    /*if(widget.isUpdate){
      stateData.interestValue = widget.localData!.interested!;
      stateData.conversionPolicyValue = widget.localData!.acceptConversionPolicy!;
      stateData.extraFittingValue = widget.localData!.acceptExtraFittingCost!;
      stateData.societyAllowValue = widget.localData!.societyAllowedMdpe!;
      stateData.guardianTypeValue = widget.localData!.guardianType!;
      stateData.propertyCategoryValue = widget.localData!.propertyCategoryId.toString();
      stateData.propertyClassValue = widget.localData!.propertyClassId!.toString();
      stateData.allDistrictValue = widget.localData!.districtId!.toString();
      stateData.eBillingValue = widget.localData!.eBillingModel!.toString();
      stateData.initialDepositStatusValue = widget.localData!.initialDepositeStatus!.toString();
      stateData.modeDepositValue = widget.localData!.modeOfDeposite!;
      stateData.depositOfflineValue = widget.localData!.depositeType!;
      stateData.identityProofValue = widget.localData!.kycDocument1!;
      stateData.ownershipProofValue = widget.localData!.kycDocument2!;
      stateData.kycDoc3Value = widget.localData!.kycDocument3!;
      stateData.existingCookingFuelValue = widget.localData!.existingCookingFuel!;
      stateData.residentStatusValue = widget.localData!.residentStatus!;
      stateData.areaValue = widget.localData!.areaId!;
      stateData.chargeAreaValue = widget.localData!.chargeArea!;
      stateData.firstController.text = widget.localData!.firstName!;
      stateData.middleController.text = widget.localData!.middleName!;
      stateData.lastController.text = widget.localData!.lastName!;
      stateData.guardianNameController.text = widget.localData!.guardianName!;
      stateData.emailIdController.text = widget.localData!.emailId!;
      stateData.buildingNumberController.text = widget.localData!.buildingNumber!;
      stateData.houseNumberController.text = widget.localData!.houseNumber!;
      stateData.colonyController.text = widget.localData!.colonySocietyApartment!;
      stateData.streetController.text = widget.localData!.streetName!;
      stateData.townController.text = widget.localData!.town!;
      stateData.pinCodeController.text = widget.localData!.pinCode!;
      stateData.numberKitchenController.text = widget.localData!.noOfKitchen!;
      stateData.numberBathroomController.text = widget.localData!.noOfBathroom!;
      stateData.familyMemberController.text = widget.localData!.noOfFamilyMembers!;
      stateData.nearestLandmarkController.text = widget.localData!.nearestLandmark!;
      stateData.kyc1NumberController.text = widget.localData!.kycDocument1Number!;
      stateData.kyc2NumberController.text = widget.localData!.kycDocument2Number!;
      stateData.kyc3NumberController.text = widget.localData!.kycDocument3Number!;
      stateData.custBankAccNumberController.text = widget.localData!.bankAccountNumber!;
      stateData.custIfscCodeController.text = widget.localData!.bankIfscCode!;
      stateData.custBankAddController.text = widget.localData!.bankAddress!;
      stateData.depositAmountController.text = widget.localData!.depositTypeAmount!;
      stateData.latitudeController.text = widget.localData!.latitude!;
      stateData.longitudeController.text = widget.localData!.longitude!;
      stateData.chequeNoController.text = widget.localData!.chequeNumber!;
      stateData.chequeDateController.text = widget.localData!.chequeDepositDate!;
      stateData.chequeAccountNoController.text = widget.localData!.chequeBankAccount!;
      stateData.chequeMicrNoController.text = widget.localData!.chequeMicrAccount!;
      stateData.custBankNameValue = widget.localData!.bankNameOfBank!;
      stateData.paymentBankNameValue = widget.localData!.payementBankName!;
      *//*stateData.idFrontFilePath = widget.localData!.backSidePhoto1!;
      stateData.idBackFilePath = widget.localData!.documentUploadsPhoto1!;
      stateData.eleBillFrontPath = widget.localData!.backSidePhoto2!;
      stateData.eleBillBackPath = widget.localData!.mobileNumber!;
      stateData.nocFrontPath = widget.localData!.documentUploadsPhoto2!;
      stateData.nocBackPath = widget.localData!.backSidePhoto3!;
      stateData.uploadCustomerPath = widget.localData!.uploadCustomerPhoto!;
      stateData.uploadHousePath = widget.localData!.uploadHousePhoto!;
      stateData.customerConsentPath = widget.localData!.customerConsentPhoto!;
      stateData.ownerConsentPath = widget.localData!.ownerConsent!;
      stateData.cancelChequePath = widget.localData!.canceledChequePhoto!;
      stateData.chequePath = widget.localData!.chequePhoto!;*//*
    }*/
  }
}
