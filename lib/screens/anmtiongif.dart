import 'package:flutter/material.dart';

class GifAnimation extends StatefulWidget {
  const GifAnimation({super.key});

  @override
  State<GifAnimation> createState() => _GifAnimationState();
}

class _GifAnimationState extends State<GifAnimation> {
  int seconds = 6;
  bool isLoading = true; // Initialize it to true

  @override
  void initState() {
    super.initState();

    // Delay for 5 seconds and then set isLoading to false
    Future.delayed(Duration(seconds: seconds), () {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Center(
      child: SizedBox(
        height: screenSize.height / 2,
        width: screenSize.width / 1.2,
        child: isLoading
            ? Image(
                image: AssetImage(
                  'assets/invoice-animation-dribbble.gif',
                ),
              )
            : Center(
                child: Text(
                  'لا توجد بيانات',
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'arabic',
                    color: Colors.grey[500],
                  ),
                ),
              ),
      ),
    );
  }
}
