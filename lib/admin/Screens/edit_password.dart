import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindcare_admin_app/admin/Screens/admin_main.dart';
import 'package:mindcare_admin_app/admin/Screens/login.dart';
import 'package:mindcare_admin_app/admin/Widgets/text_field.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../helpers/snackbar.dart';

class EditPassword extends StatefulWidget {
  const EditPassword({
    super.key,
  });

  static const String id = '/editViwe';

  @override
  State<EditPassword> createState() => _nameState();
}

class _nameState extends State<EditPassword> {
  bool isopassword = true;
  bool isnpassword = true;
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController oldpasswordcontroller = TextEditingController();
  TextEditingController newpasswordcontroller = TextEditingController();
  bool isloading = false;
  
  User? user = FirebaseAuth.instance.currentUser;
  changePassword({oldpassword, newpassword}) async {
    try {
      if (user != null) {
        AuthCredential credential = EmailAuthProvider.credential(
          email: user!.email!,
          password: oldpassword,
        );
        await user!.reauthenticateWithCredential(credential);
        await user!.updatePassword(newpassword);
        snackbar(context, 'Password updated successfully');
        Get.offAllNamed(LoginAdminScreen.id);
      } else {
        snackbar(context, 'No user is currently signed in');
      }
    } catch (e) {
      snackbar(context, 'current password is incorrect');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child:ModalProgressHUD(
        inAsyncCall: isloading,
        child: AlertDialog(
          backgroundColor: Colors.white,
          contentPadding: EdgeInsets.zero,
          content: SizedBox(
            height: 40.h,
            width: 90.h,
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Change Password",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 3.5.h,
                      ),
                ),
              ),
              SizedBox(height: 5.h),
              Padding(
                padding: const EdgeInsets.all(9.0),
                child: CustomTextField(
                  mycontroller: oldpasswordcontroller,
                  ispassword: isopassword,
                  ontapSufIcon: () {
                    setState(() {
                      isopassword = !isopassword;
                    });
                  },
                  sufIcon: isopassword ? Icons.visibility_off : Icons.visibility,
                  preIcon: Icons.lock,
                  title: "Old Password ",
                  hinttext: "enter your current password",
                ),
              ),
              SizedBox(height: 4.h),
              Padding(
                padding: const EdgeInsets.all(9.0),
                child: CustomTextField(
                  mycontroller: newpasswordcontroller,
                  ispassword: isnpassword,
                  ontapSufIcon: () {
                    setState(() {
                      isnpassword = !isnpassword;
                    });
                  },
                  sufIcon: isnpassword ? Icons.visibility_off : Icons.visibility,
                  preIcon: Icons.lock,
                  title: "New Password ",
                  hinttext: "enter your new password",
                ),
              ),
            ]),
          ),
          actions: [
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue)),
              child: const Text(
                "Change",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  isloading = true;
                  setState(() {});
        
                  await changePassword(
                    oldpassword: oldpasswordcontroller.text,
                    newpassword: newpasswordcontroller.text,
                  );
                  isloading = false;
                  setState(() {});
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue)),
                child: const Text(
                  "Cancel",
                  style:
                      TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  Get.offAllNamed(AdminMainScreen.id);
                },
              ),
            ),
          ],
          insetPadding: EdgeInsets.all(10.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.h),
          ),
        ),
      ),
    );
  }
}
