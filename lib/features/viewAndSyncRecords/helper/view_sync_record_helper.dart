import 'package:flutter/material.dart';
import 'package:pbg_app/ExportFile/export_file.dart';
import 'package:pbg_app/features/customRegistrationForm/domain/model/save_customer_registration_model.dart';


class ViewSyncRecordHelper {
  static Future<dynamic> leadSaveInServer({required BuildContext context}) async {
    if (HiveDataBase.leadBoxCustomerRegistration!.values.isNotEmpty) {
      if (await isInternetConnected() == true) {
        int count = 0;
        log("Data Length Check ============== ${HiveDataBase.leadBoxCustomerRegistration!.values.length}");
        List<SaveCustomerRegistrationOfflineModel> saveCustRegOfflineModelHiveList = HiveDataBase.leadBoxCustomerRegistration!.values.toList();
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
            //   await HiveDataBase.leadBoxCustomerRegistration!.clear();
            log("updateCustomerRequestModel--->" + saveCusRegDataRequestModel.toJson().toString());
            String url = GlobalConstants.saveCustomerRegistrationOffline;
            var res = await ApiServer.postDataWithFile(
              body: saveCusRegDataRequestModel.toJson(),
              context: context,
              urlEndPoint: url,
            );
            if (res != null) {
              count++;
              CustomToast.showToast(res.toString());
              return saveCustomerRegistrationModelFromJson(res);
            } else {
              CustomToast.showToast(res.toString());
              return null;
            }
          } catch (e) {
            CustomToast.showToast(e.toString());
            return null;
          }
        }
        for (int i = count - 1; i >= 0; i--) {
          saveCustRegOfflineModelHiveList.removeAt(i);
          await HiveDataBase.leadBoxCustomerRegistration!.deleteAt(i);
        }
        if (count == saveCustRegOfflineModelHiveList.length) {
          await HiveDataBase.leadBoxCustomerRegistration!.clear();
        }
        print("ASDFGHNJGFDS-->${saveCustRegOfflineModelHiveList.length}");
        saveCustRegOfflineModelHiveList.removeRange(0, count);
        //   CustomToast.showToast("Data saved successfully");
      }
    } else {
      CustomToast.showToast("No Internet Connection");
      return null;
    }
  }

  static Future<dynamic> deleteData({required BuildContext context, required int index, required String mobileNo}) async {
    if (HiveDataBase.leadBoxCustomerRegistration!.values.isNotEmpty) {
      log("Data Length ============== ${HiveDataBase.leadBoxCustomerRegistration!.values.length}");
      List<SaveCustomerRegistrationOfflineModel> saveCustRegOfflineModelHiveList = HiveDataBase.leadBoxCustomerRegistration!.values.toList();
      mobileNo = saveCustRegOfflineModelHiveList.removeAt(index).mobileNumber!;
      saveCustRegOfflineModelHiveList.removeAt(index);
     await HiveDataBase.leadBoxCustomerRegistration!.deleteAt(index);
    }
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
