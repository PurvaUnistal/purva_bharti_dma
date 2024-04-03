import 'package:flutter/material.dart';
import 'package:pbg_app/ExportFile/export_file.dart';
import 'package:pbg_app/common/HiveDatabase/hive_database.dart';


class ViewSyncRecordHelper {


  static Future<dynamic> leadSaveInServer({required BuildContext context}) async {
    if (HiveDataBase.customerRegBox!.values.isNotEmpty) {
      if (await isInternetConnected() == true) {
        int count = 0;
        log("Data Length Check ============== ${HiveDataBase.customerRegBox!.values.length}");
        List<SaveCustomerRegistrationOfflineModel> saveCustRegOfflineModelHiveList = HiveDataBase.customerRegBox!.values.toList();
        for (int i = 0; i < saveCustRegOfflineModelHiveList.length; i++) {
          SaveCustomerRegistrationOfflineModel saveCustRegOfflineModel = saveCustRegOfflineModelHiveList[i];
          SaveCusRegData saveCusRegDataRequestModel = SaveCusRegData(
            schema: saveCustRegOfflineModel.schema,
            dmaUserId: saveCustRegOfflineModel.dmaUserId,
            dmaUserName: saveCustRegOfflineModel.dmaUserName,
            interested: saveCustRegOfflineModel.interested,
            acceptExtraFittingCost: saveCustRegOfflineModel.acceptExtraFittingCost,
            acceptConversionPolicy: saveCustRegOfflineModel.acceptConversionPolicy,
            societyAllowedMdpe: saveCustRegOfflineModel.societyAllowedMdpe,
            chargeId: saveCustRegOfflineModel.chargeArea,
            areaId: saveCustRegOfflineModel.areaId,
            mobileNumber: saveCustRegOfflineModel.mobileNumber,
            firstName: saveCustRegOfflineModel.firstName,
            middleName: saveCustRegOfflineModel.middleName,
            lastName: saveCustRegOfflineModel.lastName,
            guardianType: saveCustRegOfflineModel.guardianType,
            guardianName: saveCustRegOfflineModel.guardianName,
            emailId: saveCustRegOfflineModel.emailId,
            propertyCategoryId: saveCustRegOfflineModel.propertyCategoryId,
            propertyClassId: saveCustRegOfflineModel.propertyClassId,
            buildingNumber: saveCustRegOfflineModel.buildingNumber,
            houseNumber: saveCustRegOfflineModel.houseNumber,
            colonySocietyApartment: saveCustRegOfflineModel.colonySocietyApartment,
            streetName: saveCustRegOfflineModel.streetName,
            town: saveCustRegOfflineModel.town,
            districtId: saveCustRegOfflineModel.districtId,
            pinCode: saveCustRegOfflineModel.pinCode,
            residentStatus: saveCustRegOfflineModel.residentStatus,
            noOfKitchen: saveCustRegOfflineModel.noOfKitchen,
            noOfFamilyMembers: saveCustRegOfflineModel.noOfFamilyMembers,
            noOfBathroom: saveCustRegOfflineModel.noOfBathroom,
            existingCookingFuel: saveCustRegOfflineModel.existingCookingFuel,
            latitude: saveCustRegOfflineModel.latitude,
            longitude: saveCustRegOfflineModel.longitude,
            nearestLandmark: saveCustRegOfflineModel.nearestLandmark,
            kycDocument1: saveCustRegOfflineModel.kycDocument1,
            kycDocument1Number: saveCustRegOfflineModel.kycDocument1Number,
            kycDocument2: saveCustRegOfflineModel.kycDocument2,
            kycDocument2Number: saveCustRegOfflineModel.kycDocument2Number,
            kycDocument3: saveCustRegOfflineModel.kycDocument3,
            kycDocument3Number: saveCustRegOfflineModel.kycDocument3Number,
            eBillingModel: saveCustRegOfflineModel.eBillingModel,
            bankNameOfBank: saveCustRegOfflineModel.bankNameOfBank,
            bankAccountNumber: saveCustRegOfflineModel.bankAccountNumber,
            bankIfscCode: saveCustRegOfflineModel.bankIfscCode,
            bankAddress: saveCustRegOfflineModel.bankAddress,
            initialDepositeStatus: saveCustRegOfflineModel.initialDepositeStatus,
            depositType: saveCustRegOfflineModel.depositeType,
            depositTypeAmount: saveCustRegOfflineModel.depositTypeAmount,
            modeOfDeposite: saveCustRegOfflineModel.modeOfDeposite,
            chequeNumber: saveCustRegOfflineModel.chequeNumber,
            chequeDepositDate: saveCustRegOfflineModel.chequeDepositDate,
            payementBankName: saveCustRegOfflineModel.payementBankName,
            chequeBankAccount: saveCustRegOfflineModel.chequeBankAccount,
            chequeMicrNo: saveCustRegOfflineModel.chequeMicrAccount,
          );
          try {
            log("updateCustomerRequestModel--->" + saveCusRegDataRequestModel.toJson().toString());
            String url = AppUrl.saveCustomerRegistrationOffline;
            var res = await ApiServer.postDataWithFile(
              body: saveCusRegDataRequestModel.toJson(), context: context, urlEndPoint: url,);
            if (res != null) {
              count++;
              Utils.successSnackBar(res, context);
              return saveCustomerRegistrationModelFromJson(res);
            }
          } catch (e) {
            log("catch-->${e.toString()}");
            Utils.errorSnackBar(e.toString(), context);
            return null;
          }
        }
        for (int i = count - 1; i >= 0; i--) {
          saveCustRegOfflineModelHiveList.removeAt(i);
          await HiveDataBase.customerRegBox!.delete(i);
        }
        if (count == saveCustRegOfflineModelHiveList.length) {
          await HiveDataBase.customerRegBox!.clear();
        }
        print("ASDFGHNJGFDS-->${saveCustRegOfflineModelHiveList.length}");
        saveCustRegOfflineModelHiveList.removeRange(0, count);
        //   CustomToast.showToast("Data saved successfully");
      }
    } else {
      Utils.errorSnackBar("No Internet Connection", context);
      return null;
    }
  }

