// import 'package:dashboard/screens/CustomerTransactions.dart';
// import 'package:dashboard/screens/EditingPage.dart';
// import 'package:dashboard/screens/ReportSale.dart';
// import 'package:dashboard/screens/Reportexpenciese.dart';
// import 'package:dashboard/screens/Reportpurchese.dart';
// import 'package:dashboard/screens/ReportreturnPurchese.dart';
// import 'package:dashboard/screens/ReportreturnSales.dart';
// import 'package:dashboard/screens/ShiftReport.dart';
// import 'package:dashboard/screens/SupplierAccount.dart';
// import 'package:dashboard/screens/SupplierTransactions.dart';
// import 'package:dashboard/screens/customerAccount.dart';
// import 'package:dashboard/screens/login.dart';
// import 'package:dashboard/screens/storeInventore.dart';
// import 'package:dashboard/widgets/courses_grid.dart';
// import 'package:dashboard/widgets/itemMangementable.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
// import 'package:page_transition/page_transition.dart';
// import 'package:shared_preferences/shared_preferences.dart';


// class SideMenuScreen extends StatefulWidget {
//   @override
//   _SideMenuScreenState createState() => _SideMenuScreenState();
// }

// class _SideMenuScreenState extends State<SideMenuScreen> {
//   final _advancedDrawerController = AdvancedDrawerController();
//    tokenDelete() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.remove('refreshTokenExpiration');
//     setState(() {
//       Navigator.pushReplacement(
//           context,
//           PageTransition(
//               type: PageTransitionType.leftToRight, child: const MyLogin()));
//     });
//   }





//   @override
//   Widget build(BuildContext context) {
//     final screenSize = MediaQuery.of(context).size;
//     return AdvancedDrawer(
//       backdrop: Container(
//         width: double.infinity,
//         height: double.infinity,
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//             colors: [Colors.grey, Colors.grey.withOpacity(0.2)],
//           ),
//         ),
//       ),
//       controller: _advancedDrawerController,

//       animationCurve: Curves.easeInOut,
//       animationDuration: const Duration(milliseconds: 300),
//       animateChildDecoration: true,
//       rtlOpening: false,
//       // openScale: 1.0,
//       disabledGestures: false,
//       childDecoration: const BoxDecoration(
//         // NOTICE: Uncomment if you want to add shadow behind the page.
//         // Keep in mind that it may cause animation jerks.
//         // boxShadow: <BoxShadow>[
//         //   BoxShadow(
//         //     color: Colors.black12,
//         //     blurRadius: 0.0,
//         //   ),
//         // ],
//         borderRadius: const BorderRadius.all(Radius.circular(16)),
//       ),
     
     
     
//       drawer:  ListView(
//         shrinkWrap: true,
        
//         children: [
//           SizedBox(
//             height: screenSize.height / 3,
//             child: DrawerHeader(
//                 child: Image.asset(
//               "assets/logo.png",
//               scale: 0.80,
//             )),
//           ),
//           SizedBox(
//             height: screenSize.height / 1.7,
//             child: ListView(
//               children: [
//                 ExpansionTile(
//                   leading: const Icon(Icons.handshake),
//                   title: const Text('المبيعات'),
//                   children: [
//                     ListTile(
//                       leading: const Icon(Icons.space_dashboard),
//                       title: const Text('تقارير المبيعات'),
//                       onTap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => ReportSales(),
//                             ));
//                       },
//                     ),
//                   ],
//                 ),
//                 ExpansionTile(
//                   leading: const Icon(Icons.handshake),
//                   title: const Text(' المشتريات'),
//                   children: [
//                     ListTile(
//                       leading: const Icon(Icons.space_dashboard),
//                       title: const Text('تقارير مشتريات'),
//                       onTap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => Reportpurchese(),
//                             ));
//                       },
//                     ),
//                   ],
//                 ),
//                 ExpansionTile(
//                   leading: const Icon(Icons.handshake),
//                   title: const Text('مرتجعات'),
//                   children: [
//                     ListTile(
//                       leading: const Icon(Icons.space_dashboard),
//                       title: const Text('تقارير مرتجعات مبيعات'),
//                       onTap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => ReportreturnSales(),
//                             ));
//                       },
//                     ),
//                     ListTile(
//                       leading: const Icon(Icons.space_dashboard),
//                       title: const Text('تقارير مرتجعات مشتريات'),
//                       onTap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => ReportreturnPurchese(),
//                             ));
//                       },
//                     ),
//                   ],
//                 ),
//                 ExpansionTile(
//                   leading: const Icon(Icons.handshake),
//                   title: const Text('الفترات'),
//                   children: [
//                     ListTile(
                      
