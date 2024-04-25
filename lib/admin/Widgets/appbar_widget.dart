import 'package:flutter/material.dart';

import '../../constants.dart';

// ignore: must_be_immutable
class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  AppBarWidget({
    super.key,
    required this.titel,
    this.onPressed,
  });
  final String titel;
  void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.2,
      leading: IconButton(
        onPressed: onPressed,
        icon: const Icon(
          Icons.arrow_back_ios,
          color: kPrimaryColor,
        ),
      ),
      title: Center(
        child: Text(
          titel,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
