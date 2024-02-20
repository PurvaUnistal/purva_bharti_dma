import 'package:flutter/material.dart';
import 'package:pbg_app/ExportFile/export_file.dart';
import 'package:permission_handler/permission_handler.dart';

class GPSSettingPermissionPopWidget extends StatelessWidget {
  const GPSSettingPermissionPopWidget();

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.43,
        width: MediaQuery.of(context).size.width/1.3,
        margin: EdgeInsets.all(MediaQuery.of(context).size.height * 0.03),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Column(
            children: [
              _closeButton(context: context),
              _centerImage(context: context),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              _text(context: context),

              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),

              _settingButton(context: context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _centerImage({required BuildContext context}) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.09,
      child: Icon(Icons.gps_off, size: MediaQuery.of(context).size.height * 0.09, color: AppColor.red,),
    );
  }

  Widget _text({required BuildContext context}) {
    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
      child: Text(
        "Your GPS Permission Status is Denied.\n Please Allow all the time app Permission.",
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _settingButton({required BuildContext context,}) {
    return TextButton(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.30,
          child: Text(
            "Open Setting",
            textAlign: TextAlign.center,
          ),
        ),
        style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
            foregroundColor: MaterialStateProperty.all<Color>(AppColor.appBlueColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    side: BorderSide(color: AppColor.appBlueColor)
                )
            )
        ),
        onPressed: () async {
          await openAppSettings();
          Navigator.pop(context);
        }
    );
  }


  Widget _closeButton({required BuildContext context}) {
    return Align(
      alignment: Alignment.centerRight,
      child: IconButton(
        icon: Icon(Icons.close, color: AppColor.black,),
        onPressed:  () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
