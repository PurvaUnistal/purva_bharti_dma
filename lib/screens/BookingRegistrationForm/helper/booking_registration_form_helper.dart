import 'package:flutter/cupertino.dart';
import 'package:pbg_app/screens/BookingRegistrationForm/domain/model/get_dma_by_phone_number_model.dart';
import 'package:pbg_app/service/api_integration.dart';
import 'package:pbg_app/utils/common_widgets/global_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookingRegistrationFormHelper{
 static Future<GetDmaByPhoneNumberModel> fetchGetDmaByPhoneNumber({BuildContext context,String mobileNumber}) async {
    SharedPreferences  prefs = await SharedPreferences.getInstance();
   String schema = prefs.getString(GlobalConstants.schema);
    String url = "${GlobalConstants.getDmaByPhoneNumber}?schema=$schema";
    url += mobileNumber.isNotEmpty ? "&mobile_number=${mobileNumber.trim()}" : "";
    print(url);
    try {
      final res = await ApiIntegration.getData(urlEndPoint: url);
      return res !=null ? GetDmaByPhoneNumberModel.fromJson(res) : null;
    } catch (e) {
      print("GetDmaByPhoneNumberModel-->${e.toString()}");
    }
    return null;
  }
}