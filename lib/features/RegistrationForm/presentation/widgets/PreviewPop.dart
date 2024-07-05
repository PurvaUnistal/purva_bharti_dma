import 'package:flutter/material.dart';
import 'package:pbg_app/ExportFile/export_file.dart';
import 'package:pbg_app/features/RegistrationForm/presentation/widgets/pop_widget.dart';

class PreviewPop extends StatelessWidget {
  final SaveRegistrationFormModel cusRegData;
  const PreviewPop({super.key,required this.cusRegData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColor.white,
        margin: EdgeInsets.all(10.0),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PopWidget.header(context: context),
                  PopWidget.itemBuilder(star: AppString.star,textName: AppString.registrationType, textValue: cusRegData.interested == null ? "" : cusRegData.interested!),
                  PopWidget.itemBuilder(star: AppString.star,textName: AppString.conversionPolicy, textValue:  cusRegData.acceptConversionPolicy == null ? "" : cusRegData.acceptConversionPolicy!),
                  PopWidget.itemBuilder(star: AppString.star,textName: AppString.fittingCost, textValue: cusRegData.acceptExtraFittingCost == null ? "" : cusRegData.acceptExtraFittingCost),
                  PopWidget.itemBuilder(star: AppString.star,textName: AppString.mdpeAllow, textValue:  cusRegData.societyAllowedMdpe == null ? "" : cusRegData.societyAllowedMdpe),
                  PopWidget.itemBuilder(star: AppString.star,textName: AppString.chargeArea, textValue:  cusRegData.chargeArea == null ? "" :  cusRegData.chargeArea),
                  PopWidget.itemBuilder(star: AppString.star,textName: AppString.area, textValue:  cusRegData.areaId == null ? "" :cusRegData.areaId),
                  PopWidget.itemBuilder(star: AppString.star,textName: AppString.mobileNo, textValue:  cusRegData.mobileNumber == null ? "" : cusRegData.mobileNumber),
                  PopWidget.itemBuilder(textName: AppString.alternateMobileNo, textValue:  cusRegData.alternateMobile == null ? "" : cusRegData.alternateMobile),
                  PopWidget.itemBuilder(star: AppString.star,textName: AppString.firstName, textValue:  cusRegData.firstName == null ? "" :  cusRegData.firstName),
                  PopWidget.itemBuilder(textName: AppString.middleName, textValue:  cusRegData.middleName == null ? "" : cusRegData.middleName),
                  PopWidget.itemBuilder(star: AppString.star,textName: AppString.lastName, textValue: cusRegData.lastName == null  ? "" : cusRegData.lastName),
                  PopWidget.itemBuilder(star: cusRegData.interested != "Future Registration"
                      ? AppString.star : "", textName: AppString.guardianType, textValue:  cusRegData.guardianType == null ? "" : cusRegData.guardianType),
                  PopWidget.itemBuilder(star: interestValue!.value != "Future Registration" ? AppString.star : "", textName: AppString.guardianName, textValue:  cusRegData.guardianNameController.text.isEmpty ? "" : guardianNameController.text),
                  PopWidget.itemBuilder(textName: AppString.emailAddress, textValue:  cusRegData.emailId == null ? "" : emailIdController.text),
                  PopWidget.itemBuilder(star: AppString.star,textName: AppString.propertyCategory, textValue:  cusRegData.propertyCategoryValue == null ? "" : propertyCategoryValue!.name),
                  PopWidget.itemBuilder(star: AppString.star,textName: AppString.propertyClass, textValue:  cusRegData.propertyClassValue == null ? "" : propertyClassValue!.name),
                  PopWidget.itemBuilder(textName: AppString.buildingNumber, textValue:  cusRegData.buildingNumberController == null ? "" : buildingNumberController.text),
                  PopWidget.itemBuilder(star: AppString.star,textName: AppString.houseNumber, textValue:  cusRegData.houseNumberController == null ? "" :  houseNumberController.text),
                  PopWidget.itemBuilder(star: AppString.star,textName: AppString.colony, textValue: cusRegData.colonySocietyApartment == null  ? "" :cusRegData.colonySocietyApartment),
                  PopWidget.itemBuilder(star: AppString.star,textName: AppString.streetName, textValue: cusRegData.streetName == null ? "" : cusRegData.streetName),
                  PopWidget.itemBuilder(textName: AppString.town, textValue: cusRegData.town == null ? "" : cusRegData.town),
                  PopWidget.itemBuilder(star: AppString.star,textName: AppString.district, textValue: cusRegData.districtId == null ? "" : cusRegData.districtId ),
                  PopWidget.itemBuilder(star: AppString.star,textName: AppString.pinCode, textValue: cusRegData.pinCode == null ? "" : cusRegData.pinCode),
                  PopWidget.itemBuilder(textName: AppString.noOfKitchen, textValue: cusRegData.noOfKitchen == null ? "" : cusRegData.noOfKitchen),
                  PopWidget.itemBuilder(textName: AppString.noOfBathroom, textValue: cusRegData.noOfBathroom == null ? "" : cusRegData.noOfBathroom ),
                  PopWidget.itemBuilder(textName: AppString.fuel, textValue: cusRegData.existingCookingFuel == null ? "" : cusRegData.existingCookingFuel ),
                  PopWidget.itemBuilder(textName: AppString.noOfFamilyMembers, textValue: cusRegData.noOfFamilyMembers == null  ? "-" : cusRegData.noOfFamilyMembers),
                  PopWidget.itemBuilder(star: AppString.star,textName: AppString.locationLat, textValue: cusRegData.latitude == null ? "" : cusRegData.latitude),
                  PopWidget.itemBuilder(star: AppString.star,textName: AppString.locationLong, textValue: cusRegData.longitude == null ? "-" : cusRegData.longitude),
                  PopWidget.itemBuilder(star: AppString.star,textName: AppString.idProof, textValue: cusRegData.kycDocument1 == null ? "-" : cusRegData.kycDocument1),
                  PopWidget.itemBuilder(star: AppString.star,textName: AppString.idProofNo, textValue: cusRegData.kycDocument1Number == null ? "" : cusRegData.kycDocument1Number),
                  PopWidget.divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ImageWidget(
                        star: AppString.star,
                        title: AppString.idProofFront,
                        imgFile: cusRegData.documentUploadsPhoto1 == null ? File("") : File(cusRegData.documentUploadsPhoto1!),
                        onPressed: (){},
                      ),
                      ImageWidget(
                        // star: AppString.star,
                        title: AppString.idProofBack,
                        imgFile: cusRegData.backSidePhoto1 == null  ? File("") : File(cusRegData.backSidePhoto1!),
                        onPressed: (){},
                      ),
                    ],
                  ),
                  PopWidget.itemBuilder(star: cusRegData.interested != "Future Registration" ?AppString.star : "",textName: AppString.addProof, textValue: cusRegData.kycDocument2 == null ? "-" : cusRegData.kycDocument2),
                  PopWidget.itemBuilder(star: cusRegData.interested != "Future Registration" ?AppString.star : "",textName: AppString.addProofNo, textValue: cusRegData.kycDocument2Number == null  ? "" : cusRegData.kycDocument2Number),
                  PopWidget.divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ImageWidget(
                        star: cusRegData.interested != "Future Registration" ? AppString.star : "",
                        title: AppString.addProofFront,
                        imgFile: cusRegData.backSidePhoto2 == null ? File("") : File(cusRegData.backSidePhoto2!),
                        onPressed: (){},
                      ),
                      ImageWidget(
                        title: AppString.addProofBack,
                        imgFile: cusRegData.documentUploadsPhoto2 ==null ? File("") : File(cusRegData.documentUploadsPhoto2!),
                        onPressed: (){},
                      ),
                    ],
                  ),
                  if(cusRegData.interested != "Future Registration")...[
                    PopWidget.itemBuilder(textName: AppString.ownershipProperty, textValue:  cusRegData.kycDoc3Value == null ? "-" : kycDoc3Value!.value),
                    PopWidget.divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ImageWidget(
                          title: AppString.customerImg,
                          imgFile: cusRegData.customerConsent == null ? File("") : File(cusRegData.customerConsent!),
                          onPressed: (){},
                        ),
                        cusRegData.kycDocument3 == "Rented"
                            ?ImageWidget(
                          star: AppString.star,
                          title: AppString.nocDoc,
                          imgFile: cusRegData.documentUploadsPhoto3 == null ? File("") : File(cusRegData.documentUploadsPhoto3!),
                          onPressed: (){},
                        ):ImageWidget(
                          title: AppString.houseImg,
                          imgFile: cusRegData.uploadHousePhoto == null ? File("") : File(cusRegData.uploadHousePhoto!),
                          onPressed: (){},
                        ),
                      ],
                    ),
                    PopWidget.divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        cusRegData.kycDocument3 == "Rented"
                            ? ImageWidget(
                          title: AppString.houseImg,
                          imgFile: cusRegData.uploadHousePhoto == null  ? File("") : File(cusRegData.uploadHousePhoto!),
                          onPressed: (){},
                        )
                            : Container(),
                      ],
                    ),
                    PopWidget.itemBuilder(textName: AppString.initDepositStatus, textValue: cusRegData.initialDepositeStatus == null ? "-" : cusRegData.initialDepositeStatus),
                    PopWidget.itemBuilder(textName: AppString.depositType, textValue: cusRegData.depositeType == null ? "-" : cusRegData.depositeType),
                    PopWidget.itemBuilder(textName: AppString.depositAmt, textValue: cusRegData.depositTypeAmount == null ? "-" : cusRegData.depositTypeAmount),
                    PopWidget.itemBuilder(textName: AppString.modeDeposit, textValue: cusRegData.modeDepositValue == null ? "-" : cusRegData.modeDepositValue),
                    if (cusRegData.modeDepositValue == "Cheque") ...[
                      PopWidget.itemBuilder(textName: AppString.chqNo, textValue: cusRegData.chequeNumber == null ? "-" : cusRegData.chequeNumber),
                      PopWidget.itemBuilder(textName: AppString.chqDate, textValue: cusRegData.chequeDepositDate == null ? "" : cusRegData.chequeDepositDate),
                      PopWidget.itemBuilder(textName: AppString.chqBank, textValue: cusRegData.payementBankName == null ? "": cusRegData.payementBankName),
                      PopWidget.itemBuilder(textName: AppString.chequeAccountNo, textValue: cusRegData.chequeBankAccount == null ? "":  cusRegData.chequeBankAccount),
                      PopWidget.itemBuilder(textName: AppString.chequeMICRNo, textValue: cusRegData.chequeMicrAccount == null ? "": cusRegData.chequeMicrAccount),
                      PopWidget.divider(),
                      ImageWidget(
                        star: AppString.star,
                        title: AppString.chqPhoto,
                        imgFile: cusRegData.chequePhoto == null ? File("" ): File(cusRegData.chequePhoto!),
                        onPressed: (){},
                      ),
                    ]
                  ],
                  PopWidget.divider(),
                  SizedBox(
                      height:MediaQuery.of(context).size.height* 0.09
                  )
                ],
              ),
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    isSaveLoader == false
                        ? Flexible(
                      child: ButtonWidget(
                          text: AppString.save,
                          onPressed: () {
                            BlocProvider.of<RegistrationFormBloc>(context)
                                .add(RegistrationFormSaveLocalDataEvent(context: context));
                          }),
                    )
                        : DottedLoaderWidget(),
                    Flexible(
                      child: ButtonWidget(
                          text: AppString.edit,
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
