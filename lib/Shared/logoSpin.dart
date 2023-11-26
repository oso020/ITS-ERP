
import 'package:flutter/material.dart';

class CustomLogoCircularIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.5), // Adjust opacity as needed
      child: Center(
        child: Container(
          width: 60, // Adjust the width and height as needed
          height: 60,

          child: Padding(
            padding: const EdgeInsets.all(8.0), // Adjust the padding as needed
            child: Image.asset('assets/logosplash.png'), // Replace with your logo image
          ),
        ),
      ),
    );
  }
}






