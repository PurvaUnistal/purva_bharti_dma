import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:pbg_app/screens/BookingRegistrationForm/domain/model/get_dma_by_phone_number_model.dart';

abstract class BookingRegistrationFormState extends Equatable{}

class BookingRegistrationFormInitialState extends BookingRegistrationFormState {
  @override
  List<Object> get props => [];
}

class BookingRegistrationFormPageLoadState extends BookingRegistrationFormState {
  @override
  List<Object> get props => [];
}

class BookingRegistrationFormDataState extends BookingRegistrationFormState {
  final bool isSaveServerLoader;
  final List<String> mobileNumberList;
  final TextEditingController interested;
  final TextEditingController chargeArea;
  final TextEditingController area;
  final TextEditingController mobileNumber;
  final TextEditingController district;
  final TextEditingController firstName;
  final TextEditingController middleName;
  final TextEditingController surName;
  final TextEditingController guardianType;
  final TextEditingController guardianName;
  final TextEditingController emailId;
  final TextEditingController propertyCategory;
  final TextEditingController propertyClass;
  final TextEditingController houseNumber;
  final TextEditingController buildingNumber;
  final TextEditingController colony;
  final TextEditingController streetName;
  final TextEditingController town;
  final TextEditingController pinCode;
  final TextEditingController residentialStatus;
  final TextEditingController noKitchen;
  final TextEditingController noBathroom;
  final TextEditingController cookingFuel;
  final TextEditingController noFamily;
  final TextEditingController landmark;
  final TextEditingController latitude;
  final TextEditingController longitude;
  final TextEditingController identityProof;
  final TextEditingController identityProofNo;
  final String identityProofFront;
  final String identityProofBack;
  final TextEditingController addProof;
  final TextEditingController addProofNo;
  final String addProofFront;
  final String addProofBack;
  final TextEditingController nocDoc;
  final TextEditingController nocDocNo;
  final String nocDocFront;
  final String nocDocBack;
  final String uploadCustomer;
  final String uploadHouse;
  final String customerConsent;
  final String ownerConsent;
  final TextEditingController preferredBillingMode;
  final TextEditingController custBankName;
  final TextEditingController custBankAccNo;
  final TextEditingController custIfscCode;
  final TextEditingController custBankAdd;
  final TextEditingController initialDepositStatus;
  final TextEditingController schemeName;
  final TextEditingController schemeAmount;
  final TextEditingController modeStatue;
  final TextEditingController chequeNo;
  final TextEditingController chequeDate;
  final TextEditingController paymentBankName;
  final TextEditingController chequeMicrNo;
  final String cheque;
  final List<AllDMAFormData> allDMAFormDataList;
  final AllDMAFormData allDMAFormData;
  BookingRegistrationFormDataState({
    this.isSaveServerLoader,
    this.interested,
    this.mobileNumberList,
    this.chargeArea,
    this.area,
    this.mobileNumber,
    this.district,
    this.firstName,
    this.middleName,
    this.surName,
    this.guardianType,
    this.guardianName,
    this.emailId,
    this.propertyCategory,
    this.propertyClass,
    this.houseNumber,
    this.buildingNumber,
    this.colony,
    this.streetName,
    this.town,
    this.pinCode,
    this.residentialStatus,
    this.noKitchen,
    this.noBathroom,
    this.cookingFuel,
    this.noFamily,
    this.landmark,
    this.latitude,
    this.longitude,
    this.identityProof,
    this.identityProofNo,
    this.identityProofFront,
    this.identityProofBack,
    this.addProof,
    this.addProofNo,
    this.addProofFront,
    this.addProofBack,
    this.nocDoc,
    this.nocDocNo,
    this.nocDocFront,
    this.nocDocBack,
    this.uploadCustomer,
    this.uploadHouse,
    this.customerConsent,
    this.ownerConsent,
    this.preferredBillingMode,
    this.custBankName,
    this.custBankAccNo,
    this.custIfscCode,
    this.custBankAdd,
    this.initialDepositStatus,
    this.schemeName,
    this.schemeAmount,
    this.modeStatue,
    this.chequeNo,
    this.chequeDate,
    this.paymentBankName,
    this.chequeMicrNo,
    this.cheque,
    this.allDMAFormDataList,
    this.allDMAFormData,
  });

  @override
  List<Object> get props => [
    isSaveServerLoader,
    interested,
    mobileNumberList,
    chargeArea,
    area,
    mobileNumber,
    district,
    firstName,
    middleName,
    surName,
    guardianType,
    guardianName,
    emailId,
    propertyCategory,
    propertyClass,
    houseNumber,
    buildingNumber,
    colony,
    streetName,
    town,
    pinCode,
    residentialStatus,
    noKitchen,
    noBathroom,
    cookingFuel,
    noFamily,
    landmark,
    latitude,
    longitude,
    identityProof,
    identityProofNo,
    identityProofFront,
    identityProofBack,
    addProof,
    addProofNo,
    addProofFront,
    addProofBack,
    nocDoc,
    nocDocNo,
    nocDocFront,
    nocDocBack,
    uploadCustomer,
    uploadHouse,
    customerConsent,
    ownerConsent,
    preferredBillingMode,
    custBankName,
    custBankAccNo,
    custIfscCode,
    custBankAdd,
    initialDepositStatus,
    schemeName,
    schemeAmount,
    modeStatue,
    chequeNo,
    chequeDate,
    paymentBankName,
    chequeMicrNo,
    cheque,
    allDMAFormDataList,
    allDMAFormData,
  ];
}