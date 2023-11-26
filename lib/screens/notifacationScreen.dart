import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenNotefication extends StatefulWidget {
  const ScreenNotefication({Key? key}) : super(key: key);

  @override
  State<ScreenNotefication> createState() => _ScreenNoteficationState();
}

class _ScreenNoteficationState extends State<ScreenNotefication> {
  List data = [];
  Future<void> displayNotificationData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final String title = prefs.getString('title') ?? '';
    final String body = prefs.getString('body') ?? '';

    Map messsages = {'title': title, 'body': body};
    setState(() {
      data.add(messsages);
    });

    // Use the title and body as needed
    print('Title: $title');
    print('Body: $body');
  }

  @override
  void initState() {
    displayNotificationData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.blueGrey, size: 28),
          title: Text(
            "الإشعـــــــــــــــارات",
            style: TextStyle(
              fontSize: 25.sp,
              fontFamily: 'arabic',
              color: Colors.blueGrey,
            ),
          ),
        ),
        body: Center(
            child: SizedBox(
          height: screenSize.height - 80,
          child: data.isEmpty
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.notifications,
                      color: Colors.grey[300],
                      size: screenSize.width / 2,
                    ),
                    Text(
                      'الإشعــــــــــــارات فــــــــــارغــــــــــــــــة',
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'arabic',
                        color: Colors.grey[300],
                      ),
                    ),
                  ],
                )
              : ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: const EdgeInsets.all(7),
                      width: screenSize.width * 0.8,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 7,
                            offset: const Offset(
                                0, 2), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${data[index]['title']}",
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 25.sp,
                                fontFamily: "arabic",
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  " ${data[index]['body']}  ",
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontFamily: 'arabic',
                                      fontSize: 18.sp),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
        )));
  }
}
