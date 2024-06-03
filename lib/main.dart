import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindcare_admin_app/admin/Screens/chatting_admin_view.dart';
import 'package:mindcare_admin_app/admin/Screens/messages_view.dart';
import 'package:mindcare_admin_app/firebase_options.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'admin/Screens/add_new_doctor.dart';
import 'admin/Screens/added_by_admin.dart';
import 'admin/Screens/admin_main.dart';
import 'admin/Screens/dashboard_view.dart';
import 'admin/Screens/doctors_view.dart';
import 'admin/Screens/edication.dart';
import 'admin/Screens/edit_password.dart';
import 'admin/Screens/login.dart';
import 'admin/Screens/medical_info.dart';
import 'admin/Screens/patients_view.dart';
import 'admin/Screens/profiel_doctor.dart';
import 'admin/Screens/update_data_add.dart';
import 'admin/Screens/updete_data.dart';
import 'admin/Screens/work_experience.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
        ),
        getPages: [
          GetPage(
            name: LoginAdminScreen.id,
            page: () => const LoginAdminScreen(),
          ),
          GetPage(
            name: AdminMainScreen.id,
            page: () => const AdminMainScreen(),
          ),
          GetPage(
            name: DashboardView.id,
            page: () => const DashboardView(),
          ),
          GetPage(
            name: DoctorsView.id,
            page: () => DoctorsView(),
          ),
          GetPage(
            name: PatientsView.id,
            page: () => const PatientsView(),
          ),
          GetPage(
            name: AddNewDoctorView.id,
            page: () => AddNewDoctorView(),
          ),
          GetPage(
            name: ProfileInfo.id,
            page: () => ProfileInfo(),
          ),
          GetPage(
            name: EdicationDataView.id,
            page: () => EdicationDataView(),
          ),
          GetPage(
            name: WorkExperienceView.id,
            page: () => WorkExperienceView(),
          ),
          GetPage(
            name: MedicalInfo.id,
            page: () => MedicalInfo(),
          ),
          GetPage(
            name: UpdeteData.id,
            page: () => Get.arguments[0],
          ),
          GetPage(
            name: DoctorsAddedByAdmin.id,
            page: () =>   DoctorsAddedByAdmin(),
          ),
          GetPage(
            name: UpdateDataAddedByAdmin.id,
            page: () => UpdateDataAddedByAdmin(),
          ),
          GetPage(
            name: MessagesView.id,
            page: () => const MessagesView(),
          ),
          GetPage(
            name: ChattingAdminView.id,
            page: () => ChattingAdminView(),
          ),
             GetPage(
            name: EditPassword.id,
            page: () => const EditPassword(),
          ),
        ],
        initialRoute: LoginAdminScreen.id,
      );
    });
  }
}
