import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// ignore: must_be_immutable
class TextFiledData extends StatelessWidget {
    TextFiledData({
    super.key,
    required this.labelText,
    this.onChanged,
    this.validator,
    this.inputType,
    this.maxLine,
    this.myconroller,
  });
  final String labelText;
  final Function(String)? onChanged;
  final dynamic validator;
  final TextInputType? inputType;
  final int? maxLine;
  TextEditingController? myconroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
      ),
      child: TextFormField(
        controller: myconroller,
        maxLines: maxLine,
        keyboardType: inputType,
        validator: validator,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
        onChanged: onChanged,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            vertical: 16,
          ),
          labelText: labelText,
          labelStyle: TextStyle(
            fontSize: 14.sp,
            color: Colors.grey,
          ),
          border: const UnderlineInputBorder(),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromARGB(255, 164, 161, 161),
            ),
          ),
        ),
      ),
    );
  }
}
