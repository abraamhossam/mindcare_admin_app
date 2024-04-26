import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:mindcare_admin_app/admin/Screens/messages_view.dart';
import '../Widgets/app_title.dart';
import 'add_new_doctor.dart';
import 'added_by_admin.dart';
import 'dashboard_view.dart';
import 'doctors_view.dart';
import 'patients_view.dart';

class AdminMainScreen extends StatefulWidget {
  const AdminMainScreen({super.key});
  static String id = '/AdminMain';

  @override
  State<AdminMainScreen> createState() => _AdminMainScreenState();
}

class _AdminMainScreenState extends State<AdminMainScreen> {
  Widget selectScreen = const DashboardView();

  chosseScreens(item) {
    switch (item.route) {
      case DashboardView.id:
        setState(() {
          selectScreen = const DashboardView();
        });
        break;
      case DoctorsView.id:
        setState(() {
          selectScreen = const DoctorsView();
        });
        break;
      case PatientsView.id:
        setState(() {
          selectScreen = const PatientsView();
        });
        break;
      case AddNewDoctorView.id:
        setState(() {
          selectScreen = AddNewDoctorView();
        });
        break;
      case DoctorsAddedByAdmin.id:
        setState(() {
          selectScreen =   DoctorsAddedByAdmin();
        });
        break;
      case MessagesView.id:
        setState(() {
          selectScreen = const MessagesView();
        });
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
        appBar: AppBar(
          title: const AppTitle(),
        ),
        sideBar: SideBar(
          // textStyle: TextStyle(fontSize: 15),
          onSelected: (item) {
            chosseScreens(item);
          },
          items: const [
            AdminMenuItem(
              title: "Dashboard",
              icon: Icons.dashboard_customize,
              route: DashboardView.id,
            ),
            AdminMenuItem(
              title: "Doctors",
              icon: Icons.group,
              route: DoctorsView.id,
            ),
            AdminMenuItem(
              title: "Users",
              icon: Icons.group,
              route: PatientsView.id,
            ),
            AdminMenuItem(
                title: "Add New Doctor",
                icon: Icons.person_add_alt_1,
                route: AddNewDoctorView.id),
            AdminMenuItem(
              title: "Doctors Added By Admin",
              icon: Icons.group,
              route: DoctorsAddedByAdmin.id,
            ),
            AdminMenuItem(
              title: "Messages",
              icon: Icons.chat,
              route: MessagesView.id,
            ),
          ],
          selectedRoute: AdminMainScreen.id,
        ),
        body: selectScreen);
  }
}
