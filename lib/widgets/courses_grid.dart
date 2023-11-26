// ignore_for_file: unnecessary_string_interpolations, avoid_single_cascade_in_expression_statements

import 'package:dashboard/model/classCodeScreen.dart';
import 'package:dashboard/screens/anmtiongif.dart';
import 'package:dashboard/screens/chartsSales.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class CourseGrid extends StatefulWidget {
  const CourseGrid({super.key});

  @override
  State<CourseGrid> createState() => _CourseGridState();
}

class _CourseGridState extends State<CourseGrid> {
  bool hasHandledNotification = false; // Initialize a flag
final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();




  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Consumer<Course_grid>(builder: (context, model, child) {
      return SizedBox(
        height: screenSize.height - 80,
        child: RefreshIndicator(
              key: _refreshIndicatorKey,
              
              onRefresh: ()=>model.refreshData(context),
              child: model.data.isEmpty
            ? const Center(child: GifAnimation())
            : ListView.builder(
                      itemCount: model.data.length,
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
                      offset:
                      const Offset(0, 2), // changes position of shadow
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
                        "${model.data[index].name}",
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
                            "اجمـــــالي : ${model.data[index].total}  ",
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                                color: Colors.grey,
                                fontFamily: 'arabic',
                                fontSize: 18.sp),
                          ),
                          IconButton(
                              onPressed: () {
                                switch (index) {
                                  case 0:
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => DrawCharts(
                                              link:
                                              "/MonyReports/GetSalesChartReport",
                                              name: 'المبيعات',
                                              namePage:
                                              'احصائيات اداره المبيعات',
                                            )));
                                    break;
                                  case 1:
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => DrawCharts(
                                              link:
                                              '/MonyReports/GetPurchaseChartReport',
                                              name: 'المشتريات',
                                              namePage:
                                              'احصائيات اداره المشتريات',
                                            )));
                                    break;
                                  case 2:
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => DrawCharts(
                                              link:
                                              '/MonyReports/GetExpensesChartReport',
                                              name: 'المصروفات',
                                              namePage:
                                              'احصائيات اداره المصروفات',
                                            )));
                                    break;
                                  case 3:
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => DrawCharts(
                                              link:
                                              '/MonyReports/GetSalesReturnsChartReport',
                                              name: 'مرتجع المبيعات',
                                              namePage:
                                              'احصائيات اداره مرتجع المبيعات',
                                            )));
                                    break;
                                  case 4:
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => DrawCharts(
                                              link:
                                              '/MonyReports/GetPurchaseReturnsChartReport',
                                              name: 'مرتجع المشتريات',
                                              namePage:
                                              'احصائيات اداره مرتجع المشتريات',
                                            )));
                                    break;
                                }
                              },
                              icon: const Icon(
                                Icons.add_chart,
                                size: 50,
                                color: Colors.amber,
                              ))
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "مـــن : ${model.data[index].from} ",
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 15.sp,
                              fontFamily: "arabic",
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Text(
                            "الــي : ${model.data[index].to} ",
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 15.sp,
                              fontFamily: "arabic",
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
                      },
                    ),
            ),
   
   
   
   
      );



    },);



  }
}



//    Column(
//                           children: [
//                             SizedBox(
//                                       height: screenSize.height / 5,
//                                       width: screenSize.width / 3.5,
//                                       child: CircleAvatar(
//   radius: screenSize.width / 7, // Adjust the radius as needed
//   backgroundImage: AssetImage('assets/charts.gif'),
// )

//                                     ),
//                           ],
//                         ),