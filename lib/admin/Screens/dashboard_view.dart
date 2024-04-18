import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});
  static const String id = '/Dashboard';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Dashboard",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 15.sp,
            // color: kPrimaryColor,
          ),
        ),
      ),
    );
  }
}
