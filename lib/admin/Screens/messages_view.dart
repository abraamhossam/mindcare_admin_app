import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindcare_admin_app/admin/Screens/chatting_admin_view.dart';
import 'package:mindcare_admin_app/admin/Widgets/chat_card_admin.dart';
import 'package:mindcare_admin_app/admin/models/room_model.dart';

class MessagesView extends StatelessWidget {
  const MessagesView({super.key});
  static const String id = '/MessagesView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection("adminRooms")
            .where('members',
                arrayContains: FirebaseAuth.instance.currentUser!.uid)
            .snapshots(),
        builder: (context, snapchot) {
          if (snapchot.hasData) {
            List<RoomModel> listIteams = snapchot.data!.docs
                .map((e) => RoomModel.fromjson(e.data()))
                .toList()
              ..sort(
                  (a, b) => b.lastMessageTime!.compareTo(a.lastMessageTime!));
            return ListView.builder(
              itemCount: listIteams.length,
              itemBuilder: (context, index) {
                return ChatCardAdmin(
                  model: listIteams[index],
                );
              },
            );
          } else if (snapchot.hasError) {
            return const Center(child: Text("OOps there is an error"));
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
