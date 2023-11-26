// ignore_for_file: avoid_single_cascade_in_expression_statements, use_build_context_synchronously

import 'package:dashboard/model/classCodeScreen.dart';
import 'package:dashboard/model/notification_service.dart';

import 'package:dashboard/screens/splashScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  await ScreenUtil.ensureScreenSize();
  final fcmService = FCMService();
  await fcmService.initialize();
  

  // Initialize Local Notifications

  runApp(const  MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  

 

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Add your ChangeNotifierProviders here
        ChangeNotifierProvider(create: (_) => ReportExpencieseModel()),
        ChangeNotifierProvider(create: (_) => ReportPurcheseModel()),
        ChangeNotifierProvider(create: (_) => ReportreturnPurcheseModel()),
        ChangeNotifierProvider(create: (_) => ReportreturnSalesModel()),
        ChangeNotifierProvider(create: (_) => ReportSalesModel()),
        ChangeNotifierProvider(create: (_) => ShiftReportModel()),
        ChangeNotifierProvider(create: (_) => LoginScreenModel()),
        ChangeNotifierProvider(create: (_) => ItemMangementableModel()),
        ChangeNotifierProvider(create: (_) => EditingPageModel()),
        ChangeNotifierProvider(create: (_) => StoreInventoreScreenModel()),
        ChangeNotifierProvider(create: (_) => CustomerAccountScreenModel()),
        ChangeNotifierProvider(
            create: (_) => CustomerTransactionsScreenModel()),
        ChangeNotifierProvider(
            create: (_) => SupplierTransactionsScreenModel()),
        ChangeNotifierProvider(create: (_) => SupplierAccountScreenModel()),
        ChangeNotifierProvider(create: (_) => ChartsApp()),
        ChangeNotifierProvider(create: (_) => HandleNotification()),
        ChangeNotifierProvider(create: (_) => Course_grid()),
      ],
      child: ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: SplashScreen(),
            localizationsDelegates: [
              GlobalCupertinoLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: [Locale("ar", "AE")],
            locale: Locale("ar", "AE"),
          );
        },
      ),
    );
  }
}
