import 'package:flutter/material.dart';
import 'package:pbg_app/ExportFile/export_file.dart';
import 'package:pbg_app/features/RegistrationForm/presentation/widgets/pop_widget.dart';

class RegistrationPreviewPage extends StatelessWidget {
  final RegistrationFormBloc bloc;

  const RegistrationPreviewPage({super.key, required this.bloc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBarWidget(boolLeading: true, title: "Customer Detail"),
      ),
      body: Container(
        color: AppColor.white,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _buildPreviewItems(context),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 8,
              right: 8,
              child: _buildBottomActions(context),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildPreviewItems(BuildContext context) {
    final bool showPropertyDropdowns =
        bloc.isAGCL || bloc.regTypeValue == "Registration For LMC";
    String _regVal(RegiFormUpdateDataState s) =>
        bloc.isAGCL
            ? (s.regFromVal?.name?.toString() ?? "")
            : (s.registrationTypeValue?.value?.toString() ?? "");

    return [
      if (!bloc.isAGCL) ...[
        _buildPopItem(AppString.registrationType, bloc.regTypeValue, context),
      ],
      if (bloc.isAGCL) ...[
        _buildPopItem(
          AppString.registrationFrom,
          bloc.regFromVal.name,
          context,
        ),
      ],
      _regVal == "Future Registration"
          ? PopWidget.itemBuilder(
            context: context,
            textName: AppString.reasonRegistration,
            textValue: bloc.reasonRegistrationController.text,
          )
          : SizedBox.shrink(),
      _regVal == "PNGRB"
          ? PopWidget.itemBuilder(
            context: context,
            textName: AppString.applicationNumber,
            textValue: bloc.applicationNumberController.text,
          )
          : SizedBox.shrink(),
      _buildPopItem(
        AppString.conversionPolicy,
        bloc.conversionPolicyValue.value,
        context,
      ),
      _buildPopItem(
        AppString.fittingCost,
        bloc.extraFittingValue.value,
        context,
      ),
      _regVal == "Registration For LMC"
          ? _buildPopItem(
            AppString.mdpeAllow,
            bloc.societyAllowValue.value,
            context,
          )
          : SizedBox.shrink(),
      _buildPopItem(
        AppString.chargeArea,
        bloc.chargeAreaValue.chargeAreaName,
        context,
      ),
      _buildPopItem(AppString.titleName, bloc.nameTitleValue.name, context),
      _buildPopItem(AppString.area, bloc.areaValue.areaName, context),
      _buildPopItem(AppString.mobileNo, bloc.mobileController.text, context),
      _buildPopItem(
        AppString.alternateMobileNo,
        bloc.altMobileController.text,
        context,
      ),
      !bloc.isAGCL
          ? SizedBox.shrink()
          : PopWidget.itemBuilder(
            context: context,
            star: AppString.star,
            textName: AppString.titleName,
            textValue:
                bloc.nameTitleValue.id == null ? "" : bloc.nameTitleValue.name,
          ),
      _buildPopItem(AppString.firstName, bloc.firstController.text, context),
      _buildPopItem(AppString.middleName, bloc.middleController.text, context),
      _buildPopItem(AppString.lastName, bloc.lastController.text, context),
      !bloc.isAGCL
          ? SizedBox.shrink()
          : _buildPopItem(AppString.dob, bloc.dobController.text, context),
      PopWidget.itemBuilder(
        context: context,
        star: _regVal != "Future Registration" ? AppString.star : "",
        textName: AppString.guardianType,
        textValue:
            bloc.guardianTypeValue.key == null
                ? ""
                : bloc.guardianTypeValue.value,
      ),
      PopWidget.itemBuilder(
        context: context,
        star: _regVal != "Future Registration" ? AppString.star : "",
        textName: AppString.guardianName,
        textValue:
            bloc.guardianNameController.text.isEmpty
                ? ""
                : bloc.guardianNameController.text,
      ),
      _buildPopItem(
        AppString.emailAddress,
        bloc.emailIdController.text,
        context,
      ),
      showPropertyDropdowns
          ? _buildPopItem(
            AppString.propertyCategory,
            bloc.propertyCategoryValue.name,
            context,
          )
          : SizedBox.shrink(),
      showPropertyDropdowns
          ? _buildPopItem(
            AppString.propertyClass,
            bloc.propertyClassValue.name,
            context,
          )
          : SizedBox.shrink(),
      _buildPopItem(
        AppString.houseHoldType,
        bloc.houseHoldTypeValue.name,
        context,
      ),
      !bloc.isAGCL
          ? SizedBox.shrink()
          : _buildPopItem(
            AppString.floorNumber,
            bloc.floorNumberController.text,
            context,
          ),
      _buildPopItem(
        AppString.buildingNumber,
        bloc.buildingNumberController.text,
        context,
      ),
      _buildPopItem(
        AppString.houseNumber,
        bloc.houseNumberController.text,
        context,
      ),
      _buildPopItem(AppString.colony, bloc.colonyController.text, context),
      _buildPopItem(AppString.streetName, bloc.streetController.text, context),
      _buildPopItem(AppString.town, bloc.townController.text, context),
      _buildPopItem(
        AppString.district,
        bloc.allDistrictValue.districtName,
        context,
      ),
      _buildPopItem(
        AppString.nearestLandmark,
        bloc.nearestLandmarkController.text,
        context,
      ),
      _buildPopItem(
        AppString.wardNumber,
        bloc.wardNumberController.text,
        context,
      ),
      _buildPopItem(
        AppString.premiseType,
        bloc.premiseTypeController.text,
        context,
      ),
      _buildPopItem(AppString.pinCode, bloc.pinCodeController.text, context),
      _buildPopItem(
        AppString.noOfKitchen,
        bloc.numberKitchenController.text,
        context,
      ),
      _buildPopItem(
        AppString.noOfBathroom,
        bloc.numberBathroomController.text,
        context,
      ),
      _buildPopItem(
        AppString.fuel,
        bloc.existingCookingFuelValue.value,
        context,
      ),
      _buildPopItem(
        AppString.noOfFamilyMembers,
        bloc.familyMemberController.text,
        context,
      ),
      _buildPopItem(AppString.locationLat, bloc.latController.text, context),
      _buildPopItem(AppString.locationLong, bloc.longController.text, context),
      _buildPopItem(AppString.idProof, bloc.kycDoc1Value.value, context),
      _buildPopItem(
        AppString.idProofNo,
        bloc.kyc1NumberController.text,
        context,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ImageWidget(
              star: AppString.star,
              title: AppString.idProofFront,
              imgFile:
                  bloc.idFrontPath.path.isEmpty
                      ? File("")
                      : File(bloc.idFrontPath.path),
              onPressed: () {},
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: ImageWidget(
              title: AppString.idProofBack,
              imgFile:
                  bloc.idBackPath.path.isEmpty
                      ? File("")
                      : File(bloc.idBackPath.path),
              onPressed: () {},
            ),
          ),
        ],
      ),
      PopWidget.divider(context: context),
      PopWidget.itemBuilder(
        context: context,
        star: _regVal != "Future Registration" ? AppString.star : "",
        textName: AppString.addProof,
        textValue: bloc.kycDoc2Value.key == "" ? "-" : bloc.kycDoc2Value.value,
      ),
      PopWidget.itemBuilder(
        context: context,
        star: _regVal != "Future Registration" ? AppString.star : "",
        textName: AppString.addProofNo,
        textValue:
            bloc.kyc2NumberController.text.isEmpty
                ? ""
                : bloc.kyc2NumberController.text,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ImageWidget(
              star: _regVal != "Future Registration" ? AppString.star : "",
              title: AppString.addProofFront,
              imgFile:
                  bloc.addFrontPath.path.isEmpty
                      ? File("")
                      : File(bloc.addFrontPath.path),
              onPressed: () {},
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: ImageWidget(
              title: AppString.addProofBack,
              imgFile:
                  bloc.addBackPath.path.isEmpty
                      ? File("")
                      : File(bloc.addBackPath.path),
              onPressed: () {},
            ),
          ),
        ],
      ),
      PopWidget.divider(context: context),
      if (_regVal != "Future Registration") ...[
        bloc.isAGCL
            ? PopWidget.itemBuilder(
              context: context,
              textName: AppString.ownershipProof,
              textValue:
                  bloc.addressProofValue.key == null
                      ? "-"
                      : bloc.addressProofValue.value,
            )
            : PopWidget.itemBuilder(
              context: context,
              textName: AppString.ownershipProperty,
              textValue:
                  bloc.kycDoc3Value.key == null ? "-" : bloc.kycDoc3Value.value,
            ),
        PopWidget.itemBuilder(
          context: context,
          textName:
              bloc.isAGCL
                  ? AppString.ownershipProofNo3
                  : AppString.ownershipProperty,
          textValue:
              bloc.kyc3NumberController.text.isEmpty
                  ? ""
                  : bloc.kyc3NumberController.text,
        ),
        bloc.isAGCL
            ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ImageWidget(
                    title: AppString.ownershipProofFront,
                    imgFile:
                        bloc.nocFrontPath.path.isEmpty
                            ? File("")
                            : File(bloc.nocFrontPath.path),
                    onPressed: () {},
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ImageWidget(
                    title: AppString.ownershipProofBack,
                    imgFile:
                        bloc.nocBackPath.path.isEmpty
                            ? File("")
                            : File(bloc.nocBackPath.path),
                    onPressed: () {},
                  ),
                ),
              ],
            )
            : SizedBox.shrink(),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ImageWidget(
                title: AppString.customerImg,
                imgFile:
                    bloc.uploadCustomerPath.path.isEmpty
                        ? File("")
                        : File(bloc.uploadCustomerPath.path),
                onPressed: () {},
              ),
            ),
            const SizedBox(width: 8),
            if (bloc.kycDoc3Value.value == "Rented") ...[
              Expanded(
                child: ImageWidget(
                  star: AppString.star,
                  title: AppString.nocDoc,
                  imgFile:
                      bloc.nocDocPath.path.isEmpty
                          ? File("")
                          : File(bloc.nocDocPath.path),
                  onPressed: () {},
                ),
              ),
              const SizedBox(width: 8),
            ],
            Expanded(
              child: ImageWidget(
                title: AppString.houseImg,
                imgFile:
                    bloc.uploadHousePath.path.isEmpty
                        ? File("")
                        : File(bloc.uploadHousePath.path),
                onPressed: () {},
              ),
            ),
          ],
        ),
        PopWidget.divider(context: context),
        _buildPopItem(AppString.meterType, bloc.meterTypeVal.name, context),
        PopWidget.itemBuilder(
          context: context,
          textName: AppString.initDepositStatus,
          textValue:
              bloc.initialDepositStatusValue.key == null
                  ? "-"
                  : bloc.initialDepositStatusValue.value,
        ),
        bloc.initialDepositStatusValue.value == "No"
            ? PopWidget.itemBuilder(
              context: context,
              textName: AppString.reasonDeposit,
              textValue: bloc.reasonDepositStsController.text,
            )
            : Container(),
        PopWidget.itemBuilder(
          context: context,
          textName: AppString.schemeType,
          textValue:
              bloc.schemeTypeValue.depositTypesId == null
                  ? "-"
                  : bloc.schemeTypeValue.depositName,
        ),
        PopWidget.itemBuilder(
          context: context,
          textName: AppString.schemeAmt,
          textValue:
              bloc.schemeAmountController.text.isEmpty
                  ? "-"
                  : bloc.schemeAmountController.text,
        ),
        bloc.isAGCL
            ? SizedBox.shrink()
            : PopWidget.itemBuilder(
              context: context,
              textName: AppString.modeDeposit,
              textValue:
                  bloc.modeDepositValue.key == null
                      ? "-"
                      : bloc.modeDepositValue.value,
            ),
        if (bloc.modeDepositValue.key == "1") ...[
          PopWidget.itemBuilder(
            context: context,
            textName: AppString.chqNo,
            textValue:
                bloc.chequeNoController.text.isEmpty
                    ? "-"
                    : bloc.chequeNoController.text,
          ),
          PopWidget.itemBuilder(
            context: context,
            textName: AppString.chqDate,
            textValue:
                bloc.chequeDateController.text.isEmpty
                    ? ""
                    : bloc.chequeDateController.text,
          ),
          PopWidget.itemBuilder(
            context: context,
            textName: AppString.chqBank,
            textValue:
                bloc.paymentBankNameValue.isEmpty
                    ? ""
                    : bloc.paymentBankNameValue.toString(),
          ),
          PopWidget.itemBuilder(
            context: context,
            textName: AppString.chequeAccountNo,
            textValue:
                bloc.chequeAccountNoController.text.isEmpty
                    ? ""
                    : bloc.chequeAccountNoController.text,
          ),
          PopWidget.itemBuilder(
            context: context,
            textName: AppString.chequeMICRNo,
            textValue:
                bloc.chequeMicrNoController.text.isEmpty
                    ? ""
                    : bloc.chequeMicrNoController.text,
          ),
          ImageWidget(
            star: AppString.star,
            title: AppString.chqPhoto,
            imgFile:
                bloc.chequePath.path.isEmpty
                    ? File("")
                    : File(bloc.chequePath.path),
            onPressed: () {},
          ),
        ],
      ],
      SizedBox(height: MediaQuery.of(context).size.height * 0.09),
    ];
  }

  Widget _buildPopItem(String label, String? value, BuildContext context) {
    return PopWidget.itemBuilder(
      context: context,
      star: (value?.isNotEmpty ?? false) ? AppString.star : "",
      textName: label,
      textValue: value ?? "",
    );
  }

  Widget _buildBottomActions(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        BlocBuilder<RegistrationFormBloc, RegistrationFormState>(
          bloc: bloc,
          builder: (context, state) {
            final bool loading =
                state is RegiFormUpdateDataState && state.isSaveLoader;
            return loading
                ? DottedLoaderWidget()
                : ButtonWidget(
                  text: AppString.save,
                  onPressed: () {
                    bloc.add(
                      RegistrationFormSaveLocalDataEvent(context: context),
                    );
                  },
                );
          },
        ),
        ButtonWidget(
          text: AppString.edit,
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
  }
}
