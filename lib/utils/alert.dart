import 'package:flutter/material.dart';

import 'color_constants.dart';

class Alert {
  static void showSnackBar(BuildContext context, String title) {
    final _snackBar = SnackBar(
      content: Text(title),
      action: SnackBarAction(
          textColor: Colors.green,
          label: 'Dismiss',
          onPressed: () => ScaffoldMessenger.of(context).hideCurrentSnackBar()),
    );

    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(_snackBar);
  }

  static showLogOutAlert(BuildContext context, Function onTap) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Are you sure you want to log out ?',
            style: TextStyle(fontSize: 16),
          ),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                child: Text(
                  'Discard',
                  style: TextStyle(color: kPrimaryColor),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(
                width: 20,
              ),
              InkWell(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    'Yes',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                onTap: onTap,
              )
            ],
          ),
        );
      },
    );
  }
}