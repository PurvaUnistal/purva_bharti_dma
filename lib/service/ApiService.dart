import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hpcl_app/models/OfflineResponse.dart';
import '../ExportFile/export_file.dart';

class ApiService {
  static Dio dio = Dio();
 // ApiClient apiClient;
  BuildContext context;
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  ApiService(BuildContext context) {
    this.context = context;
    dio = new Dio();
 //   apiClient = new ApiClient(dio);
  }
  Future<BaseModel<OfflineResponse>> login(Map map) async {
    OfflineResponse response;
    LoaderDialog.showLoadingDialog(context, _keyLoader);
    try {
//     response = await apiClient.login(map);
     print("LoginResponse$response");
     Navigator.of(_keyLoader.currentContext, rootNavigator: true).pop();
    }
    catch (error, stacktrace) {
      if (error is DioError) {
        Navigator.of(_keyLoader.currentContext, rootNavigator: true).pop();
      }
      print("Exception occured: $error stackTrace: $stacktrace");
      return BaseModel()..setException(ServerError.withError(error: error));
    }
    return BaseModel()..data = response;
  }

}