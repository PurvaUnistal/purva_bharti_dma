import 'dart:io';
import 'package:flutter/material.dart';
import 'package:pbg_app/ExportFile/export_file.dart';
import 'package:pbg_app/Utils/common_widgets/enlarge_widge.dart';

class ImageWidget extends StatelessWidget {
  final File imgFile;
  final String title;
  final String? star;
  final void Function() onPressed;
  const ImageWidget({super.key, required this.imgFile, this.star, required this.title, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(flex : 1,child: Text(star ??"",  style:Styles.subStar)),
            Flexible(flex : 6,child: Text(title  ?? "", style:Styles.subTitle),
            ),
          ],
        ),
        SizedBox(
            width: MediaQuery.of(context).size.width *0.23,
            height:MediaQuery.of(context).size.height* 0.12,
            child: InkWell(
              onTap: onPressed,

              child: imgFile.path.isNotEmpty
                  ? Card(
                child: Stack(
                  clipBehavior: Clip.none,
                  children: <Widget>[
                    Image.file(
                      imgFile,
                      fit: BoxFit.fill,
                      width: MediaQuery.of(context).size.width *0.23,
                      height:MediaQuery.of(context).size.height* 0.12,
                    ),
                    Positioned(
                      top: -15,
                      right: -20,
                      /* width: MediaQuery.of(context).size.width/3,
                      height:MediaQuery.of(context).size.height/3,*/

                      child: TextButton(
                        child: Container(
                            color: AppColor.prime,
                            child: Icon(Icons.zoom_out_map,color: AppColor.white,)),
                        onPressed: () async {
                          await showBottomSheet(
                              context: context,
                              builder: (_) => EnlargeWidget(text: title, photoPath: imgFile,));
                        },),
                    ),
                  ],

                ),
              )
                  :Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.photo_camera_back_outlined, color: AppColor.prime,size: 18,),
                    Text("Photo",style: Styles.labels,),
                  ],
                ),
              ),
            )
        ),
      ],
    );
  }
}
