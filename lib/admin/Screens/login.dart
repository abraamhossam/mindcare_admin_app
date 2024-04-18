// ignore_for_file: use_build_context_synchronously

 
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../constns.dart';
import '../Widgets/custom_button.dart';
import '../Widgets/text_field.dart';
import '../helpers/snackbar.dart';
import 'admin_main.dart';

// ignore: must_be_immutable
class LoginAdminScreen extends StatefulWidget {
  const LoginAdminScreen({super.key});
  static String id = '/LoginAdmin';

  @override
  State<LoginAdminScreen> createState() => _LoginAdminScreenState();
}

class _LoginAdminScreenState extends State<LoginAdminScreen> {
  bool ispassword = true;
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: isloading == true
              ? const Center(
                  child: CircularProgressIndicator(
                    color: kPrimaryColor,
                  ),
                )
              : Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.blue,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 5.w,
                          vertical: 5.h,
                        ),
                        child: Form(
                          key: formKey,
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text(
                                  "Log in your Account ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 21,
                                  ),
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                CustomTextField(
                                  mycontroller: emailcontroller,
                                  preIcon: Icons.person,
                                  title: "Email",
                                  hinttext: "Enter your email",
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                CustomTextField(
                                  mycontroller: passwordcontroller,
                                  ispassword: ispassword,
                                  ontapSufIcon: () {
                                    setState(() {
                                      ispassword = !ispassword;
                                    });
                                  },
                                  sufIcon: ispassword
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  preIcon: Icons.person,
                                  title: "Password ",
                                  hinttext: "Enter your password",
                                ),
                                SizedBox(
                                  height: 3.h,
                                ),
                                CustomButton(
                                  text: "Login ",
                                  ontap: () async {
                                    if (formKey.currentState!.validate()) {
                                      try {
                                        await FirebaseAuth.instance
                                            .signInWithEmailAndPassword(
                                                email:
                                                    emailcontroller.text.trim(),
                                                password: passwordcontroller
                                                    .text
                                                    .trim());
                                        snackbar(context, 'Success');

                                        // ignore: avoid_print
                                        print(" mary");
                                        Get.offAllNamed(AdminMainScreen.id);
                                      } on FirebaseAuthException catch (e) {
                                        if (e.code == 'user-not-found') {
                                          snackbar(context, 'user not found');
                                        } else if (e.code == 'wrong-password') {
                                          snackbar(
                                              context, 'password is Wrong');
                                        }
                                      }
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )),
    );
  }
}
