// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PhoneTextField extends StatelessWidget {
    PhoneTextField(
      {super.key,
      required this.labelText,
      this.onChanged,
      this.validator,
      this.inputType,
      this.controller,
      this.maxLength,
      this.myconroller
      });
  final String labelText;
  final Function(String)? onChanged;
  final dynamic validator;
  final TextInputType? inputType;
  final TextEditingController? controller;
  final int? maxLength;
  TextEditingController? myconroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
      ),
      child: TextFormField(
        maxLength: maxLength,
        controller: controller,
        keyboardType: inputType,
        validator: validator,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        onChanged: onChanged,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            vertical: 16,
          ),
          labelText: labelText,
          labelStyle: TextStyle(
            fontSize: 13.sp,
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
