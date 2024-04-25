import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:mindcare_admin_app/firebase/fire_auth_rooms.dart';

class FireStorage {
  final FirebaseStorage fireStorage = FirebaseStorage.instance;
  sendImage(
      {required File file,
      required String roomId,
      required String recieverId}) async {
    String ext = file.path.split(".").last;
    final ref = fireStorage
        .ref()
        .child("images/$roomId/${DateTime.now().microsecondsSinceEpoch}.$ext");
    await ref.putFile(file);
    String imageUrl = await ref.getDownloadURL();
    FireAuthRooms.sendMessage(
        recieverid: recieverId,
        message: imageUrl,
        roomId: roomId,
        type: 'image');
  }

  sendImageAdmin(
      {required File file,
      required String roomId,
      required String recieverId}) async {
    String ext = file.path.split(".").last;
    final ref = fireStorage
        .ref()
        .child("images/$roomId/${DateTime.now().microsecondsSinceEpoch}.$ext");
    await ref.putFile(file);
    String imageUrl = await ref.getDownloadURL();
    FireAuthRooms.sendMessageAdmin(
        recieverid: recieverId,
        message: imageUrl,
        roomId: roomId,
        type: 'image');
  }
}
