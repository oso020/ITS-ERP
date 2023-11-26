import 'package:dashboard/model/classCodeScreen.dart';
import 'package:dashboard/screens/anmtiongif.dart';
import 'package:dashboard/screens/main_screen.dart';

import 'package:dashboard/widgets/returnSales/tablereturnsales.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class ReportreturnSales extends StatefulWidget {
  const ReportreturnSales({super.key});

  @override
  State<ReportreturnSales> createState() => _ReportreturnSalesState();
}

class _ReportreturnSalesState extends State<ReportreturnSales> {
  final TextEditingController _from = TextEditingController();
  final TextEditingController _to = TextEditingController();
  final TextEditingController _int = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    _int.dispose();
    _from.dispose();
    _to.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return Consumer<ReportreturnSalesModel>(
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            centerTitle: true,
            title: const Text(
              'تقارير مرتجعات المبيعات',
              style: TextStyle(
                fontSize: 25,
                fontFamily: 'arabic',
                color: Colors.blueGrey,
              ),
            ),
            leading: model.backButton
                ? IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.blueGrey,
                    ),
                    onPressed: () {
                        model.data.clear();
                      model.displayedData.clear();
                      model.searchValueTable.clear();
                      _int.clear();
                      _from.clear();
                      _to.clear();
                      setState(() {
                        model.selectedRowIndex=-1;
                      });
                                              model.selectedRows.clear();

                      Navigator.pushReplacement(
                          context,
                          PageTransition(
                              type: PageTransitionType.leftToRight,
                              child: const MainScreen()));

                    },
                  )
                : IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.blueGrey,
                    ),
                    onPressed: () {
                      setState(() {
                        model.data.clear();
                        model.displayedData.clear();
                        model.currentPage = 1;
                        model.selectedRowIndex=-1;

                        model.isClicked = true;
                        model.backButton = !model.backButton;
                        model.searchValueTable.clear();
                        model.selectedRows.clear();
                        _int.clear();
                        _from.clear();
                        _to.clear();
                      });
                    },
                  ),
          ),
          body: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  model.isClicked
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                children: [
                                  Checkbox(
                                    activeColor: Colors.blueGrey,
                                    value: model.showAll,
                                    onChanged: (newValue) {
                                      setState(() {
                                        model.showAll = newValue!;
                                        if (model.showAll == true) {
                                          model.dateEnabled = false;
                                          model.isChecked = false;
                                        } else {
                                          model.dateEnabled = false;
                                          model.isChecked = true;
                                        }
                                      });
                                    },
                                  ),
                                  const Text(
                                    'عرض الكل',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontFamily: 'arabic',
                                        color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: screenSize.width / 2.4,
                                  child: TextFormField(
                                    enabled: model.dateEnabled,
                                    controller: _from,
                                    validator: (value) {
                                      if (model.showAll == false) {
                                        if (model.isChecked == false) {
                                          if (value!.isEmpty) {
                                            return 'حقل التاريخ مطلوب';
                                          }
                                        }
                                      }
                                      return null;
                                    },
                                    decoration: const InputDecoration(
                                      suffixIcon: Icon(Icons.date_range),
                                      labelText: 'من',
                                      border: OutlineInputBorder(),
                                    ),
                                    onTap: () async {
                                      DateTime? pickertime =
                                          await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(2020),
                                        lastDate: DateTime(2101),
                                      );
                                      if (pickertime != null) {
                                        setState(() {
                                          _from.text = DateFormat("MM-dd-yyyy")
                                              .format(pickertime);
                                        });
                                      }
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: SizedBox(
                                    width: screenSize.width / 2.4,
                                    child: TextFormField(
                                      enabled: model.dateEnabled,
                                      controller: _to,
                                      validator: (value) {
                                        if (model.showAll == false) {
                                          if (model.isChecked == false) {
                                            if (value!.isEmpty) {
                                              return 'حقل التاريخ مطلوب';
                                            }
                                          }
                                        }
                                        return null;
                                      },
                                      decoration: const InputDecoration(
                                        suffixIcon: Icon(Icons.date_range),
                                        labelText: 'الي',
                                        border: OutlineInputBorder(),
                                      ),
                                      onTap: () async {
                                        DateTime? pickertime =
                                            await showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(2020),
                                          lastDate: DateTime(2101),
                                        );
                                        if (pickertime != null) {
                                          setState(() {
                                            _to.text = DateFormat("MM-dd-yyyy")
                                                .format(pickertime);
                                          });
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: screenSize.width / 2.7,
                                  child: TextFormField(
                                    enabled: model.isChecked,
                                    controller: _int,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    validator: (value) {
                                      if (model.isChecked == true) {
                                        if (value!.isEmpty) {
                                          return 'حقل الفاتوره مطلوب';
                                        }
                                      }
                                      return null;
                                    },
                                    decoration: const InputDecoration(
                                      labelText: 'كود الفاتوره',
                                      border: OutlineInputBorder(),
                                    ),
                                    onTap: () async {},
                                  ),
                                ),
                                Checkbox(
                                  activeColor: Colors.blueGrey,
                                  value: model.isChecked,
                                  onChanged: (newValue) {
                                    setState(() {
                                      model.isChecked = newValue!;
                                      model.dateEnabled = !model.dateEnabled;

                                      if (model.isChecked == true) {
                                        model.showAll = false;
                                      }
                                      if (model.isChecked == true) {
                                        model.dateEnabled = false;
                                      }
                                    });
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            SizedBox(
                              width: isPortrait
                                  ? screenSize.width * 0.4
                                  : screenSize.width * 0.2,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    setState(() {
                                      model.isClicked = !model.isClicked;
                                      model.backButton = !model.backButton;
                                      model.showloading = true;
                                    });
                                    await model.fetchData(_from, _to, _int);
                                  }
                                },
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                    Colors.blueGrey,
                                  ),
                                  padding: MaterialStateProperty.all(
                                      const EdgeInsets.all(4)),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8))),
                                ),
                                child: const Text(
                                  "بحث",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontFamily: 'arabic',
                                      color: Colors.white),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                          ],
                        )
                      : SizedBox(
                          height: screenSize.height / 1.2,
                          width: screenSize.width / 1,
                          child: model.data.isEmpty
                              ? GifAnimation()
                              : ListView(
                                  children: [
                                    ReportreturnSalesTable(data: model.data),
                                  ],
                                ),
                        )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
