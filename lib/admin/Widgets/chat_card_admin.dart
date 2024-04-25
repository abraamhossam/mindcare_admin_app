import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindcare_admin_app/admin/Screens/chatting_admin_view.dart';
import 'package:mindcare_admin_app/admin/helpers/size_config.dart';
import 'package:mindcare_admin_app/admin/models/room_model.dart';
import 'package:mindcare_admin_app/constants.dart';

class ChatCardAdmin extends StatelessWidget {
  const ChatCardAdmin({
    super.key,
    required this.model,
  });

  final RoomModel model;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GestureDetector(
      onTap: () {
        Get.toNamed(
          ChattingAdminView.id,
          arguments: [
            model.members,
            model.members![0],
            model.from,
            model.fromType,
            "Admin",
          ],
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 4,
        ),
        child: Container(
          width: SizeConfig.width,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              const CircleAvatar(
                radius: 28,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 24,
                  backgroundImage: AssetImage(
                    'assets/images/user_img.png',
                  ),
                ),
              ),
              SizedBox(
                width: SizeConfig.width! * 0.1,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.from!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    model.fromType!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//  const Spacer(
//                 flex: 1,
//               ),
//  StreamBuilder(
//                 stream: FirebaseFirestore.instance
//                     .collection("adminRooms")
//                     .doc(model.id.toString())
//                     .collection("messages")
//                     .snapshots(),
//                 builder: ((context, snapshot) {
//                   final unReadList = snapshot.data?.docs
//                       .map((e) => MessageModel.fromjson(e.data()))
//                       .where((element) => element.read == "")
//                       .where((element) =>
//                           element.fromId !=
//                           FirebaseAuth.instance.currentUser!.uid);

//                   return (unReadList == null)
//                       ? const Text("")
//                       : unReadList.isEmpty
//                           ? const Text("")
//                           : Badge(
//                               backgroundColor: Colors.green,
//                               padding:
//                                   const EdgeInsets.symmetric(horizontal: 12),
//                               label: Text(
//                                 unReadList.length.toString(),
//                                 style: const TextStyle(
//                                   color: Colors.white,
//                                 ),
//                               ),
//                               largeSize: 30,
//                             );
//                 }),
//               ),