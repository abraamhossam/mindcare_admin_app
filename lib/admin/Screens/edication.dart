 
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../Widgets/appbar_widget.dart';
import '../Widgets/container_info.dart';
import '../Widgets/dropdown_button_years.dart';
import '../Widgets/text_field_input_data.dart';
import '../Widgets/text_input_data.dart';
import '../controller/input_data_doctor.dart';
import 'work_experience.dart';

class EdicationDataView extends StatelessWidget {
  EdicationDataView({super.key});
  static String id = "/edication";
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBarWidget(
          titel: "Education",
          onPressed: () {
            Get.back();
          },
        ),
        body: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GetBuilder<DoctorInputData>(
              init: DoctorInputData(),
              builder: (controller) {
                return ListView(
                  children: [
                    ContainerInfo(
                      indexpages: 3 / 5,
                      title: "Education",
                      desc: "Add your education info",
                      height: 14.h,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        " # UNIVERSITY ",
                        style: TextStyle(
                          color: const Color.fromRGBO(129, 150, 172, 1),
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    TextFiledData(
                      onChanged: (data) {
                        controller.universty = data;
                      },
                      labelText: "University",
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
                        controller.fieldOfStude = data;
                      },
                      labelText: "Field of study",
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
                        controller.degree = data;
                      },
                      labelText: "Degree",
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
                            width: 15.w,
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
                      height: 4.h,
                    ),
                    Expanded(
                      child: TextButtonSaveData(
                        text: "Go next ",
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            Get.toNamed(WorkExperienceView.id);
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
