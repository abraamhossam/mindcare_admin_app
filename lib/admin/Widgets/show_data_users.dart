import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../constants.dart';

// ignore: must_be_immutable
class ShowDataUserWidgets extends StatelessWidget {
  ShowDataUserWidgets(
      {super.key,
      required this.image,
      required this.name,
      required this.email});
  String image;

  String name;
  String email;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2.0.h),
      child: Container(
        constraints: BoxConstraints(maxWidth: 90.h, minHeight: 50.h),
        decoration: BoxDecoration(
          color: const Color(0xFFEEEEEE),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 6.h,
                    width: Adaptive.w(3.5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(image),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: Adaptive.w(.5),
                  ),
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            Text.rich(
              TextSpan(
                text: "Email :- ",
                style: const TextStyle(
                  fontSize: 18,
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: email,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
