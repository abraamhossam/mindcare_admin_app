import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/input_data_doctor.dart';

 

// ignore: must_be_immutable
class DropdownButtonyear extends StatelessWidget {
  const DropdownButtonyear({
    super.key,
    required this.hint,
  });
  final String hint;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DoctorInputData>(
      init: DoctorInputData(),
      builder: (controller) => SizedBox(
        child: DropdownButtonFormField<dynamic>(
          icon: const Icon(
            Icons.arrow_drop_down,
            color: Colors.black,
            size: 30,
          ),
          menuMaxHeight: MediaQuery.of(context).size.height * 0.40,
          decoration: const InputDecoration(
            border: UnderlineInputBorder(),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromARGB(255, 193, 192, 192),
              ),
            ),
          ),
          hint: Text(
            hint,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          value: controller.selectitemyear,
          items: controller.itemsyears
              .map((item) => DropdownMenuItem(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  )))
              .toList(),
          onChanged: (item) => controller.selectitemyear = item,
        ),
      ),
    );
  }
}
