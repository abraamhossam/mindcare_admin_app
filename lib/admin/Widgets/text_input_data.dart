import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// ignore: must_be_immutable
class TextButtonSaveData extends StatelessWidget {
  TextButtonSaveData({
    super.key,
    required this.onPressed,
    this.decorationcolor,
    this.textcolor,
    required this.text,
  });
  void Function() onPressed;
  Color? decorationcolor;
  Color? textcolor;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextButton(
        onPressed: onPressed,
        child: Container(
          width: MediaQuery.of(context).size.width / 2.5,
          height: MediaQuery.of(context).size.height / 19,
          decoration: BoxDecoration(
              // color: Colors.blue,
              color: decorationcolor,
              border: Border.all(
                color: Colors.blue,
                width: .1.w,
              )),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 12.sp,
                color: textcolor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
