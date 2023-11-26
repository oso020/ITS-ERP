import 'package:dashboard/model/classCodeScreen.dart';
import 'package:dashboard/screens/anmtiongif.dart';
import 'package:dashboard/screens/main_screen.dart';

import 'package:dashboard/widgets/purcheseTables/tablepurchese.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class Reportpurchese extends StatefulWidget {
  const Reportpurchese({super.key});

  @override
  State<Reportpurchese> createState() => _ReportpurcheseState();
}

class _ReportpurcheseState extends State<Reportpurchese> {
  final TextEditingController _from = TextEditingController();
  final TextEditingController _to = TextEditingController();
  final TextEditingController _int = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void resetFields() {
    _from.clear();
    _to.clear();
    _int.clear();
  }

  @override
  void dispose() {
    resetFields(); // Call the resetFields method
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return Consumer<ReportPurcheseModel>(
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            centerTitle: true,
            title: const Text(
              'تقارير المشتريات',
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

                      setState(() {
                       model.selectedRowIndex=-1;

                      });
                        Navigator.pushReplacement(
                context,
                PageTransition(
                    type: PageTransitionType.leftToRight,
                    child: const MainScreen())); 
                      model.displayedData.clear();
                      model.searchValueTable.clear();
                      _int.clear();
                      _from.clear();
                    _to.clear();
                      
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
                        model.isClicked = true;
                        model.backButton = !model.backButton;
                        model.showloading = false;
                      model.searchValueTable.clear();
                       model.selectedRowIndex=-1;

                      
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
                children: [
                  model.isClicked
                      ? Column(
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
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: SizedBox(
                                    width: screenSize.width / 2.4,
                                    child: TextFormField(
                                      enabled: model.dateEnabled,
                                      validator: (value) {
                                        if (model.showAll == false) {
                                          if (model.isChecked == false) {
                                            if (value!.isEmpty) {
                                              return 'حقل التاريخ مطلوب';
                                            }
                                          }
                                        }
                                        return null;
                                      }, // Set the con
                                      controller:
                                          _from, // Set the controller for the text field
                                      decoration: const InputDecoration(
                                        suffixIcon: Icon(Icons.date_range),
                                        labelText:
                                            'من', // Set the label text for the text field
                                        border:
                                            OutlineInputBorder(), // Set the border for the text field
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
                                            _from.text =
                                                DateFormat("MM-dd-yyyy")
                                                    .format(pickertime);
                                          });
                                        }
                                      },
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
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
                                      }, // Set the controller for the text field
                                      decoration: const InputDecoration(
                                        suffixIcon: Icon(Icons.date_range),
                                        labelText:
                                            'الي', // Set the label text for the text field
                                        border:
                                            OutlineInputBorder(), // Set the border for the text field
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
                                      validator: (value) {
                                        if (model.isChecked == true) {
                                          if (value!.isEmpty) {
                                            return 'حقل الفاتوره مطلوب';
                                          }
                                        }
                                        return null;
                                      }, // Set the con
                                      keyboardType: TextInputType.number,
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter.digitsOnly
                                      ], // Set the controller for the text field
                                      decoration: const InputDecoration(
                                        labelText:
                                            'كود الفاتوره', // Set the label text for the text field
                                        border:
                                            OutlineInputBorder(), // Set the border for the text field
                                      ),
                                      onTap: () async {}),
                                ),
                                Checkbox(
                                  value: model
                                      .isChecked, // Set the initial state of the checkbox
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

                                      // Update the state of the checkbox
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
                                    await model.fetchData(_from, _to, _int);
                                    setState(() {
                                      model.isClicked = !model.isClicked;
                                      model.backButton = !model.backButton;
                                      model.showloading = false;
                                      model.showloading = true;
                                    });
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
                                  scrollDirection: Axis.vertical,
                                  children: [
                                    PurcheseTable(data: model.data),
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
