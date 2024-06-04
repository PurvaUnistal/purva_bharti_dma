import 'package:flutter/services.dart';
import 'package:pbg_app/ExportFile/export_file.dart';
import 'package:flutter/material.dart';
import 'package:pbg_app/Utils/common_widgets/Loader/SpinLoader.dart';
import 'package:pbg_app/Utils/common_widgets/app_bar_widget.dart';
import 'package:pbg_app/Utils/common_widgets/app_color.dart';
import 'package:pbg_app/Utils/common_widgets/app_string.dart';
import 'package:pbg_app/Utils/common_widgets/button_widget.dart';
import 'package:pbg_app/Utils/common_widgets/dropdown_widget.dart';
import 'package:pbg_app/Utils/common_widgets/message_box_two_button_pop.dart';
import 'package:pbg_app/Utils/common_widgets/styles_widget.dart';
import 'package:pbg_app/Utils/common_widgets/text_form_widget.dart';
import 'package:pbg_app/features/customRegistrationForm/domain/bloc/custom_registration_form_bloc.dart';
import 'package:pbg_app/features/customRegistrationForm/presentation/widgets/border_widget.dart';
import 'package:pbg_app/features/customRegistrationForm/presentation/widgets/column_widget.dart';
import 'package:pbg_app/features/customRegistrationForm/presentation/widgets/image_pop_widget.dart';
import 'package:pbg_app/features/customRegistrationForm/presentation/widgets/image_widget.dart';

class CustomerRegistrationFormPage extends StatefulWidget {
  final bool isUpdate;
  final int position;
  final SaveCustomerRegistrationOfflineModel? localData;
  const  CustomerRegistrationFormPage({Key? key,required this.isUpdate, required this.position, this.localData }) : super(key: key);

  @override
  State<CustomerRegistrationFormPage> createState() => _CustomerRegistrationFormPageState();
}

class _CustomerRegistrationFormPageState extends State<CustomerRegistrationFormPage> {


  final formGlobalKey = GlobalKey<FormState>();

