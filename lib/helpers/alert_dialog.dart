import 'package:flutter/material.dart';

import '../constants/colors.dart';

showAlertDialog(
    {required BuildContext context,
    required String content,
    bool showActions = false,
    void Function()? onAccept,
    void Function()? onReject}) {
  Widget cancelButton = TextButton(
    onPressed: onReject,
    child: const Text(
      style: TextStyle(color: kTextColor),
      "No",
    ),
  );
  Widget continueButton = TextButton(
    onPressed: onAccept,
    child: const Text("Si"),
  );

  AlertDialog alert = AlertDialog(
    content: Text(content),
    actions: showActions
        ? [
            cancelButton,
            continueButton,
          ]
        : [],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
