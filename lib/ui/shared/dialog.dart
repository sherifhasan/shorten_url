import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:shorten_url/core/providers/links_history_provider.dart';

import 'colors.dart';

showDeletionDialog(BuildContext context, String code) {
  Widget cancelButton = TextButton(
    child: Text("Cancel"),
    onPressed: () {},
  );
  Widget continueButton = TextButton(
    child: Text("Delete"),
    onPressed: () {
      Provider.of<LinksHistoryProvider>(context, listen: false).remove(code);
      Fluttertoast.showToast(
          msg: "Removed",
          textColor: AppColors.WHITE_COLOR,
          gravity: ToastGravity.BOTTOM,
          fontSize: 17,
          toastLength: Toast.LENGTH_LONG,
          backgroundColor: AppColors.GREY_COLOR);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Delete url"),
    content: Text("Do you sure you want to delete this url?"),
    actions: [
      cancelButton,
      continueButton,
    ],
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
