import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../constants.dart';
import '../Widgets/container_info.dart';
import '../Widgets/text_field_input_data.dart';
import '../Widgets/text_input_data.dart';
import '../controller/input_data_doctor.dart';
import '../helpers/snackbar.dart';
import '../models/doctor_input_data.dart';
import 'admin_main.dart';

class MedicalInfo extends StatelessWidget {
  MedicalInfo({super.key});
  static String id = "/medical";
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
              "Medical Info",
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
                    const SizedBox(
                      height: 3,
                    ),
                    ContainerInfo(
                      indexpages: 5 / 5,
                      title: "Medical Info",
                      desc: "Enter Medical Information",
                      height: 14.h,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Text(
                        "Credentials",
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    TextFiledData(
                      onChanged: (data) {
                        controller.category = data;
                      },
                      labelText: "Category",
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
                        controller.specialisty = data;
                      },
                      labelText: "Specialisty",
                      validator: (data) {
                        if (data!.isEmpty) {
                          return "field is required";
                        }
                      },
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Text(
                        "Documents",
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        "# BOARD CERTIFICATION",
                        style: TextStyle(
                          color: const Color(0xFF8196AC),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    TextFiledData(
                      onChanged: (data) {
                        controller.expiryBoard = data;
                      },
                      labelText: "Expiry data",
                      validator: (data) {
                        if (data!.isEmpty) {
                          return "field is required";
                        }
                      },
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        "# CURRENT STATE LICENSE NUMBER ",
                        style: TextStyle(
                          color: const Color(0xFF8196AC),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    TextFiledData(
                      onChanged: (data) {
                        controller.expiryCurrent = data;
                      },
                      labelText: "Expiry data",
                      validator: (data) {
                        if (data!.isEmpty) {
                          return "field is required";
                        }
                      },
                    ),
                    SizedBox(
                      height: 9.h,
                    ),
                    Expanded(
                      child: TextButtonSaveData(
                        text: "Done",
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            controller.creatdoctordata(
                              DoctorsData(
                                id: controller.user!.uid,
                                name: controller.name,
                                surname: controller.surname,
                                gender: controller.selectitemsgender.toString(),
                                birth: controller.birth,
                                medicalTitle: controller.medicalTitle,
                                phone: controller.phone,
                                officeAddress: controller.officeAddress,
                                profile: controller.profile,
                                universty: controller.universty,
                                fieldOfStude: controller.fieldOfStude,
                                degree: controller.degree,
                                startYearEdiction: controller.selectitemyear,
                                endYearEdiction: controller.selectitemyear,
                                institution: controller.institution,
                                position: controller.position,
                                startYearWork: controller.selectitemyear,
                                endYearWork: controller.selectitemyear,
                                category: controller.category,
                                specialisty: controller.specialisty,
                                expiryBoard: controller.expiryBoard,
                                expiryCurrent: controller.expiryCurrent,
                                urlImage: controller.imageUrl!,
                              ),
                            );
                            snackbar(context, ' ADDED SUCCESSFULLY ! ');
                            Get.offAllNamed(AdminMainScreen.id);
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
