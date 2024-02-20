import 'package:http/http.dart' as http;
import 'package:pbg_app/ExportFile/export_file.dart';

class ServerApi {
///////////// Leave History //////////////
  Future<List<ChargeAreaModel>?> apiChargeArea() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? schema = prefs.getString(GlobalConstants.schema);
    final response = await http
        .get(Uri.parse(GlobalConstants.getChargeAreaList + '?schema=$schema'));
    print("getChargeAreaList--->" + response.body);
    try {
      if (response.statusCode == 200) {
        List<ChargeAreaModel> list = [];
        List<dynamic> resp = json.decode(response.body.toString());
        for (var i = 0; i < resp.length; i++) {
          list.add(ChargeAreaModel.fromJson(resp[i]));
        }
        return list;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
