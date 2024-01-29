import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pbg_app/screens/BookingRegistrationForm/domain/bloc/booking_registration_form_event.dart';
import 'package:pbg_app/screens/BookingRegistrationForm/domain/bloc/booking_registration_form_state.dart';
import 'package:pbg_app/screens/BookingRegistrationForm/domain/model/get_dma_by_phone_number_model.dart';
import 'package:pbg_app/screens/BookingRegistrationForm/helper/booking_registration_form_helper.dart';

class BookingRegistrationFormBloc extends Bloc<BookingRegistrationFormEvent, BookingRegistrationFormState>{
  BookingRegistrationFormBloc() : super(BookingRegistrationFormInitialState()){
    on<BookingRegistrationFormPageLoaderEvent>(_pageLoader);
    on<BookingRegistrationFormSetSearchPhoneNumberEvent>(_setSearchPhoneNumber);
  }

  bool _isSaveServerLoader = false;
  bool get isSaveServerLoader => _isSaveServerLoader;

  List<AllDMAFormData> _allDmaFormDataList = [];
  List<AllDMAFormData> get allDmaFormDataList => _allDmaFormDataList;

  AllDMAFormData _allDMAFormData = AllDMAFormData();
  AllDMAFormData  get allDMAFormData => _allDMAFormData;

  List<String> _mobileNumberList = [];
  List<String> get mobileNumberList => _mobileNumberList;

  String _identityProofFront = "";
  String get identityProofFront => _identityProofFront;

  String _identityProofBack = "";
  String get identityProofBack => _identityProofBack;

  String _addProofFront = "";
  String get addProofFront => _addProofFront;

  String _addProofBack = "";
  String get addProofBack => _addProofBack;

  String _nocDocFront = "";
  String get nocDocFront => _nocDocFront;

  String _nocDocBack = "";
  String get nocDocBack => _nocDocBack;

  String _uploadCustomer = "";
  String get uploadCustomer => _uploadCustomer;

  String _uploadHouse = "";
  String get uploadHouse => _uploadHouse;

  String _customerConsent = "";
  String get customerConsent => _customerConsent;

  String _ownerConsent = "";
  String get ownerConsent => _ownerConsent;

  String _cancelCheque = "";
  String get cancelCheque => _cancelCheque;

  String _cheque = "";
  String get cheque => _cheque;

  TextEditingController interested = TextEditingController();
  TextEditingController chargeArea = TextEditingController();
  TextEditingController area = TextEditingController();
  TextEditingController mobileNumber = TextEditingController();
  TextEditingController district = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController middleName = TextEditingController();
  TextEditingController surName = TextEditingController();
  TextEditingController guardianType = TextEditingController();
  TextEditingController guardianName = TextEditingController();
  TextEditingController emailId = TextEditingController();
  TextEditingController propertyCategory = TextEditingController();
  TextEditingController propertyClass = TextEditingController();
  TextEditingController houseNumber = TextEditingController();
  TextEditingController buildingNumber = TextEditingController();
  TextEditingController colony = TextEditingController();
  TextEditingController streetName = TextEditingController();
  TextEditingController town = TextEditingController();
  TextEditingController pinCode = TextEditingController();
  TextEditingController residentialStatus = TextEditingController();
  TextEditingController noKitchen = TextEditingController();
  TextEditingController noBathroom = TextEditingController();
  TextEditingController cookingFuel = TextEditingController();
  TextEditingController noFamily = TextEditingController();
  TextEditingController landmark = TextEditingController();
  TextEditingController latitude = TextEditingController();
  TextEditingController longitude = TextEditingController();
  TextEditingController identityProof = TextEditingController();
  TextEditingController identityProofNo = TextEditingController();
  TextEditingController addProof = TextEditingController();
  TextEditingController addProofNo = TextEditingController();
  TextEditingController nocDoc = TextEditingController();
  TextEditingController nocDocNo = TextEditingController();
  TextEditingController preferredBillingMode = TextEditingController();
  TextEditingController custBankName = TextEditingController();
  TextEditingController custBankAccNo = TextEditingController();
  TextEditingController custIfscCode = TextEditingController();
  TextEditingController custBankAdd = TextEditingController();
  TextEditingController initialDepositStatus = TextEditingController();
  TextEditingController schemeName = TextEditingController();
  TextEditingController schemeAmount = TextEditingController();
  TextEditingController modeStatue = TextEditingController();
  TextEditingController chequeNo = TextEditingController();
  TextEditingController chequeDate = TextEditingController();
  TextEditingController paymentBankName = TextEditingController();
  TextEditingController chequeMicrNo = TextEditingController();

