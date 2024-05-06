import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:mindcare_admin_app/admin/models/user_model.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class GetDetailscontroller extends GetxController {
  Rx<UserModel> dataModel =
      UserModel(name: "", email: "", id: "", image: "", type: "", token: "")
          .obs;

  getDetails() async {
    String myId = FirebaseAuth.instance.currentUser!.uid;
    print(myId);
    print("+++++++++++++++++++++++++++++");
    await FirebaseFirestore.instance.collection("admins").doc(myId).get().then(
          (value) => dataModel.value = UserModel.fromjson(
            value.data(),
          ),
        );

    FirebaseMessaging.instance.requestPermission();
    await FirebaseMessaging.instance.getToken().then(
      (value) {
        if (value != null) {
          dataModel.value.token = value;
          print(value);
          FirebaseFirestore.instance.collection("admins").doc(myId).update({
            'token': value,
          });
        }
      },
    );
  }
}
