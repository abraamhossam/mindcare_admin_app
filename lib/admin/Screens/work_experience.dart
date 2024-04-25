// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../constants.dart';
import '../Widgets/container_info.dart';
import '../Widgets/dropdown_button_years.dart';
import '../Widgets/text_field_input_data.dart';
import '../Widgets/text_input_data.dart';
import '../controller/input_data_doctor.dart';
import 'medical_info.dart';

class WorkExperienceView extends StatelessWidget {
  WorkExperienceView({super.key});
  static String id = "/work";
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.2,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: kPrimaryColor,
            ),
          ),
          title: const Center(
            child: Text(
              "Work Experience",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          backgroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formKey,
            child: GetBuilder<DoctorInputData>(
              init: DoctorInputData(),
              builder: (controller) {
                return ListView(
                  children: [
                    SizedBox(
                      height: 3.h,
                    ),
                    ContainerInfo(
                      indexpages: 4 / 5,
                      title: "Work Experience",
                      desc: "Add your past and current work info",
                      height: 14.h,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        " # WORK ",
                        style: TextStyle(
                          color: const Color(0xFF8196AC),
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    TextFiledData(
                      onChanged: (data) {
                        controller.institution = data;
                      },
                      labelText: "Institution",
                      validator: (data) {
                        if (data!.isEmpty) {
                          return "field is required";
                        }
                      },
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    TextFiledData(
                      onChanged: (data) {
                        controller.position = data;
                      },
                      labelText: "Position",
                      validator: (data) {
                        if (data!.isEmpty) {
                          return "field is required";
                        }
                      },
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Start year",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 18,
                                  ),
                                ),
                                DropdownButtonyear(
                                  hint: "Select",
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 30.w,
                          ),
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "End year",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 18,
                                  ),
                                ),
                                DropdownButtonyear(
                                  hint: "Select",
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 30.w,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 9.h,
                    ),
                    Expanded(
                      child: TextButtonSaveData(
                        text: "Go next ",
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            Get.toNamed(MedicalInfo.id);
                          }
                        },
                        decorationcolor: Colors.blue,
                        textcolor: Colors.white,
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
