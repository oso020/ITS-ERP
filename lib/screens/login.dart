// ignore_for_file: non_constant_identifier_names, use_build_context_synchronously, library_private_types_in_public_api, avoid_single_cascade_in_expression_statements

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:dashboard/model/classCodeScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController topa = TextEditingController();
  final TextEditingController _Link12 = TextEditingController();
 
 
  @override
  void initState() {

    super.initState();
     AwesomeNotifications().isNotificationAllowed().then((isAllowed) => {
      if(!isAllowed){
        AwesomeNotifications().requestPermissionToSendNotifications()
      }
    });

    Future.delayed(const Duration(seconds: 1)).then((_) {
      Provider.of<LoginScreenModel>(context, listen: false)
          .LoadRequierdData(_Link12, topa);
    });
  }

  @override
  void dispose() {
    // Perform any cleanup or release any resources used by the widget
    email.dispose;
    password.dispose;

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginScreenModel>(builder: (context, model, child) {
      return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/login.png'), fit: BoxFit.cover),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              Positioned(
                top: 100,
                left: 0,
                right: 50,
                child: Container(
                    padding: const EdgeInsets.only(left: 35, top: 130),
                    child: Image.asset(
                      "assets/logo.png",
                      scale: 0.50,
                    )),
              ),
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 35, right: 35),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 120,
                            ),
                            TextField(
                              controller: email,
                              style: const TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                  fillColor: Colors.grey.shade100,
                                  filled: true,
                                  hintText: "المستخدم",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            TextField(
                              controller: password,
                              style: const TextStyle(),
                              obscureText: model.isChecked,
                              decoration: InputDecoration(
                                  fillColor: Colors.grey.shade100,
                                  filled: true,
                                  hintText: "كلمه السر",
                                  suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          model.isChecked = !model.isChecked;
                                        });
                                      },
                                      icon: Icon(model.isChecked
                                          ? Icons.visibility_off
                                          : Icons.visibility)),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  backgroundColor: const Color(0xff4c505b),
                                  child: model.isLogin
                                      ? const CircularProgressIndicator(
                                          color: Colors.white,
                                        )
                                      : IconButton(
                                          color: Colors.white,
                                          onPressed: () async {
                                            await model.postData(
                                                email, password, context);


                                          },
                                          icon: const Icon(
                                            Icons.arrow_forward,
                                          )),
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 80,
                right: 30,
                child: IconButton(
                  icon: const Icon(
                    Icons.settings,
                    color: Colors.white,
                    size: 40,
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        // Create the dialog box
                        return Dialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(11)),
                          child: Container(
                            padding: const EdgeInsets.all(22),
                            height: 250,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextField(
                                    controller: _Link12,
                                    decoration: const InputDecoration(
                                        hintText: "Add your Link")),
                                const SizedBox(
                                  height: 22,
                                ),
                                TextField(
                                    controller: topa,
                                    decoration:
                                        const InputDecoration(hintText: "")),
                                TextButton(
                                    onPressed: () async {
                                      model.LinkSave(context, _Link12, topa);
                                    },
                                    child: const Text(
                                      "حفظ",
                                      style: TextStyle(fontSize: 22),
                                    ))
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
