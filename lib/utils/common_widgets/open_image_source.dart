import 'dart:io';
import 'package:flutter/material.dart';
import 'package:pbg_app/ExportFile/export_file.dart';

//////////////  AlertDialog  /////////////////////////////////////////////////////
class OpenImageSource extends StatelessWidget {
  final Function onTapGallery, onTapCamera;
  const OpenImageSource({Key key, this.onTapGallery, this.onTapCamera})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actions: <Widget>[
        TextButton(
          child: Text('Dismiss',style: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 12, color: Colors.black,decoration: TextDecoration.none,),),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
      title: Text('Choose One',style: TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 12, color: Colors.black,decoration: TextDecoration.none,),),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            ListTile(title: Text('Gallery',style:TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 12, color: Colors.black,decoration: TextDecoration.none,)), onTap: onTapGallery),
            ListTile(
              title: Text(
                'Camera',style:TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 12, color: Colors.black,decoration: TextDecoration.none,)
              ),
              onTap: onTapCamera,
            ),
          ],
        ),
      ),
    );
  }
}

/////////////////    ImageCircle   /////////////////////////////////////////////
class ImageCircle extends StatelessWidget {
  final File fileImage1;
  final String pathImage;
  const ImageCircle({Key key, this.fileImage1, this.pathImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundImage: FileImage(fileImage1),
      radius: 40,
      child: Align(
        alignment: Alignment.center,
        child: CircleAvatar(
          backgroundColor: Colors.black.withOpacity(0.7),
          child: TextButton(
              child: Icon(
                Icons.zoom_out_map,
                color: Colors.white,
              ),
              onPressed: () {
                Widget okButton = TextButton(
                  child: Text("OK",style:TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 12, color: Colors.green,decoration: TextDecoration.none,)),
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                );
                AlertDialog alert = AlertDialog(
                  title: Text("PBG DMA", style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 12, color: Colors.black,decoration: TextDecoration.none,)),
                  content: Image.file(
                    File(pathImage),
                    fit: BoxFit.cover,
                  ),
                  actions: [
                    okButton,
                  ],
                );
                // show the dialog
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return alert;
                  },
                );
              }),
        ),
      ),
    );
  }
}
