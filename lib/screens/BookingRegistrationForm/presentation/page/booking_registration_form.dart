import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pbg_app/screens/BookingRegistrationForm/domain/bloc/booking_registration_form_bloc.dart';
import 'package:pbg_app/screens/BookingRegistrationForm/domain/bloc/booking_registration_form_event.dart';
import 'package:pbg_app/screens/BookingRegistrationForm/domain/bloc/booking_registration_form_state.dart';
import 'package:pbg_app/screens/BookingRegistrationForm/presentation/widget/app_string.dart';
import 'package:pbg_app/screens/BookingRegistrationForm/presentation/widget/center_loader_widget.dart';
import 'package:pbg_app/screens/BookingRegistrationForm/presentation/widget/searchTextFieldWidget/presentation/widgets/search_text_field.dart';
import 'package:pbg_app/screens/BookingRegistrationForm/presentation/widget/text_field_widget.dart';
import 'package:pbg_app/screens/Registration.dart';
import 'package:pbg_app/utils/common_widgets/custom_app_bar.dart';

class BookingRegistrationFormView extends StatefulWidget {
  const BookingRegistrationFormView({Key key}) : super(key: key);

  @override
  State<BookingRegistrationFormView> createState() => _BookingRegistrationFormViewState();
}

class _BookingRegistrationFormViewState extends State<BookingRegistrationFormView> {

  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<BookingRegistrationFormBloc>(context).
    add(BookingRegistrationFormPageLoaderEvent(context: context));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: CustomAppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_rounded),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RegistrationForm()));
            },
          ),
          titleAppBar: AppString.bookingRegistration,
          actions: [],
        ),
      ),
      body:BlocBuilder<BookingRegistrationFormBloc, BookingRegistrationFormState>(
        builder: (context, state) {
          if (state is BookingRegistrationFormPageLoadState) {
            return _pageLoader();
          } else if (state is BookingRegistrationFormDataState) {
            return _buildLayout(dataState: state);
          } else {
            return SizedBox.shrink();
          }
        },
      ),
    );
  }
  Widget _pageLoader() {
    return CenterLoaderWidget();
  }
  _buildLayout({BookingRegistrationFormDataState dataState}){
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _searchMobileNoWidget(dataState: dataState),
              _interestWidget(dataState: dataState),
              _horizontalSpace(),
              _chargeAreaWidget(dataState: dataState),
              _horizontalSpace(),
              _areaWidget(dataState: dataState),
              _horizontalSpace(),
              _districtWidget(dataState: dataState),
              _horizontalSpace(),
              _mobileNoWidget(dataState: dataState),
              _horizontalSpace(),
              _firstNameWidget(dataState: dataState),
              _horizontalSpace(),
              _middleNameWidget(dataState: dataState),
              _horizontalSpace(),
              _surNameWidget(dataState: dataState),
              _horizontalSpace(),
              _guardianTypeWidget(dataState: dataState),
              _horizontalSpace(),
              _guardianNameWidget(dataState: dataState),
              _horizontalSpace(),
              _emailIDWidget(dataState: dataState),
              _horizontalSpace(),
              _propertyCategoryWidget(dataState: dataState),
              _horizontalSpace(),
              _propertyClassWidget(dataState: dataState),
              _horizontalSpace(),
              _houseNoWidget(dataState: dataState),
              _horizontalSpace(),
              _buildingNoWidget(dataState: dataState),
              _horizontalSpace(),
              _colonyWidget(dataState: dataState),
              _horizontalSpace(),
              _streetNameWidget(dataState: dataState),
              _horizontalSpace(),
              _townWidget(dataState: dataState),
              _horizontalSpace(),
              _pinCodeWidget(dataState: dataState),
              _horizontalSpace(),
              _residentialStatusWidget(dataState: dataState),
              _horizontalSpace(),
              _kitchenWidget(dataState: dataState),
              _horizontalSpace(),
              _bathroomWidget(dataState: dataState),
              _horizontalSpace(),
              _cookingFuelWidget(dataState: dataState),
              _horizontalSpace(),
              _familyWidget(dataState: dataState),
              _horizontalSpace(),
              _landmarkWidget(dataState: dataState),
              _horizontalSpace(),
              _latWidget(dataState: dataState),
              _horizontalSpace(),
              _longWidget(dataState: dataState),
              _horizontalSpace(),
              _identityProofWidget(dataState: dataState),
              _horizontalSpace(),
              _identityProofNoWidget(dataState: dataState),
              _horizontalSpace(),
              _addProofWidget(dataState: dataState),
              _horizontalSpace(),
              _addProofNoWidget(dataState: dataState),
              _horizontalSpace(),
              _nocWidget(dataState: dataState),
              _horizontalSpace(),
              _nocNoWidget(dataState: dataState),
              _horizontalSpace(),
              _preferredBillingWidget(dataState: dataState),
              _horizontalSpace(),
              _custBankNameWidget(dataState: dataState),
              _horizontalSpace(),
              _custAccNoWidget(dataState: dataState),
              _horizontalSpace(),
              _custIfscWidget(dataState: dataState),
              _horizontalSpace(),
              _custBankAddWidget(dataState: dataState),
              _horizontalSpace(),
              _initialDepositWidget(dataState: dataState),
              _horizontalSpace(),
              _schemeNameWidget(dataState: dataState),
              _horizontalSpace(),
              _schemeAmountWidget(dataState: dataState),
              _horizontalSpace(),
              _modeDepositWidget(dataState: dataState),
              _horizontalSpace(),
              _chequeNoWidget(dataState: dataState),
              _horizontalSpace(),
              _chequeDateWidget(dataState: dataState),
              _horizontalSpace(),
              _chequeBankNameWidget(dataState: dataState),
              _horizontalSpace(),
              _chequeMicrNoWidget(dataState: dataState),
              _horizontalSpace(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _interestWidget({BookingRegistrationFormDataState dataState}){
    return TextFieldWidget(
      labelText: AppString.interested,
      controller: dataState.interested,
      enabled: false,
    );
  }
  Widget _chargeAreaWidget({BookingRegistrationFormDataState dataState}){
    return TextFieldWidget(
      labelText: AppString.chargeArea,
      controller: dataState.chargeArea,
      enabled: false,
    );
  }
  Widget _areaWidget({BookingRegistrationFormDataState dataState}){
    return TextFieldWidget(
      labelText: AppString.area,
      controller: dataState.area,
      enabled: false,
    );
  }

  Widget _districtWidget({BookingRegistrationFormDataState dataState}){
    return TextFieldWidget(
      labelText: AppString.district,
      controller: dataState.district,
      enabled: false,
    );
  }
  Widget _mobileNoWidget({BookingRegistrationFormDataState dataState}){
    return TextFieldWidget(
      labelText: AppString.mobileNumber,
      controller: dataState.mobileNumber,
      enabled: false,
    );
  }

  Widget _firstNameWidget({BookingRegistrationFormDataState dataState}){
    return TextFieldWidget(
      labelText: AppString.firstName,
      controller: dataState.firstName,
      enabled: false,
    );
  }

  Widget _middleNameWidget({BookingRegistrationFormDataState dataState}){
    return TextFieldWidget(
      labelText: AppString.middleName, controller: dataState.middleName,
      enabled: false,
    );
  }

  Widget _surNameWidget({BookingRegistrationFormDataState dataState}){
    return TextFieldWidget(
      labelText: AppString.surname, controller: dataState.surName,
      enabled: false,
    );
  }
  Widget _guardianTypeWidget({BookingRegistrationFormDataState dataState}){
    return TextFieldWidget(
      labelText: AppString.guardianType, controller: dataState.guardianType,
      enabled: false,
    );
  }
  Widget _guardianNameWidget({BookingRegistrationFormDataState dataState}){
    return TextFieldWidget(
      labelText: AppString.guardianName, controller: dataState.guardianName,
      enabled: false,
    );
  }
  Widget _emailIDWidget({BookingRegistrationFormDataState dataState}){
    return TextFieldWidget(
      labelText: AppString.emailID, controller: dataState.emailId,
      enabled: false,
    );
  }
  Widget _propertyCategoryWidget({BookingRegistrationFormDataState dataState}){
    return TextFieldWidget(
      labelText: AppString.propertyCategory, controller: dataState.propertyCategory,
      enabled: false,
    );
  }
  Widget _propertyClassWidget({BookingRegistrationFormDataState dataState}){
    return TextFieldWidget(
      labelText: AppString.propertyClass, controller: dataState.propertyClass,
      enabled: false,
    );
  }
  Widget _houseNoWidget({BookingRegistrationFormDataState dataState}){
    return TextFieldWidget(
      labelText: AppString.houseNumber, controller: dataState.houseNumber,
      enabled: false,
    );
  }
  Widget _buildingNoWidget({BookingRegistrationFormDataState dataState}){
    return TextFieldWidget(
      labelText: AppString.buildingNumber, controller: dataState.buildingNumber,
      enabled: false,
    );
  }
  Widget _colonyWidget({BookingRegistrationFormDataState dataState}){
    return TextFieldWidget(
      labelText: AppString.colony, controller: dataState.colony,
      enabled: false,
    );
  }
  Widget _streetNameWidget({BookingRegistrationFormDataState dataState}){
    return TextFieldWidget(
      labelText: AppString.streetName, controller: dataState.streetName,
      enabled: false,
    );
  }
  Widget _townWidget({BookingRegistrationFormDataState dataState}){
    return TextFieldWidget(
      labelText: AppString.town, controller: dataState.town,
      enabled: false,
    );
  }
  Widget _pinCodeWidget({BookingRegistrationFormDataState dataState}){
    return TextFieldWidget(
      labelText: AppString.pinCode, controller: dataState.pinCode,
      enabled: false,
    );
  }
  Widget _residentialStatusWidget({BookingRegistrationFormDataState dataState}){
    return TextFieldWidget(
      labelText: AppString.residentialStatus, controller: dataState.residentialStatus,
      enabled: false,
    );
  }
  Widget _kitchenWidget({BookingRegistrationFormDataState dataState}){
    return TextFieldWidget(
      labelText: AppString.kitchen, controller: dataState.noKitchen,
      enabled: false,
    );
  }
  Widget _bathroomWidget({BookingRegistrationFormDataState dataState}){
    return TextFieldWidget(
      labelText: AppString.bathroom, controller: dataState.noBathroom,
      enabled: false,
    );
  }
  Widget _cookingFuelWidget({BookingRegistrationFormDataState dataState}){
    return TextFieldWidget(
      labelText: AppString.cookingFuel, controller: dataState.cookingFuel,
      enabled: false,
    );
  }
  Widget _familyWidget({BookingRegistrationFormDataState dataState}){
    return TextFieldWidget(
      labelText: AppString.family, controller: dataState.noFamily,
      enabled: false,
    );
  }
  Widget _landmarkWidget({BookingRegistrationFormDataState dataState}){
    return TextFieldWidget(
      labelText: AppString.landmark, controller: dataState.landmark,
      enabled: false,
    );
  }
  Widget _latWidget({BookingRegistrationFormDataState dataState}) {
    return TextFieldWidget(
      labelText: AppString.latitude, controller: dataState.latitude,
      enabled: false,
    );
  }
  Widget _longWidget({BookingRegistrationFormDataState dataState}) {
    return TextFieldWidget(
      labelText: AppString.longitude, controller: dataState.longitude,
      enabled: false,
    );
  }
  Widget _identityProofWidget({BookingRegistrationFormDataState dataState}) {
    return TextFieldWidget(
      labelText: AppString.identityProof, controller: dataState.identityProof,
      enabled: false,
    );
  }
  Widget _identityProofNoWidget({BookingRegistrationFormDataState dataState}) {
    return TextFieldWidget(
      labelText: AppString.identityProofNo, controller: dataState.identityProofNo,
      enabled: false,
    );
  }
  Widget _addProofWidget({BookingRegistrationFormDataState dataState}) {
    return TextFieldWidget(
      labelText: AppString.addressProof, controller: dataState.addProof,
      enabled: false,
    );
  }
  Widget _addProofNoWidget({BookingRegistrationFormDataState dataState}) {
    return TextFieldWidget(
      labelText: AppString.addressProofNo, controller: dataState.addProofNo,
      enabled: false,
    );
  }
  Widget _nocWidget({BookingRegistrationFormDataState dataState}) {
    return TextFieldWidget(
      labelText: AppString.nocDocument, controller: dataState.nocDoc,
      enabled: false,
    );
  }
  Widget _nocNoWidget({BookingRegistrationFormDataState dataState}) {
    return TextFieldWidget(
      labelText: AppString.nocDocumentNo, controller: dataState.nocDocNo,
      enabled: false,
    );
  }
  Widget _preferredBillingWidget({BookingRegistrationFormDataState dataState}) {
    return TextFieldWidget(
      labelText: AppString.preferredBilling, controller: dataState.preferredBillingMode,
      enabled: false,
    );
  }
  Widget _custBankNameWidget({BookingRegistrationFormDataState dataState}) {
    return TextFieldWidget(
      labelText: AppString.customerBankName, controller: dataState.custBankName,
      enabled: false,
    );
  }
  Widget _custAccNoWidget({BookingRegistrationFormDataState dataState}) {
    return TextFieldWidget(
      labelText: AppString.customerBankAccNo, controller: dataState.custBankAccNo,
      enabled: false,
    );
  }
  Widget _custIfscWidget({BookingRegistrationFormDataState dataState}) {
    return TextFieldWidget(
      labelText: AppString.customerIfsc, controller: dataState.custIfscCode,
      enabled: false,
    );
  }
  Widget _custBankAddWidget({BookingRegistrationFormDataState dataState}) {
    return TextFieldWidget(
      labelText: AppString.customerAdd, controller: dataState.custBankAdd,
      enabled: false,
    );
  }
  Widget _initialDepositWidget({BookingRegistrationFormDataState dataState}) {
    return TextFieldWidget(
      labelText: AppString.initialDeposit, controller: dataState.initialDepositStatus,
      enabled: false,
    );
  }
  Widget _schemeNameWidget({BookingRegistrationFormDataState dataState}) {
    return TextFieldWidget(
      labelText: AppString.schemeName, controller: dataState.schemeName,
      enabled: false,
    );
  }
  Widget _schemeAmountWidget({BookingRegistrationFormDataState dataState}) {
    return TextFieldWidget(
      labelText: AppString.schemeAmount, controller: dataState.schemeAmount,
      enabled: false,
    );
  }
  Widget _modeDepositWidget({BookingRegistrationFormDataState dataState}) {
    return TextFieldWidget(
      labelText: AppString.modePayment, controller: dataState.modeStatue,
      enabled: false,
    );
  }
  Widget _chequeNoWidget({BookingRegistrationFormDataState dataState}) {
    return TextFieldWidget(
      labelText: AppString.chequeNo, controller: dataState.chequeNo,
      enabled: false,
    );
  }
  Widget _chequeDateWidget({BookingRegistrationFormDataState dataState}) {
    return TextFieldWidget(
      labelText: AppString.chequeDate, controller: dataState.chequeDate,
      enabled: false,
    );
  }
  Widget _chequeBankNameWidget({BookingRegistrationFormDataState dataState}) {
    return TextFieldWidget(
      labelText: AppString.paymentBankName, controller: dataState.paymentBankName,
      enabled: false,
    );
  }
  Widget _chequeMicrNoWidget({BookingRegistrationFormDataState dataState}) {
    return TextFieldWidget(
      labelText: AppString.chequeMicrNo, controller: dataState.chequeMicrNo,
      enabled: false,
    );
  }
  Widget _searchMobileNoWidget({BookingRegistrationFormDataState dataState}) {
    return TextField(
      onChanged: (value) {
        if(value.length == 10) {
          BlocProvider.of<BookingRegistrationFormBloc>(context).add(
              BookingRegistrationFormSetSearchPhoneNumberEvent(mobileNumber: value.toString(), context: context));
        }
      },
      controller: dataState.mobileNumber,
      keyboardType:TextInputType.number,
      textInputAction: TextInputAction.done,
      maxLength: 10,
      decoration: InputDecoration(
        labelText: AppString.mobileNumber,
    contentPadding: EdgeInsets.symmetric(horizontal: 8,),
    border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: const BorderSide(
    width: 1,
    ),
    ),
    ),
    );
  }

  Widget _horizontalSpace() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.02,
    );
  }
}
