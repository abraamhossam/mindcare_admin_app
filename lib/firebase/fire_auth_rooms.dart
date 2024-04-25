import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';

class FireAuthRooms {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  static String myUid = FirebaseAuth.instance.currentUser!.uid;

  static Future createUser({
    required String name,
    required String email,
  }) async {
    await firestore.collection('users').doc(myUid).set({
      'id': myUid,
      'name': name,
      'email': email,
      'type': 'User',
    });
  }

  static Future createDoctor(
      {required String name, required String email}) async {
    await firestore.collection('doctors').doc(myUid).set({
      'id': myUid,
      'name': name,
      'email': email,
      'type': 'Doctor',
    });
  }

  static Future creatRoom(
      {required String recieverName, required String recieverId}) async {
    QuerySnapshot user = await firestore
        .collection('users')
        .where('id', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();

    List members = [myUid, recieverId];

    await firestore.collection('rooms').doc(members.toString()).set({
      'id': members.toString(),
      'created_at': DateTime.now().toString(),
      'members': members,
      'from': user.docs.first['name'],
      'to': recieverName,
      'type_from': 'User',
      'type_to': 'Doctor',
      'last_message_time': DateTime.now().millisecondsSinceEpoch.toString(),
    });
  }

  static Future sendMessage({
    required String recieverid,
    required String message,
    required String roomId,
    String? type,
  }) async {
    String msgId = Uuid().v1();
    await firestore
        .collection('rooms')
        .doc(roomId)
        .collection('messages')
        .doc(msgId)
        .set({
      'id': msgId,
      'toid': recieverid,
      'fromid': myUid,
      'created_at': DateTime.now().toString(),
      'message': message,
      'type': type ?? 'text',
      'read': '',
    });
    firestore.collection('rooms').doc(roomId).update({
      'last_message_time': DateTime.now().millisecondsSinceEpoch.toString(),
    });
  }

  static Future creatRoomwithAdmin(
      {required String recieverId, required String collectionName}) async {
    QuerySnapshot user = await firestore
        .collection(collectionName)
        .where('id', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();

    List members = [myUid, recieverId];

    await firestore.collection('adminRooms').doc(members.toString()).set({
      'id': members.toString(),
      'created_at': DateTime.now().toString(),
      'members': members,
      'from': user.docs.first['name'],
      'to': 'admin',
      'type_from': user.docs.first['type'],
      'type_to': 'Admin',
      'last_message_time': DateTime.now().millisecondsSinceEpoch.toString(),
    });
  }

  static Future sendMessageAdmin({
    required String recieverid,
    required String message,
    required String roomId,
    String? type,
  }) async {
    String msgId = Uuid().v1();
    await firestore
        .collection('adminRooms')
        .doc(roomId)
        .collection('messages')
        .doc(msgId)
        .set({
      'id': msgId,
      'toid': recieverid,
      'fromid': myUid,
      'created_at': DateTime.now().toString(),
      'message': message,
      'type': type ?? 'text',
      'read': "",
    });
    firestore.collection('adminRooms').doc(roomId).update({
      'last_message_time': DateTime.now().millisecondsSinceEpoch.toString(),
    });
  }

  static Future readMessage({
    required String roomId,
    required String msgId,
    required String type,
  }) async {
    if (type == 'admin') {
      await firestore
          .collection('adminRooms')
          .doc(roomId)
          .collection("messages")
          .doc(msgId)
          .update({
        'read': DateTime.now().microsecondsSinceEpoch.toString(),
      });
    } else {
      await firestore
          .collection('rooms')
          .doc(roomId)
          .collection("messages")
          .doc(msgId)
          .update({
        'read': DateTime.now().microsecondsSinceEpoch.toString(),
      });
    }
  }
}