  static Future<dynamic> updateCustomerFormInLocalDatabase({required BuildContext context, required SaveCusRegData saveCusRegData}) async {
    try {
      SaveCustomerRegistrationOfflineModel _custRegiDataModel = SaveCustomerRegistrationOfflineModel(
        dmaUserName: saveCusRegData.dmaUserName.toString(),
        dmaUserId: saveCusRegData.dmaUserId.toString(),
        schema: saveCusRegData.schema.toString(),
        interested: saveCusRegData.interested.toString(),
        acceptConversionPolicy: saveCusRegData.acceptConversionPolicy.toString(),
        acceptExtraFittingCost: saveCusRegData.acceptExtraFittingCost.toString(),
        societyAllowedMdpe: saveCusRegData.societyAllowedMdpe.toString(),
        chargeArea: saveCusRegData.chargeId.toString(),
        areaId: saveCusRegData.areaId.toString(),
        mobileNumber: saveCusRegData.mobileNumber.toString(),
        firstName: saveCusRegData.firstName.toString(),
        middleName: saveCusRegData.middleName.toString(),
        lastName: saveCusRegData.lastName.toString(),
        guardianType: saveCusRegData.guardianType.toString(),
        guardianName: saveCusRegData.guardianName.toString(),
        emailId: saveCusRegData.emailId.toString(),
        propertyCategoryId: saveCusRegData.propertyCategoryId.toString(),
        propertyClassId: saveCusRegData.propertyClassId.toString(),
        buildingNumber: saveCusRegData.buildingNumber.toString(),
        houseNumber: saveCusRegData.houseNumber.toString(),
        colonySocietyApartment: saveCusRegData.colonySocietyApartment.toString(),
        streetName: saveCusRegData.streetName.toString(),
        town: saveCusRegData.town.toString(),
        districtId: saveCusRegData.districtId.toString(),
        pinCode: saveCusRegData.pinCode.toString(),
        residentStatus: saveCusRegData.residentStatus.toString(),
        noOfKitchen: saveCusRegData.noOfKitchen.toString(),
        noOfBathroom: saveCusRegData.noOfBathroom.toString(),
        noOfFamilyMembers: saveCusRegData.noOfFamilyMembers.toString(),
        existingCookingFuel: saveCusRegData.existingCookingFuel.toString(),
        latitude: saveCusRegData.latitude.toString(),
        longitude: saveCusRegData.longitude.toString(),
        nearestLandmark: saveCusRegData.nearestLandmark.toString(),
        kycDocument1: saveCusRegData.kycDocument1.toString(),
        kycDocument1Number: saveCusRegData.kycDocument1Number.toString(),
        kycDocument2: saveCusRegData.kycDocument2.toString(),
        kycDocument2Number: saveCusRegData.kycDocument2Number.toString(),
        kycDocument3: saveCusRegData.kycDocument3.toString(),
        kycDocument3Number: saveCusRegData.kycDocument3Number.toString(),
        eBillingModel: saveCusRegData.eBillingModel.toString(),
        bankNameOfBank: saveCusRegData.bankNameOfBank.toString(),
        bankAccountNumber: saveCusRegData.bankAccountNumber.toString(),
        bankIfscCode: saveCusRegData.bankIfscCode.toString(),
        bankAddress: saveCusRegData.bankAddress.toString(),
        initialDepositeStatus: saveCusRegData.initialDepositeStatus.toString(),
        depositeType: saveCusRegData.depositType.toString(),
        depositTypeAmount: saveCusRegData.depositTypeAmount.toString(),
        modeOfDeposite: saveCusRegData.modeOfDeposite.toString(),
        chequeNumber: saveCusRegData.chequeNumber.toString(),
        chequeDepositDate: saveCusRegData.chequeDepositDate.toString(),
        payementBankName: saveCusRegData.payementBankName.toString(),
        chequeBankAccount: saveCusRegData.chequeBankAccount.toString(),
        chequeMicrAccount: saveCusRegData.chequeMicrNo.toString(),
        documentUploadsPhoto1: saveCusRegData.documentUploads1.toString(),
        documentUploadsPhoto2: saveCusRegData.documentUploads2.toString(),
        documentUploadsPhoto3: saveCusRegData.documentUploads3.toString(),
        backSidePhoto1: saveCusRegData.backside1.toString(),
        backSidePhoto2: saveCusRegData.backside2.toString(),
        backSidePhoto3: saveCusRegData.backside3.toString(),
        uploadCustomerPhoto: saveCusRegData.uploadCustomerPhoto.toString(),
        uploadHousePhoto: saveCusRegData.uploadHousePhoto.toString(),
        customerConsentPhoto: saveCusRegData.customerConsent.toString(),
        ownerConsent: saveCusRegData.ownerConsent.toString(),
        canceledChequePhoto: saveCusRegData.canceledCheque.toString(),
        chequePhoto: saveCusRegData.chequePhoto.toString(),
        reasonForHold: saveCusRegData.nearestLandmark.toString(),
        noInitialDepositStatusReason: saveCusRegData.noInitialDepositStatusReason.toString(),
        modeDepositValue: saveCusRegData.modeOfDeposite,
        ownerConsentText: "",
        isDepositCheq: false,
      );
      print("HEllo");
      var mmm = await HiveDataBase.customerRegBox!.values.toList().length;
      print("mmm-->${mmm}");
      if (HiveDataBase.customerRegBox!.values.isNotEmpty) {
        print("mmmLength-->${mmm.toString().length}");
        return await HiveDataBase.customerRegBox!.put(mmm, _custRegiDataModel);
      } else {
        Utils.errorSnackBar('Error !!! \nPlease Upload Previous record', context);
        return null;
      }
    } catch (e) {
      CustomToast.showToast(e.toString());
      return null;
    }
  }


  static Future<dynamic> deleteData({required BuildContext context, required int index, required String mobileNo}) async {
    if (HiveDataBase.customerRegBox!.values.isNotEmpty) {
      log("Data Length ============== ${HiveDataBase.customerRegBox!.values.length}");
      List<SaveCustomerRegistrationOfflineModel> saveCustRegOfflineModelHiveList = HiveDataBase.customerRegBox!.values.toList();
      mobileNo = saveCustRegOfflineModelHiveList.removeAt(index).mobileNumber!;
      saveCustRegOfflineModelHiveList.removeAt(index);
     await HiveDataBase.customerRegBox!.delete(index);
    }
    return null;
  }

  static Future<dynamic> updateData({required BuildContext context, required int index, required String mobileNo}) async {

    return null;
  }

  static Future<bool> isInternetConnected() async {
    bool isConnect = false;
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        isConnect = true;
      }
    } on SocketException catch (_) {}

    return isConnect;
  }
}
