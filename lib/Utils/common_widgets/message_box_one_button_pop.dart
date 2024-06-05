import 'package:flutter/material.dart';
import 'package:pbg_app/ExportFile/export_file.dart';

class MessageBoxOneButtonPopWidget extends StatelessWidget {
  final Widget child;
  const MessageBoxOneButtonPopWidget({required this.child,});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Text("Description !",style: Styles.stars, textAlign: TextAlign.center,),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05,),
                    child: child,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Divider(),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "OK",
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RowWidget extends StatelessWidget {
  final String lText;
  final String rText;
  const RowWidget({super.key, required this.lText, required this.rText});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(child: Text(lText, style: Styles.relB,)),
        Flexible(child: Text(rText, style: Styles.relB,)),
      ],
    );
  }
}

