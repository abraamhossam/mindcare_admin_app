import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/input_data_doctor.dart';

// ignore: must_be_immutable
class ImageProfileDoctor extends StatefulWidget {
  const ImageProfileDoctor({super.key});

  @override
  State<ImageProfileDoctor> createState() => _ImageProfileDoctorState();
}

class _ImageProfileDoctorState extends State<ImageProfileDoctor> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DoctorInputData>(
      init: DoctorInputData(),
      builder: (controller) {
        return Center(
          child: Stack(
            children: [
              Container(
                width: 130,
                height: 130,
                decoration: BoxDecoration(
                  border: Border.all(width: 4, color: Colors.white),
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 2,
                      blurRadius: 10,
                      color: Colors.black.withOpacity(0.1),
                    )
                  ],
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(
                      controller.imageUrl == null
                          ? "https://st3.depositphotos.com/1767687/17621/v/450/depositphotos_176214104-stock-illustration-default-avatar-profile-icon.jpg"
                          : controller.imageUrl!,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 2,
                      ),
                      color: Colors.blue),
                  child: IconButton(
                    onPressed: () {
                      controller.getImageDoctor();
                    },
                    icon: const Center(child: Icon(Icons.add_a_photo)),
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
