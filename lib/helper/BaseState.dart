
import 'package:flutter/material.dart';


abstract class BaseState<T extends StatefulWidget> extends State<T> {
  bool fullRefreshBackView = false;
  BuildContext _context;
  @protected
  Future<bool> onBack() {
     print(setBundle());
    // Navigator.pop(context, setBundle());
     return Future.value(false);
  }
      void finish() {
      Navigator.pop(context, setBundle());
      }
    @override
    Widget build(BuildContext context) {
    this._context = context;
    return WillPopScope(onWillPop: onBack, child: buildView(context));
    }

   @protected
   Widget buildView(BuildContext context);
   @protected
   Map<String, dynamic> setBundle() {
    }
   @protected
   getBundle(Map<String, dynamic> bundle) {
   }
  @protected
  goBack() {
    Navigator.pop(context, setBundle());
  }
   void backRefresh({bool refreshBack = true}) {
    fullRefreshBackView = refreshBack;
  }
   showView(Object object) async {
    var result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => object,
        ));
    print("result $result");
  if (result is Map<String, dynamic>) {
      getBundle(result);
    } else
      getBundle(null);
    return result;
  }
}
