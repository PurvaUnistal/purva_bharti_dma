import 'package:flutter/material.dart';
import 'package:pbg_app/ExportFile/export_file.dart';

class MessageBoxTwoButtonPopWidget extends StatelessWidget {
  final String? alertText;
  final String message;
  final String? subMessage;
  final String okButtonText;
  final VoidCallback onPressed;

  const MessageBoxTwoButtonPopWidget({
         this.alertText,
      required this.message,
      this.subMessage,
      required this.onPressed,
      required this.okButtonText});

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
                  Text(
                    alertText ?? "Alert !",style: Styles.stars,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.05,
                        right: MediaQuery.of(context).size.width * 0.05),
                    child: Column(
                      children: [
                        Text(
                          message,textAlign: TextAlign.center,style: Styles.title,
                        ),
                        Text(
                          subMessage ?? "",style: Styles.title1,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Cancel",
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextButton(
                            onPressed: onPressed,
                            child: Text(
                              okButtonText ?? "OK",
                            ),
                          ),
                        )
                      ],
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
