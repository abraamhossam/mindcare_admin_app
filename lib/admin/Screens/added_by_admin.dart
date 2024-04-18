 
 
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../constns.dart';
import '../Widgets/show_data.dart';
import '../controller/input_data_doctor.dart';
import '../models/doctor_input_data.dart';
import 'admin_main.dart';
import 'update_data_add.dart';

class DoctorsAddedByAdmin extends StatelessWidget {
  const DoctorsAddedByAdmin({super.key});
  static const String id = '/DoctorsAddedByAdmin';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Text("hello"),
      body: GetBuilder<DoctorInputData>(
        init: DoctorInputData(),
        builder: (controller) {
          return controller.isloding == true
              ? const Center(
                  child: CircularProgressIndicator(
                    color: kPrimaryColor,
                  ),
                )
              : GridView.builder(
                  itemCount: controller.doctorsDataAdmin.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 20.h,
                    crossAxisCount: 6,
                    crossAxisSpacing: 4,
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
                                      controller.deletedoctorAddedbyAdmin(
                                        controller.doctorsDataAdmin[index].id,
                                      );
                                      Get.toNamed(AdminMainScreen.id);
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
                                        return UpdateDataAddedByAdmin(
                                          idDoc: controller
                                              .doctorsDataAdmin[index].id,
                                          senddataAddedByAdmin: DoctorsData(
                                            id: controller
                                                .doctorsDataAdmin[index]['id'],
                                            name: controller
                                                    .doctorsDataAdmin[index]
                                                ['name'],
                                            surname: controller
                                                    .doctorsDataAdmin[index]
                                                ['surname'],
                                            gender: controller
                                                    .doctorsDataAdmin[index]
                                                ['gender'],
                                            birth: controller
                                                    .doctorsDataAdmin[index]
                                                ['birth'],
                                            medicalTitle: controller
                                                    .doctorsDataAdmin[index]
                                                ['medicalTitle'],
                                            phone: controller
                                                    .doctorsDataAdmin[index]
                                                ['phone'],
                                            officeAddress: controller
                                                    .doctorsDataAdmin[index]
                                                ['officeAddress'],
                                            profile: controller
                                                    .doctorsDataAdmin[index]
                                                ['profile'],
                                            universty: controller
                                                    .doctorsDataAdmin[index]
                                                ['universty'],
                                            fieldOfStude: controller
                                                    .doctorsDataAdmin[index]
                                                ['fieldOfStude'],
                                            degree: controller
                                                    .doctorsDataAdmin[index]
                                                ['degree'],
                                            startYearEdiction: controller
                                                    .doctorsDataAdmin[index]
                                                ['startYearEdiction'],
                                            endYearEdiction: controller
                                                    .doctorsDataAdmin[index]
                                                ['endYearEdiction'],
                                            institution: controller
                                                    .doctorsDataAdmin[index]
                                                ['institution'],
                                            position: controller
                                                    .doctorsDataAdmin[index]
                                                ['position'],
                                            startYearWork: controller
                                                    .doctorsDataAdmin[index]
                                                ['startYearWork'],
                                            endYearWork: controller
                                                    .doctorsDataAdmin[index]
                                                ['endYearWork'],
                                            category: controller
                                                    .doctorsDataAdmin[index]
                                                ['category'],
                                            specialisty: controller
                                                    .doctorsDataAdmin[index]
                                                ['specialisty'],
                                            expiryBoard: controller
                                                    .doctorsDataAdmin[index]
                                                ['expiryBoard'],
                                            expiryCurrent: controller
                                                    .doctorsDataAdmin[index]
                                                ['expiryCurrent'],
                                            urlImage: controller
                                                    .doctorsDataAdmin[index]
                                                ['urlImage'],
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
                            });
                      },
                      child: ShowDataWidgets(
                        image: controller.doctorsDataAdmin[index]['urlImage'],
                        name: controller.doctorsDataAdmin[index]['name'],
                        address: controller.doctorsDataAdmin[index]
                            ['officeAddress'],
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}
