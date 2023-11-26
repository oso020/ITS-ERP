



 import 'package:flutter/material.dart';

showSnackBar(BuildContext context, String text) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.white,
      duration: const Duration(seconds: 5),
      content: Text(text,
      style: const TextStyle(
        color: Colors.black
      ),
      ),
      action: SnackBarAction(label: "close", onPressed: () {}),
    ));
 }