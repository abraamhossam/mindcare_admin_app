import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../constants.dart';
import '../Widgets/show_data.dart';
import '../controller/input_data_doctor.dart';
import '../models/doctor_input_data.dart';
import 'admin_main.dart';
import 'updete_data.dart';

// ignore: must_be_immutable
class DoctorsView extends StatelessWidget {
  const DoctorsView({
    super.key,
  });

  static const String id = '/DoctorsView';

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DoctorInputData>(
      init: DoctorInputData(),
      builder: (controller) {
        return Scaffold(
            appBar: AppBar(
              title: CupertinoSearchTextField(
                controller: controller.searchControllerDoctordata,
                padding: const EdgeInsets.all(10.0),
              ),
            ),
            body: controller.isloding == true
                ? const Center(
                    child: CircularProgressIndicator(
                      color: kPrimaryColor,
                    ),
                  )
                : GridView.builder(
                    itemCount: controller.resultSearchdoctor.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: 19.h,
                      crossAxisCount: 3,
                      crossAxisSpacing: 15,
                    ),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                backgroundColor: const Color(0xFFEEEEEE),
                                content: const Text(
                                  'Do you want to Delete or Edit?',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.blue)),
                                    onPressed: () {
                                      controller.deletedoctor(
                                          controller.doctorsData[index]['id']);
                                      controller.deleteLogindoctor(
                                        controller.loginData[index]["id"]
                                      );
                                      Get.offAllNamed(AdminMainScreen.id);
                                    },
                                    child: const Text(
                                      'Delete',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  TextButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.blue)),
                                    onPressed: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (_) {
                                        return UpdeteData(
                                          idDoc: controller.doctorsData[index]
                                              ['id'],
                                          senddata: DoctorsData(
                                            id: controller.doctorsData[index]
                                                ['id'],
                                            name: controller.doctorsData[index]
                                                ['name'],
                                            // surname: controller
                                            //     .doctorsData[index]['surname'],
                                            gender: controller
                                                .doctorsData[index]['gender'],
                                            birth: controller.doctorsData[index]
                                                ['birth'],
                                            medicalTitle:
                                                controller.doctorsData[index]
                                                    ['medicalTitle'],
                                            phone: controller.doctorsData[index]
                                                ['phone'],
                                            officeAddress:
                                                controller.doctorsData[index]
                                                    ['officeAddress'],
                                            profile: controller
                                                .doctorsData[index]['profile'],
                                            universty:
                                                controller.doctorsData[index]
                                                    ['universty'],
                                            fieldOfStude:
                                                controller.doctorsData[index]
                                                    ['fieldOfStude'],
                                            degree: controller
                                                .doctorsData[index]['degree'],
                                            startYearEdiction:
                                                controller.doctorsData[index]
                                                    ['startYearEdiction'],
                                            endYearEdiction:
                                                controller.doctorsData[index]
                                                    ['endYearEdiction'],
                                            institution:
                                                controller.doctorsData[index]
                                                    ['institution'],
                                            position: controller
                                                .doctorsData[index]['position'],
                                            startYearWork:
                                                controller.doctorsData[index]
                                                    ['startYearWork'],
                                            endYearWork:
                                                controller.doctorsData[index]
                                                    ['endYearWork'],
                                            category: controller
                                                .doctorsData[index]['category'],
                                            specialisty:
                                                controller.doctorsData[index]
                                                    ['specialisty'],
                                            expiryBoard:
                                                controller.doctorsData[index]
                                                    ['expiryBoard'],
                                            expiryCurrent:
                                                controller.doctorsData[index]
                                                    ['expiryCurrent'],
                                            urlImage: controller
                                                .doctorsData[index]['urlImage'],
                                          ),
                                        );
                                      }));
                                    },
                                    child: const Text(
                                      'Edit',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: ShowDataWidgets(
                          image: controller.resultSearchdoctor[index]
                              ['urlImage'],
                          name: controller.resultSearchdoctor[index]['name'],
                          address: controller.resultSearchdoctor[index]
                              ['officeAddress'],
                        ),
                      );
                    },
                  ));
      },
    );
  }
}
