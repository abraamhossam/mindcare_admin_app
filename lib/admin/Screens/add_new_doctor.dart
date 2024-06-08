import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../Widgets/appbar_widget.dart';
import '../Widgets/container_info.dart';
import '../Widgets/dropdown_button.dart';
import '../Widgets/image_info.dart';
import '../Widgets/text_field_input_data.dart';
import '../Widgets/text_input_data.dart';
import '../controller/input_data_doctor.dart';
import 'admin_main.dart';
import 'profiel_doctor.dart';

class AddNewDoctorView extends StatelessWidget {
  AddNewDoctorView({super.key});
  static const String id = '/AddNewDoctor';
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController mobile = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBarWidget(
            titel: "Basic Info",
            onPressed: () {
              Get.offAllNamed(AdminMainScreen.id);
            },
          ),
          body: Form(
              key: formKey,
              child: GetBuilder<DoctorInputData>(
                init: DoctorInputData(),
                builder: (controller) {
                  return ListView(
                    children: [
                      const SizedBox(
                        height: 2,
                      ),
                      ContainerInfo(
                        indexpages: 1 / 5,
                        title: "Basic Info",
                        desc: "Introduce Yourself More ",
                        height: 14.h,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const ImageProfileDoctor(),
                      const SizedBox(
                        height: 1,
                      ),
                      TextFiledData(
                        onChanged: (data) {
                          controller.name = data;
                        },
                        validator: (data) {
                          if (data!.isEmpty) {
                            return "field is required";
                          }
                        },
                        labelText: "Name",
                      ),

                      const SizedBox(
                        height: 6,
                      ),
                      const DropdownButtonn(
                        hint: "Select",
                      ),
                      const SizedBox(
                        height: 1,
                      ),
                      TextFiledData(
                        onChanged: (data) {
                          controller.birth = data;
                        },
                        validator: (data) {
                          if (data!.isEmpty) {
                            return "field is required";
                          }
                        },
                        labelText: "Data of Birth",
                        inputType: TextInputType.datetime,
                      ),
                      const SizedBox(
                        height: 1,
                      ),
                      TextFiledData(
                        onChanged: (data) {
                          controller.medicalTitle = data;
                        },
                        validator: (data) {
                          if (data!.isEmpty) {
                            return "field is required";
                          }
                        },
                        labelText: "Medical Specialty",
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      // Material(
                      //   child: PhoneTextField(
                      //     onChanged: (data) {
                      //       controller.phone = data;
                      //     },
                      //     maxLength: 11,
                      //     controller: mobile,
                      //     validator: (data) {
                      //       if (mobile.text.length != 11) {
                      //         return "Please Enter valid mobile number";
                      //       }
                      //     },
                      //     labelText: "Phone number",
                      //     inputType: TextInputType.phone,
                      //   ),
                      // ),
                      IntlPhoneField(
                        decoration: InputDecoration(
                          labelText: 'Phone Number',
                          labelStyle: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.grey,
                          ),
                        ),
                        initialCountryCode: 'EG',
                        onChanged: (data) {
                          controller.phone = data.toString();
                        },
                      ),
                      const SizedBox(
                        height: 1,
                      ),
                      TextFiledData(
                        onChanged: (data) {
                          controller.officeAddress = data;
                        },
                        validator: (data) {
                          if (data!.isEmpty) {
                            return "field is required";
                          }
                        },
                        labelText: "Office Address",
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      TextButtonSaveData(
                        text: "Go next ",
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            Get.toNamed(ProfileInfo.id);
                          }
                        },
                        decorationcolor: Colors.blue,
                        textcolor: Colors.white,
                      ),
                    ],
                  );
                },
              ))),
    );
  }
}
