import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/input_data_doctor.dart';

class DropdownButtonn extends StatelessWidget {
  const DropdownButtonn({
    super.key,
    required this.hint,
  });
  final String hint;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DoctorInputData>(
      init: DoctorInputData(),
      builder: (controller) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Gender",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: DropdownButtonFormField<String>(
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    color: Colors.black,
                    size: 30,
                  ),
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
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  value: controller.selectitemsgender,
                  items: controller.itemsgender
                      .map((item) => DropdownMenuItem(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          )))
                      .toList(),
                  onChanged: (item) => controller.selectitemsgender = item),
            ),
          ],
        ),
      ),
    );
  }
}
