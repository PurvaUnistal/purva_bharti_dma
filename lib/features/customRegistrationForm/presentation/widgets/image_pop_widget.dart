import 'package:flutter/material.dart';
import 'package:pbg_app/Utils/common_widgets/app_color.dart';
import 'package:pbg_app/Utils/common_widgets/button_widget.dart';

class ImagePopWidget extends StatelessWidget {
  final void Function()? onTapGallery, onTapCamera;
  const ImagePopWidget(
      {Key? key, required this.onTapGallery, required this.onTapCamera})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom),
        child:
        Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: Text('Choose One',textAlign: TextAlign.center,
                  style: TextStyle(color: AppColor.prime,fontSize: 18, fontWeight: FontWeight.bold),),
              ),
              TextButton(child: Text('Gallery'), onPressed: onTapGallery),
              TextButton(child: Text('Camera',), onPressed: onTapCamera,),
              ButtonWidget(
                text: 'Dismiss',
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
