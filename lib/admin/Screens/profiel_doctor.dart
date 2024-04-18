 
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../constns.dart';
import '../Widgets/container_info.dart';
import '../Widgets/text_input_data.dart';
import '../controller/input_data_doctor.dart';
import 'edication.dart';

class ProfileInfo extends StatelessWidget {
  ProfileInfo({super.key});
  static String id = "/profile";
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
                "Profile Info",
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
                        indexpages: 2 / 5,
                        title: "Profile",
                        desc: 'Write About Yourself',
                        height: 14.h,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Try to write about yourself in a few The more you write,the bigger chance you have to be chosen by patients Remember to say natural,reliable,and self-confident",
                          style: TextStyle(
                            color: const Color(0xFF8B9DB2),
                            fontSize: 13.sp,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Profile description",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          maxLines: 8,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "field is required";
                            } else {
                              return null;
                            }
                          },
                          onChanged: (data) {
                            controller.profile = data;
                          },
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 16,
                              horizontal: 16,
                            ),
                            labelStyle: TextStyle(
                              fontSize: 18.sp,
                              color: Colors.grey,
                            ),
                            border: const OutlineInputBorder(),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 164, 161, 161),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextButtonSaveData(
                          text: "Go next ",
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              Get.toNamed(EdicationDataView.id);
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
          )),
    );
  }
}
