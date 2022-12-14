import 'package:flutter/material.dart';

Color primaryColor = Color(0xffefaa52);
Color secondaryColor = Color(0xffe7cc8f);
Color thirdColor = Color(0xffab3e16);
Color blackColor = Color(0xff1F1D2B);
Color backgroundColor = Color(0xfff8f3e6);

void notif(context, String notif, Color? warna) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: warna,
      content: Text(notif),
      duration: Duration(seconds: 5),
    ),
  );
}
