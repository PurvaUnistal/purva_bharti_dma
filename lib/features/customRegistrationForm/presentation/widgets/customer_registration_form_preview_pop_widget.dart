import 'package:pbg_app/ExportFile/export_file.dart';
import 'package:flutter/material.dart';

class CustomerRegistrationFormPreviewPopWidget extends StatelessWidget {
  final SaveCusRegData cusRegData;

  const CustomerRegistrationFormPreviewPopWidget({
    required this.cusRegData,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColor.white,
        margin: EdgeInsets.all(10.0),
        child: BlocBuilder<CustomRegistrationFormBloc, CustomRegistrationFormState>(
          builder: (context, state) {
            if (state is CustomRegistrationFormGetAllDataState) {
              return Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _header(context: context),
                        _itemBuilder(textName: AppStrings.interestedLabel, textValue: cusRegData.interested.toString()),
                        _itemBuilder(textName: AppStrings.conversionPolicyLabel, textValue: cusRegData.acceptConversionPolicy.toString()),
                        _itemBuilder(textName: AppStrings.fittingCostLabel, textValue: cusRegData.acceptExtraFittingCost.toString()),
                        _itemBuilder(textName: AppStrings.societyAllow, textValue: cusRegData.societyAllowedMdpe.toString()),
                        _itemBuilder(textName: AppStrings.chargeAreaLabel, textValue: cusRegData.chargeId.toString()),
                        _itemBuilder(textName: AppStrings.areaLabel, textValue: cusRegData.areaId.toString()),
                        _itemBuilder(textName: AppStrings.mobileNoLabel, textValue: cusRegData.mobileNumber.toString()),
                        _itemBuilder(textName: AppStrings.firstNameLabel, textValue: cusRegData.firstName.toString()),
                        _itemBuilder(textName: AppStrings.middleNameLabel, textValue: cusRegData.middleName.toString()),
                        _itemBuilder(textName: AppStrings.lastNameLabel, textValue: cusRegData.lastName.toString()),
                        _itemBuilder(textName: AppStrings.guardianType, textValue: cusRegData.guardianType.toString()),
                        _itemBuilder(textName: AppStrings.guardianNameLabel, textValue: cusRegData.guardianName.toString()),
                        _itemBuilder(textName: AppStrings.emailAddressLabel, textValue: cusRegData.emailId.toString()),
                        _itemBuilder(textName: AppStrings.propertyCategoryLabel, textValue: cusRegData.propertyCategoryId.toString()),
                        _itemBuilder(textName: AppStrings.propertyClassLabel, textValue: cusRegData.propertyClassId.toString()),
                        _itemBuilder(textName: AppStrings.buildingNumberLabel, textValue: cusRegData.buildingNumber.toString()),
                        _itemBuilder(textName: AppStrings.houseNumberLabel, textValue: cusRegData.houseNumber.toString()),
                        _itemBuilder(textName: AppStrings.colonyLabel, textValue: cusRegData.colonySocietyApartment.toString()),
                        _itemBuilder(textName: AppStrings.streetNameLabel, textValue: cusRegData.streetName.toString()),
                        _itemBuilder(textName: AppStrings.townLabel, textValue: cusRegData.town.toString()),
                        _itemBuilder(textName: AppStrings.districtLabel, textValue: cusRegData.districtId == null ? "" : cusRegData.districtId.toString()),
                        _itemBuilder(textName: AppStrings.pinCodeLabel, textValue: cusRegData.pinCode == null ? "" : cusRegData.pinCode.toString()),
                        _itemBuilder(textName: AppStrings.residentStatusLabel, textValue: cusRegData.residentStatus == null ? "" : cusRegData.residentStatus.toString()),
                        _itemBuilder(textName: AppStrings.noOfKitchenLabel, textValue: cusRegData.noOfKitchen == null ? "" : cusRegData.noOfKitchen.toString()),
                        _itemBuilder(textName: AppStrings.noOfBathroomLabel, textValue: cusRegData.noOfBathroom == null ? "" : cusRegData.noOfBathroom.toString()),
                        _itemBuilder(
                            textName: AppStrings.existingCookingFuelLabel, textValue: cusRegData.existingCookingFuel == null ? "" : cusRegData.existingCookingFuel.toString()),
                        _itemBuilder(textName: AppStrings.noOfFamilyMembersLabel, textValue: cusRegData.noOfFamilyMembers == null ? "" : cusRegData.noOfFamilyMembers.toString()),
                        _itemBuilder(textName: AppStrings.locationLat, textValue: cusRegData.latitude == null ? "" : cusRegData.latitude.toString()),
                        _itemBuilder(textName: AppStrings.locationLong, textValue: cusRegData.longitude == null ? "" : cusRegData.longitude.toString()),
                        _itemBuilder(textName: AppStrings.landmarkLabel, textValue: cusRegData.nearestLandmark == null ? "" : cusRegData.nearestLandmark.toString()),
                        _itemBuilder(textName: AppStrings.kYCDoc1Label, textValue: cusRegData.kycDocument1 == null ? "" : cusRegData.kycDocument1.toString()),
                        _itemBuilder(textName: AppStrings.kYCDoc1NoLabel, textValue: cusRegData.kycDocument1Number == null ? "" : cusRegData.kycDocument1Number.toString()),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _itemImgBuilder(textName: AppStrings.idFrontImg, imagePath: cusRegData.documentUploads1 == null ? "" : cusRegData.documentUploads1.toString()),
                            _itemImgBuilder(textName: AppStrings.idBackImg, imagePath: cusRegData.backside1 == null ? "" : cusRegData.backside1.toString()),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _itemImgBuilder(
                                textName: AppStrings.eleBillFrontImgLabel, imagePath: cusRegData.documentUploads2 == null ? "" : cusRegData.documentUploads2.toString()),
                            _itemImgBuilder(textName: AppStrings.eleBillBackImgLabel, imagePath: cusRegData.backside2 == null ? "" : cusRegData.backside2.toString()),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _itemImgBuilder(textName: AppStrings.nocFrontImgLabel, imagePath: cusRegData.documentUploads3 == null ? "" : cusRegData.documentUploads3.toString()),
                            _itemImgBuilder(textName: AppStrings.nocBackImgLabel, imagePath: cusRegData.backside3 == null ? "" : cusRegData.backside3.toString()),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _itemImgBuilder(textName: AppStrings.customerImgLabel, imagePath: cusRegData.customerPhoto == null ? "" : cusRegData.customerPhoto.toString()),
                            _itemImgBuilder(textName: AppStrings.houseImgLabel, imagePath: cusRegData.housePhoto == null ? "" : cusRegData.housePhoto.toString()),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _itemImgBuilder(textName: AppStrings.customerConsentLabel, imagePath: cusRegData.customerConsent == null ? "" : cusRegData.customerConsent.toString()),
                            _itemImgBuilder(textName: AppStrings.consentPhotoLabel, imagePath: cusRegData.ownerConsent == null ? "" : cusRegData.ownerConsent.toString()),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _itemImgBuilder(textName: AppStrings.chqCancelledPhotoLabel, imagePath: cusRegData.canceledCheque == null ? "" : cusRegData.canceledCheque.toString()),
                          ],
                        ),
                        _itemBuilder(textName: AppStrings.kYCDoc2Label, textValue: cusRegData.kycDocument2 == null ? "" : cusRegData.kycDocument2.toString()),
                        _itemBuilder(textName: AppStrings.kYCDoc2NoLabel, textValue: cusRegData.kycDocument2Number == null ? "" : cusRegData.kycDocument2Number.toString()),
                        _itemBuilder(textName: AppStrings.kYCDoc3Label, textValue: cusRegData.kycDocument3 == null ? "" : cusRegData.kycDocument3.toString()),
                        _itemBuilder(textName: AppStrings.kYCDoc3NoLabel, textValue: cusRegData.kycDocument3Number == null ? "" : cusRegData.kycDocument3Number.toString()),
                        _itemBuilder(textName: AppStrings.preferredBillingMode, textValue: cusRegData.residentStatus == null ? "" : cusRegData.residentStatus.toString()),
                        _itemBuilder(
                            textName: AppStrings.selectCustomerBankName,
                            textValue: cusRegData.bankNameOfBank == null
                                ? ""
                                : cusRegData.bankNameOfBank == null
                                    ? ""
                                    : cusRegData.bankNameOfBank.toString()),
                        _itemBuilder(textName: AppStrings.customerAccountNoLabel, textValue: cusRegData.bankAccountNumber == null ? "" : cusRegData.bankAccountNumber.toString()),
                        _itemBuilder(textName: AppStrings.customerIfscCodeLabel, textValue: cusRegData.bankIfscCode == null ? "" : cusRegData.bankIfscCode.toString()),
                        _itemBuilder(textName: AppStrings.customerBankAddLabel, textValue: cusRegData.bankAddress == null ? "" : cusRegData.bankAddress.toString()),
                        _itemBuilder(
                            textName: AppStrings.initialDepositStatusLabel, textValue: cusRegData.initialDepositeStatus == null ? "" : cusRegData.initialDepositeStatus.toString()),
                        _itemBuilder(textName: AppStrings.depositTypeLabel, textValue: cusRegData.depositType == null ? "" : cusRegData.depositType.toString()),
                        _itemBuilder(textName: AppStrings.depositAmountLabel, textValue: cusRegData.depositTypeAmount == null ? "" : cusRegData.depositTypeAmount.toString()),
                        _itemBuilder(textName: AppStrings.selectModeDeposit, textValue: cusRegData.modeOfDeposite == null ? "" : cusRegData.modeOfDeposite.toString()),
                        if (cusRegData.modeOfDeposite == "Cheque") ...[
                          _itemBuilder(textName: AppStrings.chqNoLabel, textValue: cusRegData.chequeNumber.toString()),
                          _itemBuilder(textName: AppStrings.depositDateLabel, textValue: cusRegData.chequeDepositDate.toString()),
                          _itemBuilder(textName: AppStrings.payementBankNameLabel, textValue: cusRegData.payementBankName.toString()),
                          _itemBuilder(textName: AppStrings.chequeAccountNoLabel, textValue: cusRegData.chequeBankAccount.toString()),
                          _itemBuilder(textName: AppStrings.chequeMICRNoLabel, textValue: cusRegData.chequeMicrNo.toString()),
                          _itemImgBuilder(textName: AppStrings.chqPhotoLabel, imagePath: cusRegData.chequePhoto.toString()),
                        ] else ...[
                          Container()
                        ],
                      ],
                    ),
                  ),
                  _actionButton(context: context, dataState: state),
                ],
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  Widget _header({required BuildContext context}) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Customer Detail",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold, color: Colors.blue.shade900),
          ),
          /*InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.clear,
              color: AppColor.black,
            ),
          )*/
        ],
      ),
    );
  }

  Widget _itemBuilder({required String textName, required String textValue}) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(child: Text(textName)),
          Flexible(
              child: Text(
            textValue,
          )),
        ],
      ),
    );
  }

  Widget _itemImgBuilder({required String textName, required String imagePath}) {
    return Padding(
      padding: EdgeInsets.all(0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(textName),
          if (imagePath.isEmpty || imagePath == "" || imagePath == "null") ...[
            _localBorderImg()
          ] else ...[
            _fileImage(fileImage: File(imagePath)),
          ]
        ],
      ),
    );
  }

  Widget _localBorderImg() {
    return CircleAvatar(
      radius: 41,
      backgroundColor: AppColor.appBlueColor,
      child: CircleAvatar(
        radius: 40,
        backgroundColor: Colors.white,
        backgroundImage: AssetImage(
          AppIcon.imageCaptureIcon,
        ),
      ),
    );
  }

  Widget _actionButton({required BuildContext context, required CustomRegistrationFormGetAllDataState dataState}) {
    return Positioned(
      bottom: 0.0,
      child: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / 2.2,
            child: dataState.isSaveLoader == false
                ? ButtonWidget(
                    text: AppStrings.save,
                    onPressed: () {
                      BlocProvider.of<CustomRegistrationFormBloc>(context).add(CustomRegistrationFormSaveLocalDataEvent(context: context));
                    })
                : DottedLoaderWidget(),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 2.2,
            child: ButtonWidget(
                text: AppStrings.edit,
                onPressed: () {
                  Navigator.pop(context);
                }),
          ),
        ],
      ),
    );
  }

  Widget _fileImage({
    required File fileImage,
  }) {
    if (fileImage.path.isNotEmpty) {
      return CircleAvatar(
        radius: 41,
        backgroundColor: AppColor.appBlueColor,
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

  Widget _imageWidget({required Function()? onTap, required Widget child, required BuildContext context, required String imageTitle}) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 0.9,
        color: Colors.white,
        shadowColor: AppColor.appBlueColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.09, child: child),
              Text(imageTitle),
            ],
          ),
        ),
      ),
    );
  }

  Widget _idFrontFileImg({required BuildContext context, required CustomRegistrationFormGetAllDataState stateData}) {
    return _imageWidget(
        context: context,
        child: stateData.idFrontFilePath.isEmpty ? _localBorderImg() : _fileImage(fileImage: File(stateData.idFrontFilePath.toString())),
        imageTitle: AppStrings.idFrontImg,
        onTap: () {});
  }
}
