import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.preIcon,
    required this.title,
    required this.hinttext,
    this.sufIcon,
    this.ispassword,
    this.ontapSufIcon,
    this.mycontroller
    // this.onChanged,
  });
  final String hinttext;
  final String title;
  final IconData preIcon;
  final IconData? sufIcon;
  final VoidCallback? ontapSufIcon;
  final bool? ispassword;

  final TextEditingController? mycontroller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: mycontroller,
      validator: (data) {
        if (data!.isEmpty) {
          return "field is required";
        }
        return null;
      },
      // onChanged: onChanged,
      obscureText: ispassword ?? false,
      decoration: InputDecoration(
        label: Text(
          title,
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            preIcon,
            size: 28,
            // color: Colors.blue,
          ),
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            onPressed: ontapSufIcon,
            icon: Icon(
              sufIcon,
              size: 28,
            ),
          ),
        ),
        hintText: hinttext,
        hintStyle: const TextStyle(
          fontSize: 18,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(32),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.blue,
            width: 2.5,
          ),
          borderRadius: BorderRadius.circular(32),
        ),
      ),
    );
  }
}