  @override
  void initState() {
     BlocProvider.of<CustomRegistrationFormBloc>(context).add(CustomRegistrationFormPageLoadEvent(
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
            title: AppString.customerRegistrationForm,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios_rounded,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pushReplacementNamed(context, RoutesName.dashboard);
              },
            ),
          ),
        ),
        body: BlocBuilder<CustomRegistrationFormBloc, CustomRegistrationFormState>(
          builder: (context, state) {
            if (state is CustomRegistrationFormGetAllDataState){
              return _buildLayout(stateData: state);
            }
            /*else if(state is CustomRegistrationFormGetAllDataState){
              return editPageData(stateData: state);
            } */
            else {
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
            message: "Do you want to exit an App?",
            okButtonText: "Exit",
            onPressed: () =>  Navigator.of(context).pop(true)
        ))
    ) ?? false;
  }

  Widget _buildLayout({required CustomRegistrationFormGetAllDataState stateData}) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            _interestDropdown(stateData: stateData),
            _verticalSpace(),
             _remarkWidget(stateData: stateData),
            _chargeAreaDropdown(stateData: stateData),
            _verticalSpace(),
            _areaDropdown(stateData: stateData),
            _verticalSpace(),
            _mobileNumberWidget(stateData: stateData),
            _altMobileNumberWidget(stateData: stateData),
            _firstNameWidget(stateData: stateData),
            _verticalSpace(),
            _middleNameWidget(stateData: stateData),
            _verticalSpace(),
            _lastNameWidget(stateData: stateData),
            _verticalSpace(),
            _guardianDropdown(stateData: stateData),
            _verticalSpace(),
            _guardianNameWidget(stateData: stateData),
            _verticalSpace(),
            _emailIdWidget(stateData: stateData),
            _verticalSpace(),
            Row(
              children: [
                Flexible(flex: 3, child: _propertyCategoryDropdown(stateData: stateData)),
                _widthSpace(),
                Flexible(flex: 3, child: _propertyClassDropdown(stateData: stateData)),
              ],
            ),
            _verticalSpace(),
            _buildNumberWidget(stateData: stateData),
            _verticalSpace(),
            _houseNumberWidget(stateData: stateData),
            _verticalSpace(),
            _colonyWidget(stateData: stateData),
            _verticalSpace(),
            _streetNameWidget(stateData: stateData),
            _verticalSpace(),
            _townWidget(stateData: stateData),
            _verticalSpace(),
            _districtDropdown(stateData: stateData),
            _verticalSpace(),
            _nearestLandmarkWidget(stateData: stateData),
            _verticalSpace(),
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
                    BlocProvider.of<CustomRegistrationFormBloc>(context)
                        .add(CustomRegistrationFormSetLocation(context: context));
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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Flexible(flex: 3, child: _numberBathroomWidget(stateData: stateData)),
                  _widthSpace(),
                  Flexible(flex: 3, child: _familyMemberWidget(stateData: stateData)),
                ],
              ),
            ],
            _verticalSpace(),
            _kycDoc1Dropdown(stateData: stateData),
            _verticalSpace(),
            _kycDoc1Widget(stateData: stateData),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _idFrontFileImg( stateData: stateData),
                _idBackFileImg(context: context, stateData: stateData),
              ],
            ),
            _verticalSpace(),
            _kycDoc2Dropdown(stateData: stateData),
            _verticalSpace(),
            _kycDoc2Widget(stateData: stateData),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _eleBillFrontImg(context: context, stateData: stateData),
                _eleBillBackImg(context: context, stateData: stateData),
              ],
            ),
            _verticalSpace(),
            if(stateData.interestValue?.value != "Future Registration")...[
              _kycDoc3Dropdown(stateData: stateData),
              _verticalSpace(),
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
              _verticalSpace(),
              BorderWidget(
                children: [
                  Text("Security Deposit",style: Styles.title,),
                  _verticalSpace(),
                  _initialDepositStatusDropdown(stateData: stateData),
                  _verticalSpace(),
                  _reasonDepositStatusWidget(stateData: stateData),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Flexible(flex: 6, child: _depositTypeDropdown(stateData: stateData)),
                      _widthSpace(),
                      Flexible(flex: 3, child: _depositTypeDetailsButton(stateData: stateData)),
                    ],
                  ),
                  _depositAmountWidget(stateData: stateData),
                  _verticalSpace(),
                  _modeDepositDropdown(stateData: stateData),
                  _verticalSpace(),
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

  Widget _interestDropdown({required CustomRegistrationFormGetAllDataState stateData}) {
    return DropdownWidget<GetNotInterestedModel>(
      star: AppString.star,
      label:stateData.labelModel.registration == null ? AppString.registrationType :stateData.labelModel.registration!.registrationType,
      hint: stateData.labelModel.registration == null ? AppString.registrationType :stateData.labelModel.registration!.registrationType ,
      dropdownValue: stateData.interestValue == null ? null : stateData.interestValue,
      items: stateData.getNotInterestedList,
      onChanged: (val) {
        log("stateData.interestValue-->${stateData.interestValue}");
        BlocProvider.of<CustomRegistrationFormBloc>(context).add(CustomRegistrationFormSetInterestValue(interestValue: val!));
      },
    );
  }

  Widget _remarkWidget({required CustomRegistrationFormGetAllDataState stateData}) {
    return stateData.interestValue?.value == "Future Registration" ? ColumnWidget(
      context: context,
      child: TextFieldWidget(
        label: AppString.reasonRegistration ,
        hintText: AppString.reasonRegistration ,
        controller: stateData.reasonRegistrationController,
        keyboardType: TextInputType.text,
      ),
    ): Container();
  }

  Widget _acceptConversionPolicyDropdown({required CustomRegistrationFormGetAllDataState stateData}) {
    return DropdownWidget<GetAcceptConversionPolicyModel>(
      label:AppString.conversionPolicy,
      hint: AppString.conversionPolicy,
      dropdownValue: stateData.conversionPolicyValue == null? null:stateData.conversionPolicyValue,
      items: stateData.conversionPolicyList,
      onChanged: (val) {
        BlocProvider.of<CustomRegistrationFormBloc>(context).add(CustomRegistrationFormSetConversionPolicyValue(conversionPolicyValue: val!));
      },
    );
  }

  Widget _acceptExtraFittingCostDropdown({required CustomRegistrationFormGetAllDataState stateData}) {
    return DropdownWidget<GetAcceptExtraFittingCostModel>(
      label: AppString.fittingCost,
      hint: AppString.fittingCost,
      dropdownValue: stateData.extraFittingValue == null ? null : stateData.extraFittingValue ,
      items: stateData.extraFittingCostList,
      onChanged: (val) {
        BlocProvider.of<CustomRegistrationFormBloc>(context).add(CustomRegistrationFormSetExtraFittingValue(extraFittingValue: val));
      },
    );
  }

  Widget _societyAllowDropdown({required CustomRegistrationFormGetAllDataState stateData}) {
    return DropdownWidget<GetSocietyAllowModel>(
      label: stateData.labelModel.registration == null ?AppString.mdpeAllow :stateData.labelModel.registration!.mdpe,
      hint: stateData.labelModel.registration == null ?AppString.mdpeAllow :stateData.labelModel.registration!.mdpe,
      dropdownValue: stateData.societyAllowValue == null ? null :stateData.societyAllowValue,
      items: stateData.societyAllowList,
      onChanged: (val) {
        BlocProvider.of<CustomRegistrationFormBloc>(context).add(CustomRegistrationFormSetSocietyAllowValue(societyAllowValue: val));
      },
    );
  }

  Widget _chargeAreaDropdown({required CustomRegistrationFormGetAllDataState stateData}) {
    return DropdownWidget<GetChargeAreaListModel>(
      star: AppString.star,
      label:stateData.labelModel.registration == null ? AppString.chargeArea :stateData.labelModel.registration!.chargeArea,
      hint: stateData.labelModel.registration == null ? AppString.chargeArea :stateData.labelModel.registration!.chargeArea,
      dropdownValue: stateData.chargeAreaValue == null ? null : stateData.chargeAreaValue,
      items: stateData.getChargeAreaListModel,
      onChanged: (val) {
        BlocProvider.of<CustomRegistrationFormBloc>(context).add(CustomRegistrationFormSetChargeAreaValue(chargeAreaValue: val));
      },
    );
  }

  Widget _areaDropdown({required CustomRegistrationFormGetAllDataState stateData}) {
    return DropdownWidget<GetAllAreaModel>(
      star: AppString.star,
      label: stateData.labelModel.registration == null ? AppString.area :stateData.labelModel.registration!.area,
      hint: stateData.labelModel.registration == null ? AppString.area :stateData.labelModel.registration!.area,
      dropdownValue: stateData.areaValue == null ? null : stateData.areaValue,
      items: stateData.getAllAreaModel,
      onChanged: (val) {
        BlocProvider.of<CustomRegistrationFormBloc>(context).add(CustomRegistrationFormSetAreaValue(areaValue: val));
      },
    );
  }

  Widget _mobileNumberWidget({required CustomRegistrationFormGetAllDataState stateData}) {
    return TextFieldWidget(
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
        });
  }

  Widget _altMobileNumberWidget({required CustomRegistrationFormGetAllDataState stateData}) {
    return TextFieldWidget(
      hintText: AppString.alternateMobileNo,
      label:AppString.alternateMobileNo,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9]"))],
      maxLength: 10,
      controller: stateData.altMobileController,
    );
  }

  Widget _firstNameWidget({required CustomRegistrationFormGetAllDataState stateData}) {
    return TextFieldWidget(
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
    );
  }

  Widget _middleNameWidget({required CustomRegistrationFormGetAllDataState stateData}) {
    return TextFieldWidget(
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
    );
  }

  Widget _lastNameWidget({required CustomRegistrationFormGetAllDataState stateData}) {
    return TextFieldWidget(
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
    );
  }

  Widget _guardianDropdown({required CustomRegistrationFormGetAllDataState stateData}) {
    return DropdownWidget<GetGuardianTypeModel>(
      star:stateData.interestValue?.value != "Future Registration" ? AppString.star : "",
      label: stateData.labelModel.registration == null ? AppString.guardianType :stateData.labelModel.registration!.guardianType,
      hint: stateData.labelModel.registration == null ? AppString.guardianType :stateData.labelModel.registration!.guardianType,
      dropdownValue: stateData.guardianTypeValue == null ? null :stateData.guardianTypeValue,
      items: stateData.getGuardianTypeList,
      onChanged: (val) {
        BlocProvider.of<CustomRegistrationFormBloc>(context).add(CustomRegistrationFormSetGuardianTypeValue(guardianTypeValue: val));
      },
    );
  }

  Widget _guardianNameWidget({required CustomRegistrationFormGetAllDataState stateData}) {
    return TextFieldWidget(
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
    );
  }

  Widget _emailIdWidget({required CustomRegistrationFormGetAllDataState stateData}) {
    return TextFieldWidget(
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
    );
  }

  Widget _propertyCategoryDropdown({required CustomRegistrationFormGetAllDataState stateData}) {
    return DropdownWidget<GetPropertyCategoryModel>(
      star: AppString.star,
      label: stateData.labelModel.registration == null ? AppString.propertyCategory : stateData.labelModel.registration!.propertyCategory,
      hint: stateData.labelModel.registration == null ? AppString.propertyCategory : stateData.labelModel.registration!.propertyCategory,
      dropdownValue: stateData.propertyCategoryValue?.name != null ?stateData.propertyCategoryValue :null,
      items: stateData.getPropertyCategoryModel,
      onChanged: (val) {
        BlocProvider.of<CustomRegistrationFormBloc>(context).add(CustomRegistrationFormSetPropertyCategoryValue(propertyCategoryValue: val));
      },
    );
  }

  Widget _propertyClassDropdown({required CustomRegistrationFormGetAllDataState stateData}) {
    return DropdownWidget<GetPropertyClassModel>(
      star: AppString.star,
      label: stateData.labelModel.registration == null ? AppString.propertyClass :stateData.labelModel.registration!.propertyClass,
      hint: stateData.labelModel.registration == null ? AppString.propertyClass :stateData.labelModel.registration!.propertyClass,
      dropdownValue: stateData.propertyClassValue?.name != null ? stateData.propertyClassValue:null,
      items: stateData.getPropertyClassModel,
      onChanged: (val) {
        BlocProvider.of<CustomRegistrationFormBloc>(context).add(CustomRegistrationFormSetPropertyClassValue(propertyClassValue: val));
      },
    );
  }

  Widget _buildNumberWidget({required CustomRegistrationFormGetAllDataState stateData}) {
    return TextFieldWidget(
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
    );
  }

  Widget _houseNumberWidget({required CustomRegistrationFormGetAllDataState stateData}) {
    return TextFieldWidget(
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
    );
  }

  Widget _colonyWidget({required CustomRegistrationFormGetAllDataState stateData}) {
    return TextFieldWidget(
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
    );
  }

  Widget _streetNameWidget({required CustomRegistrationFormGetAllDataState stateData}) {
    return TextFieldWidget(
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
    );
  }

  Widget _townWidget({required CustomRegistrationFormGetAllDataState stateData}) {
    return TextFieldWidget(
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
    );
  }

  Widget _districtDropdown({required CustomRegistrationFormGetAllDataState stateData}) {
    return DropdownWidget<GetAllDistrictModel>(
      star: AppString.star,
      label: stateData.labelModel.registration == null ? AppString.district :stateData.labelModel.registration!.district,
      hint: stateData.labelModel.registration == null ? AppString.district :stateData.labelModel.registration!.district,
      dropdownValue: stateData.allDistrictValue?.districtName != null ? stateData.allDistrictValue :null,
      items: stateData.getAllDistrictModel,
      onChanged: (val) {
        BlocProvider.of<CustomRegistrationFormBloc>(context).add(CustomRegistrationFormSetDistrictValue(allDistrictValue: val));
      },
    );
  }

  Widget _pinCodeWidget({required CustomRegistrationFormGetAllDataState stateData}) {
    return TextFieldWidget(
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
        });
  }

  Widget _residentStatusDropdown({required CustomRegistrationFormGetAllDataState stateData}) {
    return DropdownWidget<GetResidentStatusModel>(
      label: stateData.labelModel.registration == null ? AppString.residentStatus :stateData.labelModel.registration!.resident,
      hint: stateData.labelModel.registration == null ? AppString.residentStatus :stateData.labelModel.registration!.resident,
      dropdownValue: stateData.residentStatusValue == null ? null : stateData.residentStatusValue,
      items: stateData.getResidentStatusList,
      onChanged: (val) {
        BlocProvider.of<CustomRegistrationFormBloc>(context).add(CustomRegistrationFormSetResidentStatusValue(residentStatusValue: val));
      },
    );
  }

  Widget _numberKitchenWidget({required CustomRegistrationFormGetAllDataState stateData}) {
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

  Widget _numberBathroomWidget({required CustomRegistrationFormGetAllDataState stateData}) {
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

  Widget _existCookingFuelDropdown({required CustomRegistrationFormGetAllDataState stateData}) {
    return DropdownWidget<GetExistingCookingFuelModel>(
      label: AppString.fuel,
      hint: AppString.fuel,
      dropdownValue: stateData.existingCookingFuelValue == null ? null : stateData.existingCookingFuelValue,
      items: stateData.existingCookingFuelList,
      onChanged: (val) {
        BlocProvider.of<CustomRegistrationFormBloc>(context).add(CustomRegistrationFormSetExistingCookingFuelValue(existingCookingFuelValue: val));
      },
    );
  }

  Widget _familyMemberWidget({required CustomRegistrationFormGetAllDataState stateData}) {
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

  Widget _latWidget({required CustomRegistrationFormGetAllDataState stateData}) {
    return TextFieldWidget(
      star: AppString.star,
      label: stateData.labelModel.registration == null ? AppString.locationLat :stateData.labelModel.registration!.lat,
      hintText: stateData.labelModel.registration == null ? AppString.locationLat :stateData.labelModel.registration!.lat,
      controller: stateData.latitudeController,
    );
  }

  Widget _longWidget({required CustomRegistrationFormGetAllDataState stateData}) {
    return TextFieldWidget(
      star: AppString.star,
      label: stateData.labelModel.registration == null ? AppString.locationLong :stateData.labelModel.registration!.long,
      hintText: stateData.labelModel.registration == null ? AppString.locationLong :stateData.labelModel.registration!.long,
      controller: stateData.longitudeController,
    );
  }

  Widget _nearestLandmarkWidget({required CustomRegistrationFormGetAllDataState stateData}) {
    return TextFieldWidget(
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
    );
  }

  Widget _kycDoc1Dropdown({required CustomRegistrationFormGetAllDataState stateData}) {
    return DropdownWidget(
      star: AppString.star,
      label: AppString.idProof,
      hint: AppString.idProof,
      dropdownValue: stateData.identityProofValue == null ? null : stateData.identityProofValue,
      items: stateData.identityProofList,
      onChanged: (val) {
        BlocProvider.of<CustomRegistrationFormBloc>(context).add(CustomRegistrationFormSetKycDoc1Value(kycDoc1Value: val));
      },
    );
  }

  Widget _kycDoc1Widget({required CustomRegistrationFormGetAllDataState stateData}) {
    return TextFieldWidget(
      star: AppString.star,
      label: stateData.labelModel.kyc == null ? AppString.addProofNo : stateData.labelModel.kyc!.uploadDoc1No,
      hintText: stateData.labelModel.kyc == null ? AppString.addProofNo : stateData.labelModel.kyc!.uploadDoc1No,
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
    );
  }


  Widget _kycDoc2Dropdown({required CustomRegistrationFormGetAllDataState stateData}) {
    return DropdownWidget<GetOwnershipProofModel>(
      star: stateData.interestValue?.value != "Future Registration" ?AppString.star : "",
      label: stateData.labelModel.kyc == null ? AppString.addProof :stateData.labelModel.kyc!.uploadDoc2,
      hint:  stateData.labelModel.kyc == null ? AppString.addProof :stateData.labelModel.kyc!.uploadDoc2,
      dropdownValue: stateData.ownershipProofValue == null ? null : stateData.ownershipProofValue,
      items: stateData.ownershipProofList,
      onChanged: (val) {
        BlocProvider.of<CustomRegistrationFormBloc>(context).add(CustomRegistrationFormSetKycDoc2Value(kycDoc2Value: val));
      },
    );
  }

  Widget _kycDoc2Widget({required CustomRegistrationFormGetAllDataState stateData}) {
    return TextFieldWidget(
      star: stateData.interestValue?.value != "Future Registration" ? AppString.star : "",
      label:  stateData.labelModel.kyc == null ? AppString.addProof : stateData.labelModel.kyc!.uploadDoc2No,
      hintText:  stateData.labelModel.kyc == null ? AppString.addProof : stateData.labelModel.kyc!.uploadDoc2No,
      controller: stateData.kyc2NumberController,
      keyboardType: TextInputType.text,
      maxLength: 20,
      validator: (value) {
        if (value != stateData.kyc2NumberController.text.trim()) {
          return "Blank space";
        }
        return null;
      },
    );
  }

  Widget _kycDoc3Dropdown({required CustomRegistrationFormGetAllDataState stateData}) {
    return DropdownWidget<GetKycDocModel>(
      star: AppString.star,
      label: AppString.ownershipProperty,
      hint: AppString.ownershipProperty,
      dropdownValue: stateData.kycDoc3Value == null ? null :stateData.kycDoc3Value,
      items: stateData.kycDocList,
      onChanged: (val) {
        BlocProvider.of<CustomRegistrationFormBloc>(context).add(CustomRegistrationFormSetKycDoc3Value(kycDoc3Value: val));
      },
    );
  }

  Widget _kycDoc3Widget({required CustomRegistrationFormGetAllDataState stateData}) {
    return TextFieldWidget(
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
    );
  }

  Widget _preferredBillDropdown({required CustomRegistrationFormGetAllDataState stateData}) {
    return DropdownWidget<GetEBillingModel>(
      label:stateData.labelModel.consent == null ? AppString.billingMode : stateData.labelModel.consent!.preferredBilling,
      hint:stateData.labelModel.consent == null ? AppString.billingMode : stateData.labelModel.consent!.preferredBilling,
      dropdownValue: stateData.eBillingValue == null ? null :stateData.eBillingValue,
      items: stateData.eBillingList,
      onChanged: (val) {
        BlocProvider.of<CustomRegistrationFormBloc>(context).add(CustomRegistrationFormSetPreferredBillValue(preferredBillValue: val));
      },
    );
  }

  Widget _custBankNameDropdown({required CustomRegistrationFormGetAllDataState stateData}) {
    return DropdownWidget(
      label: stateData.labelModel.consent == null ? AppString.customerBankName : stateData.labelModel.consent!.custBank,
      hint:  stateData.labelModel.consent == null ? AppString.customerBankName : stateData.labelModel.consent!.custBank,
      dropdownValue: stateData.custBankNameValue == null ? null :stateData.custBankNameValue,
      items: stateData.custBankNameList,
      onChanged: (val) {
        BlocProvider.of<CustomRegistrationFormBloc>(context).add(CustomRegistrationFormSetCustBankNameValue(custBankNameValue: val));
      },
    );
  }

  Widget _custBankAccNumberWidget({required CustomRegistrationFormGetAllDataState stateData}) {
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

  Widget _custIfscCodeWidget({required CustomRegistrationFormGetAllDataState stateData}) {
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

  Widget _custBankAddWidget({required CustomRegistrationFormGetAllDataState stateData}) {
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

  Widget _initialDepositStatusDropdown({required CustomRegistrationFormGetAllDataState stateData}) {
    return DropdownWidget(
      star:AppString.star,
      label: stateData.labelModel.deposit == null ? AppString.depositStatus : stateData.labelModel.deposit!.depositSta,
      hint: stateData.labelModel.deposit == null ? AppString.depositStatus : stateData.labelModel.deposit!.depositSta,
      dropdownValue: stateData.initialDepositStatusValue == null ? null :stateData.initialDepositStatusValue,
      items: stateData.initialDepositStatusList,
      onChanged: (val) {
        BlocProvider.of<CustomRegistrationFormBloc>(context).add(CustomRegistrationFormSetInitialDepositStatusValue(initialDepositStatusValue: val));
      },
    );
  }

  Widget _reasonDepositStatusWidget({required CustomRegistrationFormGetAllDataState stateData}) {
    return stateData.initialDepositStatusValue?.value == "No" ? ColumnWidget(
      context: context,
      child: TextFieldWidget(
        label: AppString.reasonDeposit ,
        hintText: AppString.reasonDeposit ,
        controller: stateData.reasonDepositStsController,
        keyboardType: TextInputType.text,
      ),
    ): Container();
  }

  Widget _depositTypeDropdown({required CustomRegistrationFormGetAllDataState stateData}) {
    return DropdownWidget<GetAllDepositOfflineModel>(
      star:AppString.star,
      label: AppString.depositType,
      hint: AppString.depositType,
      dropdownValue: stateData.depositOfflineValue == null ? null : stateData.depositOfflineValue,
      items: stateData.getAllDepositOfflineList,
      onChanged: (val) {
        log("depositTypeValue-->${stateData.depositOfflineValue?.depositName}");
        BlocProvider.of<CustomRegistrationFormBloc>(context).add(CustomRegistrationFormSetDepositTypeValue(depositTypeValue: val));
      },
    );
  }

  Widget _depositTypeDetailsButton({required CustomRegistrationFormGetAllDataState stateData}) {
    return ButtonWidget(
      text: AppString.details,
      onPressed: () {
        FocusScope.of(context).unfocus();
        TextInput.finishAutofillContext();
        /* BlocProvider.of<LoginBloc>(context).add(LoginSetSubmitDataEvent(
          context: context,
          isLoginLoader: true,
        ));*/
      },
    );
  }

  Widget _depositAmountWidget({required CustomRegistrationFormGetAllDataState stateData}) {
    return TextFieldWidget(
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
    );
  }

  Widget _modeDepositDropdown({required CustomRegistrationFormGetAllDataState stateData}) {
    return DropdownWidget(
      star:AppString.star,
      label:AppString.modeDeposit,
      hint: AppString.modeDeposit,
      dropdownValue: stateData.modeDepositValue == null ? null :stateData.modeDepositValue,
      items: stateData.modeDepositList,
      onChanged: (val) {
        log("stateData.modeDepositValue-->${val}");
        log("stateData.modeDepositValue-->${stateData.modeDepositValue}");
        BlocProvider.of<CustomRegistrationFormBloc>(context).add(CustomRegistrationFormSetModeDepositValue(modeDepositValue: val));
      },
    );
  }

  Widget _chequeNoWidget({required CustomRegistrationFormGetAllDataState stateData}) {
    return TextFieldWidget(
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
        });
  }

  Widget _chequeDateWidget({required CustomRegistrationFormGetAllDataState stateData}) {
    return TextFieldWidget(
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
        BlocProvider.of<CustomRegistrationFormBloc>(context).add(CustomRegistrationFormSetChequeDateEvent(context: context));
      },
    );
  }

  Widget _chequePaymentBankDropdown({required CustomRegistrationFormGetAllDataState stateData}) {
    return DropdownWidget(
      star:AppString.star,
      label:stateData.labelModel.deposit == null ? AppString.chqBank :  stateData.labelModel.deposit!.chqBank,
      hint: stateData.labelModel.deposit == null ? AppString.chqBank :  stateData.labelModel.deposit!.chqBank,
      dropdownValue: stateData.paymentBankNameValue,
      items: stateData.paymentBankNameList,
      onChanged: (val) {
        BlocProvider.of<CustomRegistrationFormBloc>(context).add(CustomRegistrationFormSetPaymentBankNameValue(paymentBankNameValue: val));
      },
    );
  }

  Widget _chequeAccountNoWidget({required CustomRegistrationFormGetAllDataState stateData}) {
    return TextFieldWidget(
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
        });
  }

  Widget _chequeMICRNoWidget({required CustomRegistrationFormGetAllDataState stateData}) {
    return TextFieldWidget(
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
        });
  }
  Widget _fileImage({required File fileImage,}) {
    if (fileImage.path.isNotEmpty) {
      return CircleAvatar(
        radius: 41,
        backgroundColor: AppColor.prime,
        child: CircleAvatar(
          radius: 40,
          backgroundImage: FileImage(fileImage),
        ),
      );
    } else {
      return CircleAvatar(
        radius: 41,
        child: CircleAvatar(
          backgroundImage: FileImage(fileImage),
          radius: 40,
        ),
      );
    }
  }

  Widget _idFrontFileImg({required CustomRegistrationFormGetAllDataState stateData}) {
    return ImageWidget(
        star: AppString.star,
        label: stateData.labelModel.kyc == null ? AppString.idProofFront : stateData.labelModel.kyc!.uploadDoc1Front,
        child: stateData.idFrontFilePath.path.isEmpty || stateData.idFrontFilePath == "" ?
        _localBorderImg() : _fileImage(fileImage: stateData.idFrontFilePath),
        onTap: () {
          showModalBottomSheet(
              enableDrag: true,
              isScrollControlled: true,
              context: context, builder: (BuildContext context){
            return ImagePopWidget(
              onTapCamera: () async {
                Navigator.of(context).pop();
                BlocProvider.of<CustomRegistrationFormBloc>(context).add(SelectIdFrontCameraCapture());
              },
              onTapGallery: () async {
                Navigator.of(context).pop();
                BlocProvider.of<CustomRegistrationFormBloc>(context).add(SelectIdFrontGalleryCapture());
              },
            );
          });
        });
  }

  Widget _idBackFileImg({required BuildContext context, required CustomRegistrationFormGetAllDataState stateData}) {
    return ImageWidget(
      label: stateData.labelModel.kyc == null ? AppString.idProofBack : stateData.labelModel.kyc!.uploadDoc1Back,
      child: stateData.idBackFilePath.path.isEmpty || stateData.idBackFilePath == "" ?
      _localBorderImg() : _fileImage(fileImage: stateData.idBackFilePath),
      onTap: () {
        showModalBottomSheet(
            enableDrag: true,
            isScrollControlled: true,
            context: context, builder: (BuildContext context){
          return ImagePopWidget(
            onTapCamera: () async {
              Navigator.of(context).pop();
              BlocProvider.of<CustomRegistrationFormBloc>(context).add(SelectIdBackCameraCapture());
            },
            onTapGallery: () async {
              Navigator.of(context).pop();
              BlocProvider.of<CustomRegistrationFormBloc>(context).add(SelectIdBackGalleryCapture());
            },
          );
        });
      },
    );
  }

  Widget _eleBillFrontImg({required BuildContext context, required CustomRegistrationFormGetAllDataState stateData}) {
    return ImageWidget(
      label: stateData.labelModel.kyc == null ? AppString.idProofFront : stateData.labelModel.kyc!.uploadDoc2Front,
      child: stateData.eleBillFrontPath.path.isEmpty || stateData.eleBillFrontPath == "" ?
      _localBorderImg() : _fileImage(fileImage: stateData.eleBillFrontPath),
      star: stateData.interestValue?.value != "Future Registration" ?AppString.star : "",
      onTap: () {
        showModalBottomSheet(
            enableDrag: true,
            isScrollControlled: true,
            context: context, builder: (BuildContext context){
          return ImagePopWidget(
            onTapCamera: () async {
              Navigator.of(context).pop();
              BlocProvider.of<CustomRegistrationFormBloc>(context).add(SelectAddFrontCameraCapture());
            },
            onTapGallery: () async {
              Navigator.of(context).pop();
              BlocProvider.of<CustomRegistrationFormBloc>(context).add(SelectAddFrontGalleryCapture());
            },
          );
        });
      },
    );
  }

  Widget _eleBillBackImg({required BuildContext context, required CustomRegistrationFormGetAllDataState stateData}) {
    return ImageWidget(
        label: stateData.labelModel.kyc == null ? AppString.idProofBack : stateData.labelModel.kyc!.uploadDoc1Back,
        child: stateData.eleBillBackPath.path.isEmpty || stateData.eleBillBackPath == "" ?
        _localBorderImg() : _fileImage(fileImage: stateData.eleBillBackPath),
        onTap: () {
          showModalBottomSheet(
              enableDrag: true,
              isScrollControlled: true,
              context: context, builder: (BuildContext context){
            return ImagePopWidget(
              onTapCamera: () async {
                Navigator.of(context).pop();
                BlocProvider.of<CustomRegistrationFormBloc>(context).add(SelectAddBackCameraCapture());
              },
              onTapGallery: () async {
                Navigator.of(context).pop();
                BlocProvider.of<CustomRegistrationFormBloc>(context).add(SelectAddBackGalleryCapture());
              },
            );
          });
        });
  }

  Widget _customerConsentImg({required BuildContext context, required CustomRegistrationFormGetAllDataState stateData}) {
    return ImageWidget(
        label: stateData.labelModel.kyc == null ? AppString.idProofFront : stateData.labelModel.kyc!.uploadDoc1Front,
        child: stateData.idFrontFilePath.path.isEmpty || stateData.idFrontFilePath == "" ?
        _localBorderImg() : _fileImage(fileImage: stateData.idFrontFilePath),
        onTap: () {
          showModalBottomSheet(
              enableDrag: true,
              isScrollControlled: true,
              context: context, builder: (BuildContext context){
            return ImagePopWidget(
              onTapCamera: () async {
                Navigator.of(context).pop();
                BlocProvider.of<CustomRegistrationFormBloc>(context).add(SelectIdFrontCameraCapture());
              },
              onTapGallery: () async {
                Navigator.of(context).pop();
                BlocProvider.of<CustomRegistrationFormBloc>(context).add(SelectIdFrontGalleryCapture());
              },
            );
          });
        });
  }

  Widget _nocDocImg({required BuildContext context, required CustomRegistrationFormGetAllDataState stateData}) {
    return ImageWidget(
        child: stateData.nocDocPath.path.isEmpty || stateData.nocDocPath == "" ?
        _localBorderImg() : _fileImage(fileImage: stateData.nocDocPath),
        star: AppString.star,
        label: stateData.labelModel.kyc == null ? AppString.nocDoc : stateData.labelModel.kyc!.uploadDoc3,
        onTap: () {
          showModalBottomSheet(
              enableDrag: true,
              isScrollControlled: true,
              context: context, builder: (BuildContext context){
            return ImagePopWidget(
              onTapCamera: () async {
                Navigator.of(context).pop();
                BlocProvider.of<CustomRegistrationFormBloc>(context).add(SelectNocDocCameraCapture());
              },
              onTapGallery: () async {
                Navigator.of(context).pop();
                BlocProvider.of<CustomRegistrationFormBloc>(context).add(SelectNocDocBackGalleryCapture());
              },
            );
          });
        });
  }

  /* Widget _nocBackImg({required BuildContext context, required CustomRegistrationFormGetAllDataState stateData}) {
    return ImageWidget(
      onTap: () {
        BlocProvider.of<CustomRegistrationFormBloc>(context).add(CustomRegistrationFormSetNocBackPath(nocBackPath: stateData.nocBackPath, context: context));
      },
      child: stateData.nocBackPath.isEmpty ? _localBorderImg() : _fileImage(fileImage: File(stateData.nocBackPath.toString())),
      label: AppString.nocBackImgLabel,
    );
  }*/

  Widget _uploadCustomerImg({required BuildContext context, required CustomRegistrationFormGetAllDataState stateData}) {
    return ImageWidget(
        child: stateData.uploadCustomerPath.path.isEmpty || stateData.uploadCustomerPath == "" ?
        _localBorderImg() : _fileImage(fileImage: stateData.uploadCustomerPath),
        label: stateData.labelModel.photo == null ? AppString.idProofFront : stateData.labelModel.photo!.customerPhoto,
        onTap: () {
          showModalBottomSheet(
              enableDrag: true,
              isScrollControlled: true,
              context: context, builder: (BuildContext context){
            return ImagePopWidget(
              onTapCamera: () async {
                Navigator.of(context).pop();
                BlocProvider.of<CustomRegistrationFormBloc>(context).add(SelectCustomerCameraCapture());
              },
              onTapGallery: () async {
                Navigator.of(context).pop();
                BlocProvider.of<CustomRegistrationFormBloc>(context).add(SelectCustomerGalleryCapture());
              },
            );
          });
        }
    );
  }

  Widget _uploadHouseImg({required BuildContext context, required CustomRegistrationFormGetAllDataState stateData}) {
    return ImageWidget(
      child: stateData.uploadHousePath.path.isEmpty || stateData.uploadHousePath == "" ?
      _localBorderImg() : _fileImage(fileImage: stateData.uploadHousePath),
      label: stateData.labelModel.photo == null ? AppString.idProofFront : stateData.labelModel.photo!.homePhoto,
      onTap: () {
        showModalBottomSheet(
            enableDrag: true,
            isScrollControlled: true,
            context: context, builder: (BuildContext context){
          return ImagePopWidget(
            onTapCamera: () async {
              Navigator.of(context).pop();
              BlocProvider.of<CustomRegistrationFormBloc>(context).add(SelectHouseCameraCapture());
            },
            onTapGallery: () async {
              Navigator.of(context).pop();
              BlocProvider.of<CustomRegistrationFormBloc>(context).add(SelectHouseGalleryCapture());
            },
          );
        });
      },
    );
  }

  Widget _ownerConsentImg({required BuildContext context, required CustomRegistrationFormGetAllDataState stateData}) {
    return ImageWidget(
      child: stateData.idFrontFilePath.path.isEmpty || stateData.idFrontFilePath == "" ?
      _localBorderImg() : _fileImage(fileImage: stateData.idFrontFilePath),
      label: stateData.labelModel.kyc == null ? AppString.idProofFront : stateData.labelModel.kyc!.uploadDoc1Front,
      onTap: () {
        showModalBottomSheet(
            enableDrag: true,
            isScrollControlled: true,
            context: context, builder: (BuildContext context){
          return ImagePopWidget(
            onTapCamera: () async {
              Navigator.of(context).pop();
              BlocProvider.of<CustomRegistrationFormBloc>(context).add(SelectIdFrontCameraCapture());
            },
            onTapGallery: () async {
              Navigator.of(context).pop();
              BlocProvider.of<CustomRegistrationFormBloc>(context).add(SelectIdFrontGalleryCapture());
            },
          );
        });
      },
    );
  }

  Widget _cancelChequeImg({required BuildContext context, required CustomRegistrationFormGetAllDataState stateData}) {
    return ImageWidget(
        child: stateData.idFrontFilePath.path.isEmpty || stateData.idFrontFilePath == ""
            ? _localBorderImg() : _fileImage(fileImage: stateData.idFrontFilePath),
        label: stateData.labelModel.kyc == null ? AppString.idProofFront : stateData.labelModel.kyc!.uploadDoc1Front,
        onTap: () {
          showModalBottomSheet(
              enableDrag: true,
              isScrollControlled: true,
              context: context, builder: (BuildContext context) {
            return ImagePopWidget(
              onTapCamera: () async {
                Navigator.of(context).pop();
                BlocProvider.of<CustomRegistrationFormBloc>(context).add(
                    SelectIdFrontCameraCapture());
              },
              onTapGallery: () async {
                Navigator.of(context).pop();
                BlocProvider.of<CustomRegistrationFormBloc>(context).add(
                    SelectIdFrontGalleryCapture());
              },
            );
          });
        }
    );
  }

  Widget _chequeImg({required BuildContext context, required CustomRegistrationFormGetAllDataState stateData}) {
    return ImageWidget(
      child: stateData.chequePath.path.isEmpty || stateData.chequePath == "" ?
      _localBorderImg() : _fileImage(fileImage: stateData.chequePath),
      star: AppString.star,
      label: stateData.labelModel.deposit == null ? AppString.chqPhoto : stateData.labelModel.deposit!.chqPhoto,
      onTap: () {
        showModalBottomSheet(
            enableDrag: true,
            isScrollControlled: true,
            context: context, builder: (BuildContext context){
          return ImagePopWidget(
            onTapCamera: () async {
              Navigator.of(context).pop();
              BlocProvider.of<CustomRegistrationFormBloc>(context).add(SelectChqCameraCapture());
            },
            onTapGallery: () async {
              Navigator.of(context).pop();
              BlocProvider.of<CustomRegistrationFormBloc>(context).add(SelectChqGalleryCapture());
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
        BlocProvider.of<CustomRegistrationFormBloc>(context).add(CustomRegistrationFormPreviewPageEvent(
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

  Widget _localBorderImg() {
    return CircleAvatar(
      radius: 41,
      backgroundColor: AppColor.prime,
      child: CircleAvatar(
        radius: 40,
        backgroundColor: Colors.white,
        backgroundImage: AssetImage(
          ImgAsset.imageCaptureIcon,
        ),
      ),
    );
  }



  editPageData({required CustomRegistrationFormGetAllDataState stateData}){
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