  _pageLoader(BookingRegistrationFormPageLoaderEvent event, emit) async {
    emit(BookingRegistrationFormPageLoadState());
    _isSaveServerLoader = false;
    _allDmaFormDataList = [];
    _mobileNumberList = [];
    _identityProofFront = "";
    _identityProofBack = "";
    _addProofFront = "";
    _addProofBack = "";
    _nocDocFront = "";
    _nocDocBack = "";
    _uploadCustomer = "";
    _uploadHouse = "";
    _customerConsent = "";
    _ownerConsent = "";
    _cancelCheque = "";
    _cheque = "";
    interested.text  = " " ;
    chargeArea.text  = " " ;
    area.text  = " " ;
    mobileNumber.text  = " " ;
    district.text  = " " ;
    firstName.text  = " " ;
    middleName.text  = " " ;
    surName.text  = " " ;
    guardianType.text  = " " ;
    guardianName.text  = " " ;
    emailId.text  = " " ;
    propertyCategory.text  = " " ;
    propertyClass.text  = " " ;
    houseNumber.text  = " " ;
    buildingNumber.text  = " " ;
    colony.text  = " " ;
    streetName.text  = " " ;
    town.text  = " " ;
    pinCode.text  = " " ;
    residentialStatus.text  = " " ;
    noKitchen.text  = " " ;
    noBathroom.text  = " " ;
    cookingFuel.text  = " " ;
    noFamily.text  = " " ;
    landmark.text  = " " ;
    latitude.text  = " " ;
    longitude.text  = " " ;
    identityProof.text  = " " ;
    identityProofNo.text  = " " ;
    addProof.text  = " " ;
    addProofNo.text  = " " ;
    nocDoc.text  = " " ;
    nocDocNo.text  = " " ;
    preferredBillingMode.text  = " " ;
    custBankName.text  = " " ;
    custBankAccNo.text  = " " ;
    custIfscCode.text  = " " ;
    custBankAdd.text  = " " ;
    initialDepositStatus.text  = " " ;
    schemeName.text  = " " ;
    schemeAmount.text  = " " ;
    modeStatue.text  = " " ;
    chequeNo.text  = " " ;
    chequeDate.text  = " " ;
    paymentBankName.text  = " " ;
    chequeMicrNo.text  = " " ;
    await searchMobileNumber(context: event.context,mobileNumber: mobileNumber.text.trim().toString());
    _eventCompleted(emit);
  }

  searchMobileNumber({BuildContext context,String mobileNumber}) async{
    var res = await BookingRegistrationFormHelper.fetchGetDmaByPhoneNumber(context:context, mobileNumber:mobileNumber );
    if(res != null){
      _allDMAFormData = res.data[0];
      _allDmaFormDataList =res.data;
      if(_allDMAFormData != null){
        _identityProofFront = allDMAFormData.kyc.identificationFrontImage.toString();
        _identityProofBack = allDMAFormData.kyc.identificationBackImage;
        _addProofFront = allDMAFormData.kyc.ownershipFrontImage;
        _addProofBack = allDMAFormData.kyc.ownershipBackImage;
        _nocDocFront = allDMAFormData.kyc.kycDoc3FrontImage;
        _nocDocBack = allDMAFormData.kyc.ownershipBackImage;
        _uploadCustomer = allDMAFormData.kyc.ownershipBackImage;
        _uploadHouse = allDMAFormData.kyc.ownershipBackImage;
        _customerConsent = allDMAFormData.kyc.ownershipBackImage;
        _ownerConsent = allDMAFormData.kyc.ownershipBackImage;
        _cancelCheque = allDMAFormData.kyc.ownershipBackImage;
        _cheque = allDMAFormData.kyc.ownershipBackImage;
        interested.text  = allDMAFormData.info.interested;
        chargeArea.text  = allDMAFormData.kyc.areaName;
        area.text  = allDMAFormData.kyc.areaName;
       // mobileNumber.text  = allDMAFormData.info.mobileNumber;
        district.text  = allDMAFormData.kyc.district;
        firstName.text  = allDMAFormData.info.firstName;
        middleName.text  = allDMAFormData.info.firstName;
        surName.text  = allDMAFormData.info.lastName;
        guardianType.text  = allDMAFormData.kyc.guardianName;
        guardianName.text  = allDMAFormData.kyc.guardianName;
        emailId.text  = allDMAFormData.kyc.emailId;
        propertyCategory.text  = allDMAFormData.kyc.propertyCategoryId;
        propertyClass.text  = allDMAFormData.kyc.propertyClassId;
        houseNumber.text  = allDMAFormData.kyc.houseNumber;
        buildingNumber.text  = allDMAFormData.kyc.locality;
        colony.text  = allDMAFormData.kyc.locality;
        streetName.text  = allDMAFormData.kyc.locality;
        town.text  = allDMAFormData.kyc.locality;
        pinCode.text  = allDMAFormData.kyc.locality;
        residentialStatus.text  = allDMAFormData.kyc.locality;
        noKitchen.text  = allDMAFormData.kyc.locality;
        noBathroom.text  = allDMAFormData.kyc.locality;
        cookingFuel.text  = allDMAFormData.kyc.existingCookingFuel;
        noFamily.text  = allDMAFormData.kyc.noOfFamilyMembers;
        landmark.text  = allDMAFormData.kyc.noOfFamilyMembers;
        latitude.text  = allDMAFormData.kyc.noOfFamilyMembers;
        longitude.text  = allDMAFormData.kyc.noOfFamilyMembers;
        identityProof.text  = allDMAFormData.kyc.noOfFamilyMembers;
        identityProofNo.text  = allDMAFormData.kyc.noOfFamilyMembers;
        addProof.text  = allDMAFormData.kyc.noOfFamilyMembers;
        addProofNo.text  = allDMAFormData.kyc.noOfFamilyMembers;
        nocDoc.text  = allDMAFormData.kyc.noOfFamilyMembers;
        nocDocNo.text  = allDMAFormData.kyc.noOfFamilyMembers;
        preferredBillingMode.text  = allDMAFormData.kyc.noOfFamilyMembers;
        custBankName.text  = allDMAFormData.customerConsent.nameOfBank;
        custBankAccNo.text  = allDMAFormData.customerConsent.bankAccountNumber;
        custIfscCode.text  = allDMAFormData.customerConsent.bankIfscCode;
        custBankAdd.text  = allDMAFormData.customerConsent.bankAddress;
        initialDepositStatus.text  = allDMAFormData.deposit.initialDepositeStatus;
        schemeName.text  = allDMAFormData.deposit.depositeType;
        schemeAmount.text  = allDMAFormData.deposit.initialAmount;
        modeStatue.text  = allDMAFormData.deposit.modeOfDeposite;
        chequeNo.text  = allDMAFormData.deposit.chequeNumber;
        chequeDate.text  = allDMAFormData.deposit.initialDepositeDate.toString();
        paymentBankName.text  = allDMAFormData.deposit.paymentBankName;
        chequeMicrNo.text  = allDMAFormData.deposit.depositSlip;
      }
   }
  }

