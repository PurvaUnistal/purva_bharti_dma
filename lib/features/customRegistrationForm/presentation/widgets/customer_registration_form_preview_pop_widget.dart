import 'package:pbg_app/ExportFile/export_file.dart';
import 'package:flutter/material.dart';
import 'package:pbg_app/features/customRegistrationForm/domain/model/save_customer_registration_model.dart';
import 'package:pbg_app/features/customRegistrationForm/presentation/widgets/image_widget.dart';

class CustomerRegistrationFormPreviewPopWidget extends StatelessWidget {
  final SaveCusRegData cusRegData;

  const CustomerRegistrationFormPreviewPopWidget({
    required this.cusRegData,
  });

  @override
  Widget build(BuildContext context) {
    print(  MediaQuery.of(context).size.height* 0.09);
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
                        _itemBuilder(star: AppStrings.star,textName: AppStrings.registrationType, textValue: cusRegData.interested.toString()),
                        _itemBuilder(star: AppStrings.star,textName: AppStrings.conversionPolicy, textValue: cusRegData.acceptConversionPolicy.toString()),
                        _itemBuilder(star: AppStrings.star,textName: AppStrings.fittingCost, textValue: cusRegData.acceptExtraFittingCost.toString()),
                        _itemBuilder(star: AppStrings.star,textName: AppStrings.mdpeAllow, textValue: cusRegData.societyAllowedMdpe.toString()),
                        _itemBuilder(star: AppStrings.star,textName: AppStrings.chargeArea, textValue: cusRegData.chargeId.toString()),
                        _itemBuilder(star: AppStrings.star,textName: AppStrings.area, textValue: cusRegData.areaId.toString()),
                        _itemBuilder(star: AppStrings.star,textName: AppStrings.mobileNo, textValue: cusRegData.mobileNumber.toString()),
                        _itemBuilder(textName: AppStrings.alternateMobileNo, textValue: cusRegData.alternateMobile.toString()),
                        _itemBuilder(star: AppStrings.star,textName: AppStrings.firstName, textValue: cusRegData.firstName.toString()),
                        _itemBuilder(textName: AppStrings.middleName, textValue: cusRegData.middleName.toString()),
                        _itemBuilder(star: AppStrings.star,textName: AppStrings.lastName, textValue: cusRegData.lastName.toString()),
                        _itemBuilder(star:cusRegData.interested != "Future Registration" ? AppStrings.star : "",textName: AppStrings.guardianType, textValue: cusRegData.guardianType.toString()),
                        _itemBuilder(star:cusRegData.interested != "Future Registration" ? AppStrings.star : "",textName: AppStrings.guardianName, textValue: cusRegData.guardianName.toString()),
                        _itemBuilder(textName: AppStrings.emailAddress, textValue: cusRegData.emailId.toString()),
                        _itemBuilder(star: AppStrings.star,textName: AppStrings.propertyCategory, textValue: cusRegData.propertyCategoryId.toString()),
                        _itemBuilder(star: AppStrings.star,textName: AppStrings.propertyClass, textValue: cusRegData.propertyClassId.toString()),
                        _itemBuilder(textName: AppStrings.buildingNumber, textValue: cusRegData.buildingNumber.toString()),
                        _itemBuilder(star: AppStrings.star,textName: AppStrings.houseNumber, textValue: cusRegData.houseNumber.toString()),
                        _itemBuilder(star: AppStrings.star,textName: AppStrings.colony, textValue: cusRegData.colonySocietyApartment.toString()),
                        _itemBuilder(star: AppStrings.star,textName: AppStrings.streetName, textValue: cusRegData.streetName.toString()),
                        _itemBuilder(textName: AppStrings.town, textValue: cusRegData.town.toString()),
                        _itemBuilder(star: AppStrings.star,textName: AppStrings.district, textValue: cusRegData.districtId == null ? "-" : cusRegData.districtId.toString()),
                        _itemBuilder(star: AppStrings.star,textName: AppStrings.pinCode, textValue: cusRegData.pinCode == null ? "-" : cusRegData.pinCode.toString()),
                        _itemBuilder(textName: AppStrings.noOfKitchen, textValue: cusRegData.noOfKitchen == null ? "" : cusRegData.noOfKitchen.toString()),
                        _itemBuilder(textName: AppStrings.noOfBathroom, textValue: cusRegData.noOfBathroom == null ? "-" : cusRegData.noOfBathroom.toString()),
                        _itemBuilder(textName: AppStrings.fuel, textValue: cusRegData.existingCookingFuel == null ? "-" : cusRegData.existingCookingFuel.toString()),
                        _itemBuilder(textName: AppStrings.noOfFamilyMembers, textValue: cusRegData.noOfFamilyMembers == null ? "-" : cusRegData.noOfFamilyMembers.toString()),
                        _itemBuilder(star: AppStrings.star,textName: AppStrings.locationLat, textValue: cusRegData.latitude == null ? "-" : cusRegData.latitude.toString()),
                        _itemBuilder(star: AppStrings.star,textName: AppStrings.locationLong, textValue: cusRegData.longitude == null ? "-" : cusRegData.longitude.toString()),
                        _itemBuilder(star: AppStrings.star,textName: AppStrings.idProof, textValue: cusRegData.kycDocument1 == null ? "-" : cusRegData.kycDocument1.toString()),
                        _itemBuilder(star: AppStrings.star,textName: AppStrings.idProofNo, textValue: cusRegData.kycDocument1Number == null ? "" : cusRegData.kycDocument1Number.toString()),
                        _divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _itemImgBuilder(star: AppStrings.star,textName: AppStrings.idProofFront, imagePath: cusRegData.documentUploads1 == null ? "" : cusRegData.documentUploads1.toString()),
                            _itemImgBuilder(textName: AppStrings.idProofBack, imagePath: cusRegData.backside1 == null ? "" : cusRegData.backside1.toString()),
                          ],
                        ),
                        _itemBuilder(star: AppStrings.star,textName: AppStrings.addProof, textValue: cusRegData.kycDocument2 == null ? "-" : cusRegData.kycDocument2.toString()),
                        _itemBuilder(star: AppStrings.star,textName: AppStrings.addProofNo, textValue: cusRegData.kycDocument2Number == null ? "" : cusRegData.kycDocument2Number.toString()),
                        _divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _itemImgBuilder(
                                star: cusRegData.interested != "Future Registration" ?AppStrings.star : "",
                                textName: AppStrings.addProofFront, imagePath: cusRegData.documentUploads2 == null ? "" : cusRegData.documentUploads2.toString()),
                            _itemImgBuilder(textName: AppStrings.addProofBack, imagePath: cusRegData.backside2 == null ? "" : cusRegData.backside2.toString()),
                          ],
                        ),
                        if(cusRegData.interested != "Future Registration")...[
                          _itemBuilder(textName: AppStrings.ownershipProperty, textValue: cusRegData.kycDocument3 == null ? "-" : cusRegData.kycDocument3.toString()),
                          _divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _itemImgBuilder(textName: AppStrings.customerImg, imagePath: cusRegData.customerPhoto == null ? "" : cusRegData.customerPhoto.toString()),
                              cusRegData.kycDocument3 == "Rented"
                                  ? _itemImgBuilder(textName: AppStrings.houseImg, imagePath: cusRegData.housePhoto == null ? "-" : cusRegData.housePhoto.toString())
                                  : _itemImgBuilder(star: AppStrings.star,textName: AppStrings.nocDoc, imagePath: cusRegData.documentUploads3 == null ? "" : cusRegData.documentUploads3.toString()),
                            ],
                          ),
                          _divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              cusRegData.kycDocument3 == "Rented"
                                  ? _itemImgBuilder(textName: AppStrings.houseImg, imagePath: cusRegData.housePhoto == null ? "-" : cusRegData.housePhoto.toString())
                                  : Container(),
                            ],
                          ),
                          _itemBuilder(textName: AppStrings.depositStatus, textValue: cusRegData.initialDepositeStatus == null ? "-" : cusRegData.initialDepositeStatus.toString()),
                          _itemBuilder(textName: AppStrings.depositType, textValue: cusRegData.depositType == null ? "-" : cusRegData.depositType.toString()),
                          _itemBuilder(textName: AppStrings.depositAmt, textValue: cusRegData.depositTypeAmount == null ? "-" : cusRegData.depositTypeAmount.toString()),
                          _itemBuilder(textName: AppStrings.modeDeposit, textValue: cusRegData.modeOfDeposite == null ? "-" : cusRegData.modeOfDeposite.toString()),
                          if (cusRegData.modeOfDeposite == "Cheque") ...[
                            _itemBuilder(textName: AppStrings.chqNo, textValue: cusRegData.chequeNumber.toString()),
                            _itemBuilder(textName: AppStrings.chqDate, textValue: cusRegData.chequeDepositDate.toString()),
                            _itemBuilder(textName: AppStrings.chqBank, textValue: cusRegData.payementBankName.toString()),
                            _itemBuilder(textName: AppStrings.chequeAccountNo, textValue: cusRegData.chequeBankAccount.toString()),
                            _itemBuilder(textName: AppStrings.chequeMICRNo, textValue: cusRegData.chequeMicrNo.toString()),
                            _itemImgBuilder(star: AppStrings.star,textName: AppStrings.chqPhoto, imagePath: cusRegData.chequePhoto.toString()),
                          ]
                        ],
                        _divider(),
                        SizedBox(
                          height:MediaQuery.of(context).size.height* 0.09
                        )
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Customer Detail",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold, color: AppColor.appBlueColor),
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

  Widget _itemBuilder({String? star, String? textName, String? textValue}) {
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

  Widget _itemImgBuilder({String? star, required String textName, required String imagePath}) {
    return ImageWidget(
      star: star,
      label: textName,
      child: imagePath.isEmpty || imagePath == "" || imagePath == "null" ?_localBorderImg() : _fileImage(fileImage: File(imagePath)),
      onTap: (){},
    );
  }
Widget _divider(){
    return Divider(
      color: AppColor.appBlueColor,
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
      bottom: -12.0,
     // top: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / 2.2,
            child: dataState.isSaveLoader == false
                ? ButtonWidget(
                text: AppStrings.save,
                onPressed: () {
                  BlocProvider.of<CustomRegistrationFormBloc>(context)
                      .add(CustomRegistrationFormSaveLocalDataEvent(context: context));
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


}
