import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mindcare_admin_app/admin/Widgets/chat_bubble_admin.dart';
import 'package:mindcare_admin_app/admin/models/message_model.dart';
import 'package:mindcare_admin_app/admin/models/room_model.dart';
import 'package:mindcare_admin_app/constants.dart';
import 'package:mindcare_admin_app/firebase/fire_auth_rooms.dart';
import 'package:mindcare_admin_app/firebase/fire_storage.dart';

// ignore: must_be_immutable
class ChattingAdminView extends StatelessWidget {
  ChattingAdminView({super.key});
  static String id = "/ChatAdminView";

  final TextEditingController? textcontroller = TextEditingController();

  final _scrollController = ScrollController();
  final RoomModel model = Get.arguments;

  String myUid = FirebaseAuth.instance.currentUser!.uid;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: model.members![0] == myUid
            ? AppBar(
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
                title: const Text(
                  "Admin",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            : AppBar(
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
                title: Text(
                  "${model.fromType}:  ${model.from}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection("adminRooms")
              .doc(model.members.toString())
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
                              ? ChatBubbleAdminSender(
                                  roomIteam: model,
                                  messageIteam: MessageModel.fromjson(
                                    snapshot.data!.docs[index],
                                  ),
                                )
                              : ChatBubbleAdminReciever(
                                  roomIteam: model,
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
                                    if (model.members![0] == myUid) {
                                      FireAuthRooms.sendMessageAdmin(
                                        recieverid:
                                            model.members![1].toString(),
                                        message: textcontroller!.text,
                                        roomId: model.members.toString(),
                                      );
                                    } else {
                                      FireAuthRooms.sendMessageAdmin(
                                        recieverid:
                                            model.members![0].toString(),
                                        message: textcontroller!.text,
                                        roomId: model.members.toString(),
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
                                            if (model.members![0] == myUid) {
                                              FireStorage().sendImageAdmin(
                                                file: File(image.path),
                                                roomId:
                                                    model.members.toString(),
                                                recieverId: model.members![1]
                                                    .toString(),
                                              );
                                            } else {
                                              FireStorage().sendImageAdmin(
                                                file: File(image.path),
                                                roomId:
                                                    model.members.toString(),
                                                recieverId: model.members![0]
                                                    .toString(),
                                              );
                                            }
                                          }
                                          _scrollController.animateTo(
                                            0,
                                            curve: Curves.easeOut,
                                            duration: const Duration(
                                                milliseconds: 500),
                                          );
                                        },
                                        icon: const Icon(
                                          Icons.photo_library,
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
                                            if (model.members![0] == myUid) {
                                              FireStorage().sendImageAdmin(
                                                file: File(image.path),
                                                roomId:
                                                    model.members.toString(),
                                                recieverId: model.members![1]
                                                    .toString(),
                                              );
                                            } else {
                                              FireStorage().sendImageAdmin(
                                                file: File(image.path),
                                                roomId:
                                                    model.members.toString(),
                                                recieverId: model.members![0]
                                                    .toString(),
                                              );
                                            }
                                          }
                                          _scrollController.animateTo(
                                            0,
                                            curve: Curves.easeOut,
                                            duration: const Duration(
                                                milliseconds: 500),
                                          );
                                        },
                                        icon: const Icon(
                                          Icons.photo_camera,
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
                                  if (model.members![0] == myUid) {
                                    FireAuthRooms.sendMessageAdmin(
                                      recieverid: model.members![1].toString(),
                                      message: textcontroller!.text,
                                      roomId: model.members.toString(),
                                    );
                                  } else {
                                    FireAuthRooms.sendMessageAdmin(
                                      recieverid: model.members![0].toString(),
                                      message: textcontroller!.text,
                                      roomId: model.members.toString(),
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
                                Icons.send,
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
