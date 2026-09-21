import 'package:flutter/material.dart';
import 'package:pbg_app/ExportFile/export_file.dart';
import 'package:pbg_app/features/dashboard/domain/model/get_premise_type_model.dart';

abstract class RegistrationFormEvent extends Equatable {}

class RegistrationFormPageLoadEvent extends RegistrationFormEvent {
  final BuildContext context;
  RegistrationFormPageLoadEvent({required this.context});
  @override
  List<Object?> get props => [context];
}

class RegistrationFormSetInterestValue extends RegistrationFormEvent {
  final GetNotInterestedModel registrationTypeValue;
  RegistrationFormSetInterestValue({required this.registrationTypeValue});
  @override
  List<Object?> get props => [registrationTypeValue];
}

class RegistrationFormSetConversionPolicyValue extends RegistrationFormEvent {
  final GetAcceptConversionPolicyModel conversionPolicyValue;
  RegistrationFormSetConversionPolicyValue({required this.conversionPolicyValue});
  @override
  List<Object?> get props => [conversionPolicyValue];
}

class RegistrationFormSetExtraFittingValue extends RegistrationFormEvent {
  final dynamic extraFittingValue;
  RegistrationFormSetExtraFittingValue({required this.extraFittingValue});
  @override
  List<Object?> get props => [extraFittingValue];
}

class RegistrationFormSetSocietyAllowValue extends RegistrationFormEvent {
  final dynamic societyAllowValue;
  RegistrationFormSetSocietyAllowValue({required this.societyAllowValue});
  @override
  List<Object?> get props => [societyAllowValue];
}

class RegistrationFormSetChargeAreaValue extends RegistrationFormEvent {
  final dynamic chargeAreaValue;
  RegistrationFormSetChargeAreaValue({required this.chargeAreaValue});
  @override
  List<Object?> get props => [chargeAreaValue];
}

class RegistrationFormSetAreaValue extends RegistrationFormEvent {
  final dynamic areaValue;
  RegistrationFormSetAreaValue({required this.areaValue});
  @override
  List<Object?> get props => [areaValue];
}

class RegistrationFormSetGuardianTypeValue extends RegistrationFormEvent {
  final dynamic guardianTypeValue;
  RegistrationFormSetGuardianTypeValue({required this.guardianTypeValue});
  @override
  List<Object?> get props => [guardianTypeValue];
}

class RegistrationFormSelectDateEvent extends RegistrationFormEvent {
  final BuildContext context;
  RegistrationFormSelectDateEvent({required this.context});
  @override
  List<Object?> get props => [context];
}

class RegistrationFormSetPropertyCategoryValue extends RegistrationFormEvent {
  final dynamic propertyCategoryValue;
  RegistrationFormSetPropertyCategoryValue({required this.propertyCategoryValue});
  @override
  List<Object?> get props => [propertyCategoryValue];
}

class RegistrationFormSetPropertyClassValue extends RegistrationFormEvent {
  final dynamic propertyClassValue;
  RegistrationFormSetPropertyClassValue({required this.propertyClassValue});
  @override
  List<Object?> get props => [propertyClassValue];
}

class RegistrationFormSetPremiseTypeValue extends RegistrationFormEvent {
  final GetPremiseTypeModel premiseTypeValue;
  RegistrationFormSetPremiseTypeValue({required this.premiseTypeValue});
  @override
  List<Object?> get props => [premiseTypeValue];
}


class RegistrationFormSetDistrictValue extends RegistrationFormEvent {
  final dynamic allDistrictValue;
  RegistrationFormSetDistrictValue({required this.allDistrictValue});
  @override
  List<Object?> get props => [allDistrictValue];
}

class RegistrationFormSetResidentStatusValue extends RegistrationFormEvent {
  final dynamic residentStatusValue;
  RegistrationFormSetResidentStatusValue({required this.residentStatusValue});
  @override
  List<Object?> get props => [residentStatusValue];
}

class RegistrationFormSetExistingCookingFuelValue extends RegistrationFormEvent {
  final dynamic existingCookingFuelValue;
  RegistrationFormSetExistingCookingFuelValue({required this.existingCookingFuelValue});
  @override
  List<Object?> get props => [existingCookingFuelValue];
}

class RegistrationFormSetKycDoc1Value extends RegistrationFormEvent {
  final dynamic kycDoc1Value;
  RegistrationFormSetKycDoc1Value({required this.kycDoc1Value});
  @override
  List<Object?> get props => [kycDoc1Value];
}

class RegistrationFormSetKycDoc2Value extends RegistrationFormEvent {
  final dynamic kycDoc2Value;
  RegistrationFormSetKycDoc2Value({required this.kycDoc2Value});
  @override
  List<Object?> get props => [kycDoc2Value];
}

class RegistrationFormSetKycDoc3Value extends RegistrationFormEvent {
  final dynamic kycDoc3Value;
  RegistrationFormSetKycDoc3Value({required this.kycDoc3Value});
  @override
  List<Object?> get props => [kycDoc3Value];
}

class RegistrationFormSetPreferredBillValue extends RegistrationFormEvent {
  final dynamic preferredBillValue;
  RegistrationFormSetPreferredBillValue({required this.preferredBillValue});
  @override
  List<Object?> get props => [preferredBillValue];
}

