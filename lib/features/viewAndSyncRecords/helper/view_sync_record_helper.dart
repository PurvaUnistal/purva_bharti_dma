import 'package:flutter/material.dart';
import 'package:pbg_app/ExportFile/export_file.dart';
import 'package:pbg_app/common/HiveDatabase/hive_database.dart';
import 'package:pbg_app/features/viewAndSyncRecords/domain/Model/CustRegSyncModel.dart';


class ViewSyncRecordHelper {


  static Future<dynamic> leadSaveInServer({required BuildContext context}) async {
    if (HiveDataBase.custRegSyncBox!.values.isNotEmpty) {
      if (await isInternetConnected() == true) {
        int count = 0;
        log("Data Length Check ============== ${HiveDataBase.custRegSyncBox!.values.length}");
        List<CustRegSync> saveCustRegOfflineModelHiveList = HiveDataBase.custRegSyncBox!.values.toList();
        for (int i = 0; i < saveCustRegOfflineModelHiveList.length; i++) {
          CustRegSync custRegSyncStore = saveCustRegOfflineModelHiveList[i];
          CustRegSync custRegSyncAdd = CustRegSync(
            dmaUserName: custRegSyncStore.dmaUserName.toString(),
            dmaUserId: custRegSyncStore.dmaUserId.toString(),
            schema: custRegSyncStore.schema.toString(),
            interested: custRegSyncStore.interested.toString(),
            acceptConversionPolicy: custRegSyncStore.acceptConversionPolicy.toString(),
            acceptExtraFittingCost: custRegSyncStore.acceptExtraFittingCost.toString(),
            societyAllowedMdpe: custRegSyncStore.societyAllowedMdpe.toString(),
            chargeId: custRegSyncStore.chargeId.toString(),
            areaId: custRegSyncStore.areaId.toString(),
            mobileNumber: custRegSyncStore.mobileNumber.toString(),
            firstName: custRegSyncStore.firstName.toString(),
            middleName: custRegSyncStore.middleName.toString(),
            lastName: custRegSyncStore.lastName.toString(),
            guardianType: custRegSyncStore.guardianType.toString(),
            guardianName: custRegSyncStore.guardianName.toString(),
            emailId: custRegSyncStore.emailId.toString(),
            propertyCategoryId: custRegSyncStore.propertyCategoryId.toString(),
            propertyClassId: custRegSyncStore.propertyClassId.toString(),
            buildingNumber: custRegSyncStore.buildingNumber.toString(),
            houseNumber: custRegSyncStore.houseNumber.toString(),
            colonySocietyApartment: custRegSyncStore.colonySocietyApartment.toString(),
            streetName: custRegSyncStore.streetName.toString(),
            town: custRegSyncStore.town.toString(),
            districtId: custRegSyncStore.districtId.toString(),
            pinCode: custRegSyncStore.pinCode.toString(),
            residentStatus: custRegSyncStore.residentStatus.toString(),
            noOfKitchen: custRegSyncStore.noOfKitchen.toString(),
            noOfBathroom: custRegSyncStore.noOfBathroom.toString(),
            noOfFamilyMembers: custRegSyncStore.noOfFamilyMembers.toString(),
            existingCookingFuel: custRegSyncStore.existingCookingFuel.toString(),
            latitude: custRegSyncStore.latitude.toString(),
            longitude: custRegSyncStore.longitude.toString(),
            nearestLandmark: custRegSyncStore.nearestLandmark.toString(),
            kycDocument1: custRegSyncStore.kycDocument1.toString(),
            kycDocument1Number: custRegSyncStore.kycDocument1Number.toString(),
            kycDocument2: custRegSyncStore.kycDocument2.toString(),
            kycDocument2Number: custRegSyncStore.kycDocument2Number.toString(),
            kycDocument3: custRegSyncStore.kycDocument3.toString(),
            kycDocument3Number: custRegSyncStore.kycDocument3Number.toString(),
            eBillingModel: custRegSyncStore.eBillingModel.toString(),
            nameOfBank: custRegSyncStore.nameOfBank.toString(),
            bankAccountNumber: custRegSyncStore.bankAccountNumber.toString(),
            bankIfscCode: custRegSyncStore.bankIfscCode.toString(),
            bankAddress: custRegSyncStore.bankAddress.toString(),
            initialDepositStatus: custRegSyncStore.initialDepositStatus.toString(),
            depositType: custRegSyncStore.depositType.toString(),
            initialAmount: custRegSyncStore.initialAmount.toString(),
            modeOfDeposit: custRegSyncStore.modeOfDeposit.toString(),
            chequeNumber: custRegSyncStore.chequeNumber.toString(),
            chequeDepositDate: custRegSyncStore.chequeDepositDate.toString(),
            paymentBankName: custRegSyncStore.paymentBankName.toString(),
            chequeBankAccount: custRegSyncStore.chequeBankAccount.toString(),
            micr: custRegSyncStore.micr.toString(),
            documentUploads1: custRegSyncStore.documentUploads1.toString(),
            documentUploads2: custRegSyncStore.documentUploads2.toString(),
            documentUploads3: custRegSyncStore.documentUploads3.toString(),
            backside1: custRegSyncStore.backside1.toString(),
            backside2: custRegSyncStore.backside2.toString(),
            backside3: custRegSyncStore.backside3.toString(),
            uploadCustomerPhoto: custRegSyncStore.uploadCustomerPhoto.toString(),
            uploadHousePhoto: custRegSyncStore.uploadHousePhoto.toString(),
            customerConsent: custRegSyncStore.customerConsent.toString(),
            ownerConsent: custRegSyncStore.ownerConsent.toString(),
            canceledCheque: custRegSyncStore.canceledCheque.toString(),
            chequePhoto: custRegSyncStore.chequePhoto.toString(),
            noInitialDepositStatusReason: custRegSyncStore.noInitialDepositStatusReason.toString(),
            isDepositChq: false,
          );
          try {
            log("updateCustomerRequestModel--->" + custRegSyncAdd.toJson().toString());
            String url = AppUrl.saveCustomerRegistrationOffline;
            var res = await ApiServer.postDataWithFile(
              body: custRegSyncAdd.toJson(), context: context, urlEndPoint: url,);
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
          await HiveDataBase.custRegSyncBox!.delete(i);
        }
        if (count == saveCustRegOfflineModelHiveList.length) {
          await HiveDataBase.custRegSyncBox!.clear();
        }
        saveCustRegOfflineModelHiveList.removeRange(0, count);
      }
    } else {
      Utils.errorSnackBar("No Internet Connection", context);
      return null;
    }
  }

  static Future<dynamic> updateCustomerFormInLocalDatabase({required BuildContext context, required CustRegSync custRegSyncStore}) async {
    try {
      CustRegSync custRegSyncAdd = CustRegSync(
        dmaUserName: custRegSyncStore.dmaUserName.toString(),
        dmaUserId: custRegSyncStore.dmaUserId.toString(),
        schema: custRegSyncStore.schema.toString(),
        interested: custRegSyncStore.interested.toString(),
        acceptConversionPolicy: custRegSyncStore.acceptConversionPolicy.toString(),
        acceptExtraFittingCost: custRegSyncStore.acceptExtraFittingCost.toString(),
        societyAllowedMdpe: custRegSyncStore.societyAllowedMdpe.toString(),
        chargeId: custRegSyncStore.chargeId.toString(),
        areaId: custRegSyncStore.areaId.toString(),
        mobileNumber: custRegSyncStore.mobileNumber.toString(),
        firstName: custRegSyncStore.firstName.toString(),
        middleName: custRegSyncStore.middleName.toString(),
        lastName: custRegSyncStore.lastName.toString(),
        guardianType: custRegSyncStore.guardianType.toString(),
        guardianName: custRegSyncStore.guardianName.toString(),
        emailId: custRegSyncStore.emailId.toString(),
        propertyCategoryId: custRegSyncStore.propertyCategoryId.toString(),
        propertyClassId: custRegSyncStore.propertyClassId.toString(),
        buildingNumber: custRegSyncStore.buildingNumber.toString(),
        houseNumber: custRegSyncStore.houseNumber.toString(),
        colonySocietyApartment: custRegSyncStore.colonySocietyApartment.toString(),
        streetName: custRegSyncStore.streetName.toString(),
        town: custRegSyncStore.town.toString(),
        districtId: custRegSyncStore.districtId.toString(),
        pinCode: custRegSyncStore.pinCode.toString(),
        residentStatus: custRegSyncStore.residentStatus.toString(),
        noOfKitchen: custRegSyncStore.noOfKitchen.toString(),
        noOfBathroom: custRegSyncStore.noOfBathroom.toString(),
        noOfFamilyMembers: custRegSyncStore.noOfFamilyMembers.toString(),
        existingCookingFuel: custRegSyncStore.existingCookingFuel.toString(),
        latitude: custRegSyncStore.latitude.toString(),
        longitude: custRegSyncStore.longitude.toString(),
        nearestLandmark: custRegSyncStore.nearestLandmark.toString(),
        kycDocument1: custRegSyncStore.kycDocument1.toString(),
        kycDocument1Number: custRegSyncStore.kycDocument1Number.toString(),
        kycDocument2: custRegSyncStore.kycDocument2.toString(),
        kycDocument2Number: custRegSyncStore.kycDocument2Number.toString(),
        kycDocument3: custRegSyncStore.kycDocument3.toString(),
        kycDocument3Number: custRegSyncStore.kycDocument3Number.toString(),
        eBillingModel: custRegSyncStore.eBillingModel.toString(),
        nameOfBank: custRegSyncStore.nameOfBank.toString(),
        bankAccountNumber: custRegSyncStore.bankAccountNumber.toString(),
        bankIfscCode: custRegSyncStore.bankIfscCode.toString(),
        bankAddress: custRegSyncStore.bankAddress.toString(),
        initialDepositStatus: custRegSyncStore.initialDepositStatus.toString(),
        depositType: custRegSyncStore.depositType.toString(),
        initialAmount: custRegSyncStore.initialAmount.toString(),
        modeOfDeposit: custRegSyncStore.modeOfDeposit.toString(),
        chequeNumber: custRegSyncStore.chequeNumber.toString(),
        chequeDepositDate: custRegSyncStore.chequeDepositDate.toString(),
        paymentBankName: custRegSyncStore.paymentBankName.toString(),
        chequeBankAccount: custRegSyncStore.chequeBankAccount.toString(),
        micr: custRegSyncStore.micr.toString(),
        documentUploads1: custRegSyncStore.documentUploads1.toString(),
        documentUploads2: custRegSyncStore.documentUploads2.toString(),
        documentUploads3: custRegSyncStore.documentUploads3.toString(),
        backside1: custRegSyncStore.backside1.toString(),
        backside2: custRegSyncStore.backside2.toString(),
        backside3: custRegSyncStore.backside3.toString(),
        uploadCustomerPhoto: custRegSyncStore.uploadCustomerPhoto.toString(),
        uploadHousePhoto: custRegSyncStore.uploadHousePhoto.toString(),
        customerConsent: custRegSyncStore.customerConsent.toString(),
        ownerConsent: custRegSyncStore.ownerConsent.toString(),
        canceledCheque: custRegSyncStore.canceledCheque.toString(),
        chequePhoto: custRegSyncStore.chequePhoto.toString(),
        noInitialDepositStatusReason: custRegSyncStore.noInitialDepositStatusReason.toString(),
        isDepositChq: false,
      );
      print("HEllo");
      var mmm = await HiveDataBase.custRegSyncBox!.values.toList().length;
      print("mmm-->${mmm}");
      if (HiveDataBase.custRegSyncBox!.values.isNotEmpty) {
        print("mmmLength-->${mmm.toString().length}");
        return await HiveDataBase.custRegSyncBox!.put(mmm, custRegSyncAdd);
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
    if (HiveDataBase.custRegSyncBox!.values.isNotEmpty) {
      log("Data Length ============== ${HiveDataBase.custRegSyncBox!.values.length}");
      List<CustRegSync> custRegSyncHiveList = HiveDataBase.custRegSyncBox!.values.toList();
      mobileNo = custRegSyncHiveList.removeAt(index).mobileNumber!;
      custRegSyncHiveList.removeAt(index);
     await HiveDataBase.custRegSyncBox!.delete(index);
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
