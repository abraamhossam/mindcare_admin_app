import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../constants.dart';
import '../Widgets/show_data_users.dart';
import '../controller/input_data_doctor.dart';

class PatientsView extends StatelessWidget {
  const PatientsView({super.key});
  static const String id = '/PatientsView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  itemCount: controller.usersData.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 19.h,
                    crossAxisCount: 3,
                    crossAxisSpacing: 15,
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {},
                      child: ShowDataUserWidgets(
                        image: controller.usersData[index]['pic'],
                        name: controller.usersData[index]['full_name'],
                        email: controller.usersData[index]['email'],
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}
