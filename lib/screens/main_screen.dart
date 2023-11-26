import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:dashboard/model/classCodeScreen.dart';
import 'package:dashboard/model/notification_service.dart';
import 'package:dashboard/screens/notifacationScreen.dart';
import 'package:dashboard/screens/personPage.dart';
import 'package:flutter/material.dart';
import 'package:dashboard/screens/side_menu.dart';
import 'package:dashboard/widgets/courses_grid.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();


    Provider.of<Course_grid>(context, listen: false).fetchData(context);
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.blueGrey, size: 28),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 1,
                child: Image.asset(
                  "assets/logo.png",
                  height: screenSize.height / 16,
                  width: screenSize.width / 4,
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () async {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ScreenNotefication(),
                    ));
              },
              icon: const Icon(
                Icons.notifications,
                color: Colors.blueGrey,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProfilePage(),
                    ));
              },
              icon: const Icon(
                Icons.person,
                color: Colors.blueGrey,
              ),
            )
          ],
          leading: IconButton(
            onPressed: () {
              if (_key.currentState?.isDrawerOpen == false) {
                _key.currentState?.openDrawer();
              } else {
                _key.currentState?.openEndDrawer();
              }
            },
            icon: const Icon(Icons.dehaze),
          ),
        ),
        body: Scaffold(
          backgroundColor: Colors.white,
          key: _key,
          drawer: const SideMenu(),
          body: const SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                    child:
                        CourseGrid()), // Replace with your actual CourseGrid widget
              ],
            ),
          ),
        ));
  }
}
