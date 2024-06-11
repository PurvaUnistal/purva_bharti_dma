import 'package:flutter/material.dart';
import 'package:pbg_app/ExportFile/export_file.dart';

class RegistrationFormPreviewPopWidget extends StatelessWidget {
  final SaveRegistrationFormModel cusRegData;

  const RegistrationFormPreviewPopWidget({
    required this.cusRegData,
  });

  @override
  Widget build(BuildContext context) {
    print(  MediaQuery.of(context).size.height* 0.09);
    return Scaffold(
      body: Container(
        color: AppColor.white,
        margin: EdgeInsets.all(10.0),
        child: BlocBuilder<RegistrationFormBloc, RegistrationFormState>(
          builder: (context, state) {
            if (state is RegistrationFormGetAllDataState) {
              return Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _header(context: context),
                        _itemBuilder(star: AppString.star,textName: AppString.registrationType, textValue: cusRegData.interested == null ? "" : cusRegData.interested),
                        _itemBuilder(star: AppString.star,textName: AppString.conversionPolicy, textValue: cusRegData.acceptConversionPolicy == null ? "" : cusRegData.acceptConversionPolicy),
                        _itemBuilder(star: AppString.star,textName: AppString.fittingCost, textValue:cusRegData.acceptExtraFittingCost == null ? "" : cusRegData.acceptExtraFittingCost),
                        _itemBuilder(star: AppString.star,textName: AppString.mdpeAllow, textValue: cusRegData.societyAllowedMdpe == null ? "" :cusRegData.societyAllowedMdpe),
                        _itemBuilder(star: AppString.star,textName: AppString.chargeArea, textValue:cusRegData.chargeArea == null ? "" : cusRegData.chargeArea),
                        _itemBuilder(star: AppString.star,textName: AppString.area, textValue:cusRegData.areaId == null ? "" : cusRegData.areaId),
                        _itemBuilder(star: AppString.star,textName: AppString.mobileNo, textValue:cusRegData.mobileNumber == null ? "" : cusRegData.mobileNumber),
                        _itemBuilder(textName: AppString.alternateMobileNo, textValue: cusRegData.alternateMobile == null ? "" :cusRegData.alternateMobile),
                        _itemBuilder(star: AppString.star,textName: AppString.firstName, textValue: cusRegData.firstName == null ? "" : cusRegData.firstName),
                        _itemBuilder(textName: AppString.middleName, textValue: cusRegData.middleName == null ? "" : cusRegData.middleName),
                        _itemBuilder(star: AppString.star,textName: AppString.lastName, textValue: cusRegData.lastName == null ? "" : cusRegData.lastName),
                        _itemBuilder(star:cusRegData.interested != "Future Registration" ? AppString.star : "",textName: AppString.guardianType, textValue: cusRegData.guardianType == null ? "" : cusRegData.guardianType),
                        _itemBuilder(star:cusRegData.interested != "Future Registration" ? AppString.star : "",textName: AppString.guardianName, textValue: cusRegData.guardianName == null ? "" : cusRegData.guardianName),
                        _itemBuilder(textName: AppString.emailAddress, textValue: cusRegData.emailId == null ? "" : cusRegData.emailId),
                        _itemBuilder(star: AppString.star,textName: AppString.propertyCategory, textValue: cusRegData.propertyCategoryId == null ? "" : cusRegData.propertyCategoryId),
                        _itemBuilder(star: AppString.star,textName: AppString.propertyClass, textValue: cusRegData.propertyClassId == null ? "" : cusRegData.propertyClassId),
                        _itemBuilder(textName: AppString.buildingNumber, textValue: cusRegData.buildingNumber == null ? "" : cusRegData.buildingNumber),
                        _itemBuilder(star: AppString.star,textName: AppString.houseNumber, textValue: cusRegData.houseNumber == null ? "" : cusRegData.houseNumber),
                        _itemBuilder(star: AppString.star,textName: AppString.colony, textValue: cusRegData.colonySocietyApartment == null ? "" : cusRegData.colonySocietyApartment),
                        _itemBuilder(star: AppString.star,textName: AppString.streetName, textValue: cusRegData.streetName == null ? "" : cusRegData.streetName),
                        _itemBuilder(textName: AppString.town, textValue: cusRegData.town == null ? "" : cusRegData.town),
                        _itemBuilder(star: AppString.star,textName: AppString.district, textValue:cusRegData.districtId == null ? "" : cusRegData.districtId),
                        _itemBuilder(star: AppString.star,textName: AppString.pinCode, textValue: cusRegData.pinCode == null ? "" : cusRegData.pinCode),
                        _itemBuilder(textName: AppString.noOfKitchen, textValue: cusRegData.noOfKitchen == null ? "" : cusRegData.noOfKitchen),
                        _itemBuilder(textName: AppString.noOfBathroom, textValue: cusRegData.noOfBathroom == null ? "" : cusRegData.noOfBathroom),
                        _itemBuilder(textName: AppString.fuel, textValue: cusRegData.existingCookingFuel == null ? "" : cusRegData.existingCookingFuel),
                        _itemBuilder(textName: AppString.noOfFamilyMembers, textValue: cusRegData.noOfFamilyMembers == null ? "-" : cusRegData.noOfFamilyMembers),
                        _itemBuilder(star: AppString.star,textName: AppString.locationLat, textValue: cusRegData.latitude == null ? "" : cusRegData.latitude),
                        _itemBuilder(star: AppString.star,textName: AppString.locationLong, textValue: cusRegData.longitude == null ? "-" : cusRegData.longitude),
                        _itemBuilder(star: AppString.star,textName: AppString.idProof, textValue: cusRegData.kycDocument1 == null ? "-" : cusRegData.kycDocument1),
                        _itemBuilder(star: AppString.star,textName: AppString.idProofNo, textValue: cusRegData.kycDocument1Number == null ? "" : cusRegData.kycDocument1Number),
                        _divider(),
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
                              imgFile: cusRegData.backSidePhoto1 == null ? File("") : File(cusRegData.backSidePhoto1!),
                              onPressed: (){},
                            ),
                          ],
                        ),
                        _itemBuilder(star:cusRegData.interested != "Future Registration" ?AppString.star : "",textName: AppString.addProof, textValue: cusRegData.kycDocument2 == null ? "-" : cusRegData.kycDocument2),
                        _itemBuilder(star: cusRegData.interested != "Future Registration" ?AppString.star : "",textName: AppString.addProofNo, textValue: cusRegData.kycDocument2Number == null ? "" : cusRegData.kycDocument2Number),
                        _divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ImageWidget(
                              star: cusRegData.interested != "Future Registration" ?AppString.star : "",
                              title: AppString.addProofFront,
                              imgFile: cusRegData.documentUploadsPhoto2 == null ? File("") :File( cusRegData.documentUploadsPhoto2!),
                              onPressed: (){},
                            ),
                            ImageWidget(
                              title: AppString.addProofBack,
                              imgFile:  cusRegData.backSidePhoto2 == null  ? File("") : File(cusRegData.backSidePhoto2!),
                              onPressed: (){},
                            ),
                          ],
                        ),
                        if(cusRegData.interested != "Future Registration")...[
                          _itemBuilder(textName: AppString.ownershipProperty, textValue: cusRegData.kycDocument3 == null ? "-" : cusRegData.kycDocument3),
                          _divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ImageWidget(
                                title: AppString.customerImg,
                                imgFile: cusRegData.customerConsentPhoto == null ? File("") : File(cusRegData.customerConsentPhoto!),
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
                                imgFile: cusRegData.housePhoto == null ? File("") : File(cusRegData.housePhoto!),
                                onPressed: (){},
                              ),
                            ],
                          ),
                          _divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              cusRegData.kycDocument3 == "Rented"
                                  ? ImageWidget(
                                title: AppString.houseImg,
                                imgFile:cusRegData.housePhoto == null ? File("") : File(cusRegData.housePhoto!),
                                onPressed: (){},
                              )
                                  : Container(),
                            ],
                          ),
                          _itemBuilder(textName: AppString.depositStatus, textValue: cusRegData.initialDepositeStatus == null ? "-" : cusRegData.initialDepositeStatus),
                          _itemBuilder(textName: AppString.depositType, textValue: cusRegData.depositeType == null ? "-" : cusRegData.depositeType),
                          _itemBuilder(textName: AppString.depositAmt, textValue: cusRegData.depositTypeAmount == null ? "-" : cusRegData.depositTypeAmount),
                          _itemBuilder(textName: AppString.modeDeposit, textValue: cusRegData.modeDepositValue == null ? "-" : cusRegData.modeDepositValue),
                          if (cusRegData.modeOfDeposite == "Cheque") ...[
                            _itemBuilder(textName: AppString.chqNo, textValue: cusRegData.chequeNumber == null ? "-" :  cusRegData.chequeNumber),
                            _itemBuilder(textName: AppString.chqDate, textValue: cusRegData.chequeDepositDate == null ? "" :cusRegData.chequeDepositDate),
                            _itemBuilder(textName: AppString.chqBank, textValue: cusRegData.payementBankName == null ? "": cusRegData.payementBankName),
                            _itemBuilder(textName: AppString.chequeAccountNo, textValue:cusRegData.chequeBankAccount== null ? "":  cusRegData.chequeBankAccount),
                            _itemBuilder(textName: AppString.chequeMICRNo, textValue: cusRegData.micr== null ? "": cusRegData.micr),
                            _divider(),
                            ImageWidget(
                              star: AppString.star,
                              title: AppString.chqPhoto,
                              imgFile:cusRegData.chequePhoto == null ? File("" ): File(cusRegData.chequePhoto!),
                              onPressed: (){},
                            ),
                          ]
                        ],
                        _divider(),
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
                      child: _actionButton(context: context, dataState: state))
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

 static Widget _header({required BuildContext context}) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Customer Detail",
            textAlign: TextAlign.center,
            style: Styles.table,
          ),
        ],
      ),
    );
  }

  static Widget _itemBuilder({String? star, String? textName, String? textValue}) {
    return Column(
      children: [
        _divider(),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(child: Text(star??"",  style:Styles.stars)),
                  Flexible(flex: 6,child: Text(textName  ?? "", style:Styles.labels),
                  ),
                ],
              ),
              ),
              Flexible(child: Text(textValue ?? "-",
              )),
            ],
          ),
        ),

      ],
    );
  }

  static Widget _divider(){
    return Divider(
      color: AppColor.prime,
    );
  }

  static Widget _actionButton({required BuildContext context, required RegistrationFormGetAllDataState dataState}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        dataState.isSaveLoader == false
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
    );
  }




}