//                       leading: const Icon(Icons.space_dashboard),
//                       title: const Text('تفارير الفترات'),
//                       onTap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => ShiftReport(),
//                             ));
//                       },
//                     ),
//                     ListTile(
//                       leading: const Icon(Icons.space_dashboard),
//                       title: const Text('تقارير مصروفات'),
//                       onTap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => Reportexpenciese(),
//                             ));
//                       },
//                     ),
//                   ],
//                 ),
//                 ExpansionTile(
//                   leading: const Icon(Icons.handshake),
//                   title: const Text('العملاء والمورديين'),
//                   children: [
//                     ListTile(
//                       leading: const Icon(Icons.space_dashboard),
//                       title: const Text('حسابات عملاء'),
//                       onTap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => CustomerAccount(),
//                             ));
//                       },
//                     ),
//                     ListTile(
//                       leading: const Icon(Icons.space_dashboard),
//                       title: const Text('مدفوعات العملاء'),
//                       onTap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => CustomerTransactions(),
//                             ));
//                       },
//                     ),
//                     ListTile(
//                       leading: const Icon(Icons.space_dashboard),
//                       title: const Text('مسدودات الموردين'),
//                       onTap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => SupplierTransactions(),
//                             ));
//                       },
//                     ),
//                     ListTile(
//                       leading: const Icon(Icons.space_dashboard),
//                       title: const Text('حسابات الموردين'),
//                       onTap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => SupplierAccount(),
//                             ));
//                       },
//                     ),
//                   ],
//                 ),
//                 ExpansionTile(
//                   leading: const Icon(Icons.handshake),
//                   title: const Text(' الاصناف والمخازن'),
//                   children: [
//                     ListTile(
//                       leading: const Icon(Icons.space_dashboard),
//                       title: const Text('إداره الاصناف'),
//                       onTap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => ItemMangementable(),
//                             ));
//                       },
//                     ),
//                     ListTile(
//                       leading: const Icon(Icons.space_dashboard),
//                       title: const Text('اضافه صنف'),
//                       onTap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => EditingPage(id: 0),
//                             ));
//                       },
//                     ),
//                     ListTile(
//                       leading: const Icon(Icons.space_dashboard),
//                       title: const Text('جرد المخازن'),
//                       onTap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => StoreInvenTore(),
//                             ));
//                       },
//                     ),
//                   ],
//                 ),
//                 ListTile(
//                   leading: const Icon(Icons.logout),
//                   title: const Text('تسجيل الخروج'),
//                   onTap: () async {
//                     await tokenDelete();
//                   },
//                 )
//               ],
//             ),
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//         ],
//       ),
//       child:Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor:Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           onPressed: _handleMenuButtonPressed,
//           icon: ValueListenableBuilder<AdvancedDrawerValue>(
//             valueListenable: _advancedDrawerController,
//             builder: (_, value, __) {
//               return AnimatedSwitcher(
//                 duration: Duration(milliseconds: 250),
//                 child: Icon(
                  
//                   value.visible ? Icons.clear : Icons.menu,color:Colors.grey,
//                   key: ValueKey<bool>(value.visible),
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//       body: const SingleChildScrollView(
//         physics: BouncingScrollPhysics(),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Center(
//                 child:
//                     CourseGrid()), // Replace with your actual CourseGrid widget
//           ],
//         ),
//       ),
//     )
 
 
//     );
//   }

//   void _handleMenuButtonPressed() {
//     // NOTICE: Manage Advanced Drawer state through the Controller.
//     // _advancedDrawerController.value = AdvancedDrawerValue.visible();
//      _advancedDrawerController.showDrawer();
//   }
// }