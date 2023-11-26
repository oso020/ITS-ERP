import 'package:dashboard/screens/CustomerTransactions.dart';
import 'package:dashboard/screens/EditingPage.dart';
import 'package:dashboard/screens/ReportSale.dart';
import 'package:dashboard/screens/Reportexpenciese.dart';
import 'package:dashboard/screens/Reportpurchese.dart';
import 'package:dashboard/screens/ReportreturnPurchese.dart';
import 'package:dashboard/screens/ReportreturnSales.dart';
import 'package:dashboard/screens/ShiftReport.dart';
import 'package:dashboard/screens/SupplierAccount.dart';
import 'package:dashboard/screens/SupplierTransactions.dart';
import 'package:dashboard/screens/customerAccount.dart';
import 'package:dashboard/screens/login.dart';
import 'package:dashboard/screens/storeInventore.dart';
import 'package:dashboard/widgets/itemMangementable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
    showAlertDialog(BuildContext context) {
      Widget okButton = TextButton(
        child: const Text("نعم",
            style: TextStyle(
                fontSize: 18, fontFamily: 'arabic', color: Colors.blueGrey)),
        onPressed: () async {
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.remove('refreshTokenExpiration');
          setState(() {
            Navigator.pushReplacement(
                context,
                PageTransition(
                    type: PageTransitionType.leftToRight,
                    child: const MyLogin()));
          });
        },
      );

      Widget noButton = TextButton(
        child: const Text("لا",
            style: TextStyle(
                fontSize: 18, fontFamily: 'arabic', color: Colors.blueGrey)),
        onPressed: () {
          Navigator.of(context).pop();
        },
      );

      AlertDialog alert = AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(15.0), // Adjust the radius as needed
        ),
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 20.0, // Adjust this value as needed
              child: Image.asset("assets/icons/delete.png",
                  scale: 0.01), // Adjust the scale as needed
            ),
            SizedBox(
              width: 10,
            ),
            const Text("تاكيد تسجيل الخروج",
                style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'arabic',
                    color: Colors.blueGrey)),
          ],
        ),
        content: const Text("هل انت متاكد من تسجيل الخروج",
            style: TextStyle(
                fontSize: 18, fontFamily: 'arabic', color: Colors.grey)),
        actions: [
          noButton,
          okButton,
        ],
      );

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }
 
 
 
 

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius:  BorderRadius.only(
        bottomLeft: Radius.circular(40.0),
      ),
      child: Drawer(
        width: MediaQuery.of(context).size.width / 1.4,
        child: ListView(
          shrinkWrap: true,
          children: [
            SizedBox(
              height: screenSize.height / 3,
              child: DrawerHeader(
                  child: Image.asset(
                "assets/logo.png",
                scale: 0.80,
              )),
            ),
            SizedBox(
              height: screenSize.height / 1.8,
              child: ListView(
                children: [
                  ExpansionTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 15.0, // Adjust this value as needed
                      child: Image.asset("assets/icons/expenses.png",
                          scale: 0.8), // Adjust the scale as needed
                    ),
                    title:  Text(
                      'المبيعات',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontFamily: 'arabic',
                        color: Colors.blueGrey,
                      ),
                    ),
                    children: [
                      ListTile(
                        leading: const Text(''),
                        title:  Text('تقارير المبيــــــــعات',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: 'arabic',
                              color: Colors.grey,
                            )),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ReportSales(),
                              ));
                        },
                      ),
                    ],
                  ),
                  ExpansionTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 15.0, // Adjust this value as needed
                      child: Image.asset("assets/icons/payment-method.png",
                          scale: 0.8), // Adjust the scale as needed
                    ),
                    title:  Text(' المشتريات',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontFamily: 'arabic',
                          color: Colors.blueGrey,
                        )),
                    children: [
                      ListTile(
                        leading: const Text(''),
                        title:  Text('تقارير مشتريات',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: 'arabic',
                              color: Colors.grey,
                            )),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Reportpurchese(),
                              ));
                        },
                      ),
                    ],
                  ),
                  ExpansionTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 15.0, // Adjust this value as needed
                      child: Image.asset("assets/icons/finance.png",
                          scale: 0.01), // Adjust the scale as needed
                    ),
                    title:  Text('مرتجعات',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontFamily: 'arabic',
                          color: Colors.blueGrey,
                        )),
                    children: [
                      ListTile(
                        leading: const Text(''),
                        title:  Text('تقارير مرتجعات مبيعات',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: 'arabic',
                              color: Colors.grey,
                            )),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ReportreturnSales(),
                              ));
                        },
                      ),
                      ListTile(
                        leading: const Text(''),
                        title:  Text('تقارير مرتجعات مشتريات',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: 'arabic',
                              color: Colors.grey,
                            )),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ReportreturnPurchese(),
                              ));
                        },
                      ),
                    ],
                  ),
                  ExpansionTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 15.0, // Adjust this value as needed
                      child: Image.asset("assets/icons/shifts.png",
                          scale: 0.01), // Adjust the scale as needed
                    ),
                    title:  Text(' الفترات والمصروفات',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontFamily: 'arabic',
                          color: Colors.blueGrey,
                        )),
                    children: [
                      ListTile(
                        leading: const Text(''),
                        title:  Text('تقارير الفترات',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: 'arabic',
                              color: Colors.grey,
                            )),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ShiftReport(),
                              ));
                        },
                      ),
                      ListTile(
                        leading: const Text(''),
                        title:  Text('تقارير مصروفات',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: 'arabic',
                              color: Colors.grey,
                            )),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Reportexpenciese(),
                              ));
                        },
                      ),
                    ],
                  ),
                  ExpansionTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 15.0, // Adjust this value as needed
                      child: Image.asset(
                          "assets/icons/best-customer-experience (1).png",
                          scale: 0.01), // Adjust the scale as needed
                    ),
                    title:  Text('العملاء والمورديين',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontFamily: 'arabic',
                          color: Colors.blueGrey,
                        )),
                    children: [
                      ListTile(
                        leading: const Text(''),
                        title:  Text('حسابات عملاء',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: 'arabic',
                              color: Colors.grey,
                            )),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CustomerAccount(),
                              ));
                        },
                      ),
                      ListTile(
                        leading: const Text(''),
                        title:  Text('مدفوعات العملاء',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: 'arabic',
                              color: Colors.grey,
                            )),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const CustomerTransactions(),
                              ));
                        },
                      ),
                      ListTile(
                        leading: const Text(''),
                        title:  Text('مسدودات الموردين',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: 'arabic',
                              color: Colors.grey,
                            )),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const SupplierTransactions(),
                              ));
                        },
                      ),
                      ListTile(
                        leading: const Text(''),
                        title:  Text('حسابات الموردين',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: 'arabic',
                              color: Colors.grey,
                            )),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SupplierAccount(),
                              ));
                        },
                      ),
                    ],
                  ),
                  ExpansionTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 15.0, // Adjust this value as needed
                      child: Image.asset("assets/icons/add-to-basket.png",
                          scale: 0.01), // Adjust the scale as needed
                    ),
                    title:  Text(' الاصناف والمخازن',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontFamily: 'arabic',
                          color: Colors.blueGrey,
                        )),
                    children: [
                      ListTile(
                        leading: const Text(''),
                        title:  Text('إداره الاصناف',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: 'arabic',
                              color: Colors.grey,
                            )),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ItemMangementable(),
                              ));
                        },
                      ),
                      ListTile(
                        leading: const Text(''),
                        title:  Text('اضافه صنف',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: 'arabic',
                              color: Colors.grey,
                            )),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditingPage(id: 0),
                              ));
                        },
                      ),
                      ListTile(
                        leading: const Text(''),
                        title:  Text('جرد المخازن',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: 'arabic',
                              color: Colors.grey,
                            )),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const StoreInvenTore(),
                              ));
                        },
                      ),
                    ],
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 15.0, // Adjust this value as needed
                      child: Image.asset("assets/icons/logout.png",
                          scale: 0.01), // Adjust the scale as needed
                    ),
                    title:  Text(
                      'تسجــــــــــــــيل الخـــــــــــــــــروج',
                      style: TextStyle(
                          color: Colors.red,
                          fontFamily: 'arabic',
                          fontSize: 17.sp),
                    ),
                    onTap: () async {
                      await showAlertDialog(context);
                    },
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