class RegistrationFormSetCustBankNameValue extends RegistrationFormEvent {
  final dynamic custBankNameValue;
  RegistrationFormSetCustBankNameValue({required this.custBankNameValue});
  @override
  List<Object?> get props => [custBankNameValue];
}

class RegistrationFormSetPaymentBankNameValue extends RegistrationFormEvent {
  final dynamic paymentBankNameValue;
  RegistrationFormSetPaymentBankNameValue({required this.paymentBankNameValue});
  @override
  List<Object?> get props => [paymentBankNameValue];
}

class RegistrationFormSetInitialDepositStatusValue extends RegistrationFormEvent {
  final dynamic initialDepositStatusValue;
  RegistrationFormSetInitialDepositStatusValue({required this.initialDepositStatusValue});
  @override
  List<Object?> get props => [initialDepositStatusValue];
}

class RegistrationFormSchemeTypeValue extends RegistrationFormEvent {
  final GetAllDepositOfflineModel schemeTypeValue;
  RegistrationFormSchemeTypeValue({required this.schemeTypeValue});
  @override
  List<Object?> get props => [schemeTypeValue];
}

class RegistrationFormSetModeDepositValue extends RegistrationFormEvent {
  final dynamic modeDepositValue;
  RegistrationFormSetModeDepositValue({required this.modeDepositValue});
  @override
  List<Object?> get props => [modeDepositValue];
}

class RegistrationFormSetLocation extends RegistrationFormEvent {
  final BuildContext context;
  RegistrationFormSetLocation({required this.context});
  @override
  List<Object?> get props => [context];
}

class RegistrationFormSetChequeDateEvent extends RegistrationFormEvent {
  final BuildContext context;
  RegistrationFormSetChequeDateEvent({required this.context});
  @override
  List<Object?> get props => [context];
}

class SelectIdFrontGalleryCapture extends RegistrationFormEvent {
  @override
  List<Object?> get props => [];
}

class SelectIdFrontCameraCapture extends RegistrationFormEvent {
  @override
  List<Object?> get props => [];
}

class SelectIdBackGalleryCapture extends RegistrationFormEvent {
  @override
  List<Object?> get props => [];
}

class SelectIdBackCameraCapture extends RegistrationFormEvent {
  @override
  List<Object?> get props => [];
}
class SelectAddFrontGalleryCapture extends RegistrationFormEvent {
  @override
  List<Object?> get props => [];
}

class SelectAddFrontCameraCapture extends RegistrationFormEvent {
  @override
  List<Object?> get props => [];
}


class SelectAddBackGalleryCapture extends RegistrationFormEvent {
  @override
  List<Object?> get props => [];
}

class SelectAddBackCameraCapture extends RegistrationFormEvent {
  @override
  List<Object?> get props => [];
}

class SelectNocDocBackGalleryCapture extends RegistrationFormEvent {
  @override
  List<Object?> get props => [];
}

class SelectNocDocCameraCapture extends RegistrationFormEvent {
  @override
  List<Object?> get props => [];
}
class SelectCustomerGalleryCapture extends RegistrationFormEvent {
  @override
  List<Object?> get props => [];
}

class SelectCustomerCameraCapture extends RegistrationFormEvent {
  @override
  List<Object?> get props => [];
}

class SelectHouseGalleryCapture extends RegistrationFormEvent {
  @override
  List<Object?> get props => [];
}

class SelectHouseCameraCapture extends RegistrationFormEvent {
  @override
  List<Object?> get props => [];
}

class SelectChqGalleryCapture extends RegistrationFormEvent {
  @override
  List<Object?> get props => [];
}

class SelectChqCameraCapture extends RegistrationFormEvent {
  @override
  List<Object?> get props => [];
}
class RegistrationFormPreviewPageEvent extends RegistrationFormEvent {
  final BuildContext context;
  RegistrationFormPreviewPageEvent({required this.context});
  @override
  List<Object?> get props => [context];
}

class SchemeTypeDetailEvent extends RegistrationFormEvent {
  final BuildContext context;
  SchemeTypeDetailEvent({required this.context});
  @override
  List<Object?> get props => [context];
}


class RegistrationFormSaveLocalDataEvent extends RegistrationFormEvent {
  final BuildContext context;
  RegistrationFormSaveLocalDataEvent({required this.context,});
  @override
  List<Object?> get props => [context];
}


class UpdateLocalDataEvent extends RegistrationFormEvent {
  final BuildContext context;
  final int index;
  final bool isUpdate;
  final SaveRegistrationFormModel updatedModel;
  UpdateLocalDataEvent({
    required this.context,
    required this.index,
    required this.isUpdate,
    required this.updatedModel,
  });
  @override
  List<Object?> get props => [context, index,isUpdate,updatedModel];
}

class AddFormEvent extends RegistrationFormEvent {
  final SaveRegistrationFormModel form;

  AddFormEvent({required this.form});

  @override
  List<Object?> get props => [form];
}

class UpdateFormEvent extends RegistrationFormEvent {
  final int index;
  final SaveRegistrationFormModel updatedForm;

  UpdateFormEvent({required this.index,required this.updatedForm});

  @override
  List<Object?> get props => [index,updatedForm];
}