  _selectSearchPhoneNumber(BookingRegistrationFormSelectSearchPhoneNumberEvent event, emit){
    String mobileNo = event.mobileNumber;
    for (var element in allDmaFormDataList) {
      if (element.info.mobileNumber.toString().toLowerCase() == mobileNo.toLowerCase()) {
        mobileNumber.text = element.info.mobileNumber.toString();
        _allDMAFormData = element;
      }
    }
    _eventCompleted(emit);
  }

  _setSearchPhoneNumber(BookingRegistrationFormSetSearchPhoneNumberEvent event, emit) async {
    mobileNumber.text = event.mobileNumber;
   await searchMobileNumber(context: event.context,mobileNumber: event.mobileNumber);
  }

  _eventCompleted(Emitter<BookingRegistrationFormState> emit) {
    emit(BookingRegistrationFormDataState(
      isSaveServerLoader:isSaveServerLoader,
      mobileNumberList:mobileNumberList,
      interested: interested,
      chargeArea: chargeArea,
      area: area,
      mobileNumber: mobileNumber,
      district: district,
      firstName: firstName,
      middleName: middleName,
      surName: surName,
      guardianType: guardianType,
      guardianName: guardianName,
      emailId: emailId,
      propertyCategory: propertyCategory,
      propertyClass: propertyClass,
      houseNumber: houseNumber,
      buildingNumber: buildingNumber,
      colony: colony,
      streetName: streetName,
      town: town,
      pinCode: pinCode,
      residentialStatus: residentialStatus,
      noKitchen: noKitchen,
      noBathroom: noBathroom,
      cookingFuel: cookingFuel,
      noFamily: noFamily,
      landmark: landmark,
      latitude: latitude,
      longitude: longitude,
      identityProof: identityProof,
      identityProofNo: identityProofNo,
      identityProofFront: identityProofFront,
      identityProofBack: identityProofBack,
      addProof: addProof,
      addProofNo: addProofNo,
      addProofFront: addProofFront,
      addProofBack: addProofBack,
      nocDoc: nocDoc,
      nocDocNo: nocDocNo,
      nocDocFront: nocDocFront,
      nocDocBack: nocDocBack,
      uploadCustomer: uploadCustomer,
      uploadHouse:uploadHouse,
      customerConsent:customerConsent,
      ownerConsent:ownerConsent,
      preferredBillingMode: preferredBillingMode,
      custBankName: custBankName,
      custBankAccNo: custBankAccNo,
      custIfscCode: custIfscCode,
      custBankAdd: custBankAdd,
      initialDepositStatus: initialDepositStatus,
      schemeName: schemeName,
      schemeAmount: schemeAmount,
      modeStatue: modeStatue,
      chequeNo: chequeNo,
      chequeDate: chequeDate,
      paymentBankName: paymentBankName,
      chequeMicrNo: chequeMicrNo,
      cheque: cheque,
      allDMAFormDataList : allDmaFormDataList,
      allDMAFormData : allDMAFormData,
    ));
  }
}