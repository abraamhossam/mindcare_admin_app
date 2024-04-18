import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void snackbar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      width: 30.h,
      elevation: 6.0,
      // margin: const EdgeInsets.all(56),
      behavior: SnackBarBehavior.floating,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      // width: 50,
      content: Center(
          child: Text(
        message,
        style: TextStyle(
          fontSize: 2.h,
        ),
      )),
    ),
  );
}
