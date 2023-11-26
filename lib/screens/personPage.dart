import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'معلومات شخصية',
          style: TextStyle(
            fontSize: 25,
            fontFamily: 'arabic',
            color: Colors.blueGrey,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.blueGrey,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        )


      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: screenSize.height / 1,
          width: screenSize.width / 1,
          child: ListView(
            children:[
              Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'تواصل معنا',
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'arabic',
                      color: Colors.blueGrey,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),

                  padding: const EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 5), // changes position of shadow
                      ),
                    ],
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'رقم الهاتف',
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'arabic',
                            color: Colors.blueGrey,
                          ),
                        ),
                        Divider(
                          color: Colors.black,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("داخل مصر",  style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'arabic',
                      color: Colors.blueGrey,
                    ),),

                                Text("01231651651561",  style: TextStyle(
                      fontSize: 17,
                      fontFamily: 'arabic',
                      color: Colors.blueGrey,
                    ),)
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("مواعيد العمل   \n  لخدمه  العملاء ",  style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'arabic',
                      color: Colors.blueGrey,
                    ),
                    textAlign: TextAlign.right,
                    ),
                                Text("من الساعه 9ص حتي\n الساعه 6 مساءً",  style: TextStyle(
                      fontSize: 17,
                      fontFamily: 'arabic',
                      color: Colors.blueGrey,
                    ),
                    )
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("داخل مصر",  style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'arabic',
                      color: Colors.blueGrey,
                    ),),
                                Text("01231651651561",  style: TextStyle(
                      fontSize: 17,
                      fontFamily: 'arabic',
                      color: Colors.blueGrey,
                    ),)
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                  Container(
                    margin: EdgeInsets.all(10),
                  padding: const EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: const Offset(0, 5), // changes position of shadow
                      ),
                    ],
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'رقم الهاتف',
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'arabic',
                            color: Colors.blueGrey,
                          ),
                        ),
                        Divider(
                          color: Colors.black,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("داخل مصر",  style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'arabic',
                      color: Colors.blueGrey,
                    ),),

                                Text("01231651651561",  style: TextStyle(
                      fontSize: 17,
                      fontFamily: 'arabic',
                      color: Colors.blueGrey,
                    ),)
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("مواعيد العمل   \n  لخدمه  العملاء ",  style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'arabic',
                      color: Colors.blueGrey,
                    ),
                    textAlign: TextAlign.right,
                    ),
                                Text("من الساعه 9ص حتي\n الساعه 6 مساءً",  style: TextStyle(
                      fontSize: 17,
                      fontFamily: 'arabic',
                      color: Colors.blueGrey,
                    ),
                    )
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("داخل مصر",  style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'arabic',
                      color: Colors.blueGrey,
                    ),),
                                Text("01231651651561",  style: TextStyle(
                      fontSize: 17,
                      fontFamily: 'arabic',
                      color: Colors.blueGrey,
                    ),)
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),




              ],
            ),
          ]),
        ),
      ),
    );
  }
}
