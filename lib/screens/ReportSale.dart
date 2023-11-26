import 'package:dashboard/model/classCodeScreen.dart';
import 'package:dashboard/screens/anmtiongif.dart';
import 'package:dashboard/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../widgets/salesTables/tableSales.dart';

class ReportSales extends StatefulWidget {
  @override
  State<ReportSales> createState() => _ReportSalesState();
}

class _ReportSalesState extends State<ReportSales> {
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

    return Consumer<ReportSalesModel>(
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            title: const Text(
              'تقـــــــــــــــــارير المبيـــــــــــــــعات',
              style: TextStyle(
                fontSize: 25,
                fontFamily: 'arabic',
                color: Colors.blueGrey,
              ),
            ),
            centerTitle: true,
            automaticallyImplyLeading: false,
            leading: model.backButton
                ? IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.blueGrey,
                    ),
                    onPressed: () {
                      setState(() {
                        model.data.clear();
                        model.displayedData.clear();
                        model.currentPage = 1;
                        model.selectedRowIndex = -1;

                        model.isClicked = true;
                        model.backButton = !model.backButton;
                        model.searchValueTable.clear();
                        model.selectedRows.clear();
                        _int.clear();
                        _from.clear();
                        _to.clear();
                      });
                    },
                  )
                : IconButton(
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
                        model.selectedRowIndex = -1;
                      });
                      model.selectedRows.clear();

                      Navigator.pop(context);
                    },
                  ),
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                model.isClicked
                    ? Form(
                        key: _formKey,
                        child: Column(
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
                                  width: isPortrait
                                      ? screenSize.width * 0.42
                                      : screenSize.width * 0.2,
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
                                    width: isPortrait
                                        ? screenSize.width * 0.42
                                        : screenSize.width * 0.2,
                                    child: TextFormField(
                                      enabled: model.dateEnabled,
                                      controller: _to,
                                      keyboardType: TextInputType.number,
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
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
                                  width: isPortrait
                                      ? screenSize.width * 0.4
                                      : screenSize.width * 0.2,
                                  child: TextFormField(
                                    enabled: model.isChecked,
                                    controller: _int,
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
                                  value: model.isChecked,
                                  activeColor: Colors.blueGrey,
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
                                      model.currentPage = 1;
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
                                  "بـــــحــــث",
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
                        ),
                      )
                    : Column(
                        children: [
                          SizedBox(
                            height: screenSize.height / 1.2,
                            width: screenSize.width / 1,
                            child: model.data.isEmpty
                                ? GifAnimation()
                                : ListView(
                                    children: [
                                      Table1(data: model.data),
                                    ],
                                  ),
                          )
                        ],
                      )
              ],
            ),
          ),
        );
      },
    );
  }
}
