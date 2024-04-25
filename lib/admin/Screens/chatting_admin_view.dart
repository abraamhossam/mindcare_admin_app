import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mindcare_admin_app/admin/models/message_model.dart';
import 'package:mindcare_admin_app/admin/widgets/chat_bubble.dart';
import 'package:mindcare_admin_app/constants.dart';
import 'package:mindcare_admin_app/firebase/fire_auth_rooms.dart';
import 'package:mindcare_admin_app/firebase/fire_storage.dart';

class ChattingAdminView extends StatelessWidget {
  ChattingAdminView({super.key});
  static String id = "/ChatAdminView";

  final TextEditingController? textcontroller = TextEditingController();

  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              size: 26,
              color: Colors.white,
            ),
          ),
          title: Get.arguments[3] == "Doctor"
              ? Text(
                  "Doctor: ${Get.arguments[2]}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                )
              : Get.arguments[3] == "User"
                  ? Text(
                      "User: ${Get.arguments[2]}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : const Text(
                      "Admin",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection("adminRooms")
              .doc(Get.arguments[0].toString())
              .collection('messages')
              .orderBy(
                'created_at',
                descending: true,
              )
              .snapshots(),
          builder: (BuildContext context, snapshot) {
            if (snapshot.hasData) {
              return Scaffold(
                body: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        reverse: true,
                        controller: _scrollController,
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          return FirebaseAuth.instance.currentUser!.uid ==
                                  snapshot.data!.docs[index]['fromid']
                              ? ChatBubbleSender(
                                  type: 'admin',
                                  roomId: Get.arguments[0].toString(),
                                  messageIteam: MessageModel.fromjson(
                                    snapshot.data!.docs[index],
                                  ),
                                )
                              : ChatBubbleReciever(
                                  type: 'admin',
                                  roomId: Get.arguments[0].toString(),
                                  messageIteam: MessageModel.fromjson(
                                    snapshot.data!.docs[index],
                                  ),
                                );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 8,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Card(
                              child: TextField(
                                maxLines: 5,
                                minLines: 1,
                                controller: textcontroller,
                                onSubmitted: (data) {
                                  if (textcontroller!.text.isNotEmpty) {
                                    if (Get.arguments[4] == 'User') {
                                      FireAuthRooms.creatRoomwithAdmin(
                                          collectionName: "Users",
                                          recieverId: Get.arguments[1]);
                                      FireAuthRooms.sendMessageAdmin(
                                        recieverid: Get.arguments[1],
                                        message: textcontroller!.text,
                                        roomId: Get.arguments[0].toString(),
                                      );
                                    } else if (Get.arguments[4] == 'Doctor') {
                                      FireAuthRooms.creatRoomwithAdmin(
                                          collectionName: "doctors",
                                          recieverId: Get.arguments[1]);
                                      FireAuthRooms.sendMessageAdmin(
                                        recieverid: Get.arguments[1],
                                        message: textcontroller!.text,
                                        roomId: Get.arguments[0].toString(),
                                      );
                                    } else if (Get.arguments[4] == "Admin") {
                                      FireAuthRooms.sendMessageAdmin(
                                        recieverid: Get.arguments[1],
                                        message: textcontroller!.text,
                                        roomId: Get.arguments[0].toString(),
                                      );
                                    }
                                  }
                                  textcontroller!.clear();
                                  _scrollController.animateTo(
                                    0,
                                    curve: Curves.easeOut,
                                    duration: const Duration(milliseconds: 500),
                                  );
                                },
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 8,
                                  ),
                                  suffixIcon: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        onPressed: () async {
                                          var imagePicker = ImagePicker();
                                          XFile? image =
                                              await imagePicker.pickImage(
                                            source: ImageSource.gallery,
                                          );
                                          if (image != null) {
                                            FireStorage().sendImageAdmin(
                                              file: File(image.path),
                                              roomId:
                                                  Get.arguments[0].toString(),
                                              recieverId: Get.arguments[1],
                                            );
                                          }
                                          _scrollController.animateTo(
                                            0,
                                            curve: Curves.easeOut,
                                            duration: const Duration(
                                                milliseconds: 500),
                                          );
                                        },
                                        icon: const Icon(
                                          Iconsax.emoji_happy,
                                          color: Colors.black,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () async {
                                          var imagePicker = ImagePicker();
                                          XFile? image =
                                              await imagePicker.pickImage(
                                            source: ImageSource.camera,
                                          );
                                          if (image != null) {
                                            FireStorage().sendImageAdmin(
                                              file: File(image.path),
                                              roomId:
                                                  Get.arguments[0].toString(),
                                              recieverId: Get.arguments[1],
                                            );
                                          }
                                          _scrollController.animateTo(
                                            0,
                                            curve: Curves.easeOut,
                                            duration: const Duration(
                                                milliseconds: 500),
                                          );
                                        },
                                        icon: const Icon(
                                          Iconsax.camera,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  hintText: "Message",
                                  hintStyle: const TextStyle(
                                    color: Colors.black,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide:
                                        const BorderSide(color: kPrimaryColor),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide:
                                        const BorderSide(color: kPrimaryColor),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(
                                      color: kPrimaryColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: kPrimaryColor,
                            ),
                            child: IconButton(
                              onPressed: () async {
                                if (textcontroller!.text.isNotEmpty) {
                                  if (Get.arguments[4] == 'User') {
                                    FireAuthRooms.creatRoomwithAdmin(
                                        collectionName: "Users",
                                        recieverId: Get.arguments[1]);
                                    FireAuthRooms.sendMessageAdmin(
                                      recieverid: Get.arguments[1],
                                      message: textcontroller!.text,
                                      roomId: Get.arguments[0].toString(),
                                    );
                                  } else if (Get.arguments[4] == 'Doctor') {
                                    FireAuthRooms.creatRoomwithAdmin(
                                        collectionName: "doctors",
                                        recieverId: Get.arguments[1]);
                                    FireAuthRooms.sendMessageAdmin(
                                      recieverid: Get.arguments[1],
                                      message: textcontroller!.text,
                                      roomId: Get.arguments[0].toString(),
                                    );
                                  } else if (Get.arguments[4] == "Admin") {
                                    FireAuthRooms.sendMessageAdmin(
                                      recieverid: Get.arguments[1],
                                      message: textcontroller!.text,
                                      roomId: Get.arguments[0].toString(),
                                    );
                                  }
                                }
                                textcontroller!.clear();
                                _scrollController.animateTo(
                                  0,
                                  curve: Curves.easeOut,
                                  duration: const Duration(milliseconds: 500),
                                );
                              },
                              icon: const Icon(
                                Iconsax.send1,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text("OOps there is an error"),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
