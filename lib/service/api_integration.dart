import '../ExportFile/export_file.dart';

class ApiIntegration{

  Future<ChangePasswordModel> changePasswordApi(ChangePasswordResponse changePasswordResponse)async{
    String url = GlobalConstants.resetPassword;
    var res = await ApiHelper.postData(url: url, body: changePasswordResponse.toJson());
    try{
      if(res != null){
        return ChangePasswordModel.fromJson(res);
      } else{
        print("Null Data");
      }
    }catch(e){
      print(e.toString());
      CustomToast.showToast(e.toString());
    }
    return null;
  }


}