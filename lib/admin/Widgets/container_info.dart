import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../constants.dart';

class ContainerInfo extends StatelessWidget {
  const ContainerInfo({
    super.key,
    required this.title,
    required this.desc,
    required this.indexpages,
    required this.height,
  });
  final String title;
  final String desc;
  final double indexpages, height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
          width: MediaQuery.of(context).size.width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(3)),
            border: Border.all(
              color: Colors.blue,
              width: .2.w,
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 45,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircularPercentIndicator(
                  animation: true,
                  circularStrokeCap: CircularStrokeCap.round,
                  percent: indexpages,
                  radius: 32,
                  lineWidth: 5,
                  progressColor: kPrimaryColor,
                  backgroundColor: kPrimaryColor.withOpacity(0.4),
                  center: Text(
                    "${(indexpages * 5).toInt()}/5",
                    style: const TextStyle(
                      color: kPrimaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 45,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 8,
                ),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8,
                        ),
                        child: Text(
                          title,
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue),
                        ),
                      ),
                      Text(desc,
                          style: TextStyle(
                            color: const Color(0xFF8B9DB2),
                            fontSize: 14.sp,
                          )),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
