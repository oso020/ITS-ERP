import 'package:dashboard/model/classCodeScreen.dart';
import 'package:dashboard/screens/anmtiongif.dart';
import 'package:dashboard/screens/main_screen.dart';
import 'package:dashboard/widgets/tableShift.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class ShiftReport extends StatefulWidget {
  @override
  State<ShiftReport> createState() => _ShiftReportState();
}

class _ShiftReportState extends State<ShiftReport> {
  final TextEditingController from = TextEditingController();
  final TextEditingController to = TextEditingController();
  final TextEditingController shiftId = TextEditingController();
  @override
  void dispose() {
    from.dispose();
    to.dispose();
    shiftId.dispose();
    super.dispose();
  }

  @override
  void initState() {
    Provider.of<ShiftReportModel>(context, listen: false).GetHomeData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return Consumer<ShiftReportModel>(
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            title: const Text(
              'تقــــــــــارير الفــــــــــــــــــترات',
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
                      model.data.clear();
                      model.displayData.clear();
setState(() {
                        model.checkShowAll=true;
                          model.checkDate = false;
                                            model.checkCode = false;
                                            model.checkSafe = false;
                                            model.checkUserCode = false;

                                            model.isDataFromEnable = false;
                                            model.isDataToEnable = false;
                                            model.isSafeEnable = false;
                                            model.isSheftIdEnable = false;
                                            model.isUserEnable = false;

});
                      shiftId.clear();
                      from.clear();
                      to.clear();

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
                        model.displayData.clear();
                        model.checkShowAll=true;
                          model.checkDate = false;
                                            model.checkCode = false;
                                            model.checkSafe = false;
                                            model.checkUserCode = false;

                                            model.isDataFromEnable = false;
                                            model.isDataToEnable = false;
                                            model.isSafeEnable = false;
                                            model.isSheftIdEnable = false;
                                            model.isUserEnable = false;


                        model.isClicked = true;
                        model.backButton = !model.backButton;

                        shiftId.clear();
                        from.clear();
                        to.clear();
                      });
                    },
                  ),
          ),
          body: model.users.isEmpty && model.safes.isEmpty
              ? GifAnimation()
              : SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      model.isClicked
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Checkbox(
                                      activeColor: Colors.blueGrey,
                                      value: model.checkShowAll,
                                      onChanged: (newValue) {
                                        setState(() {
                                          model.checkShowAll =
                                              !model.checkShowAll;
                                          if (model.checkShowAll) {
                                            model.checkDate = false;
                                            model.checkCode = false;
                                            model.checkSafe = false;
                                            model.checkUserCode = false;

                                            model.isDataFromEnable = false;
                                            model.isDataToEnable = false;
                                            model.isSafeEnable = false;
                                            model.isSheftIdEnable = false;
                                            model.isUserEnable = false;
                                          }
                                        });
                                      },
                                    ),
                                    const Text(
                                      "عرض الكل",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'arabic',
                                          color: Colors.grey),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Checkbox(
                                      activeColor: Colors.blueGrey,
                                      value: model.checkDate,
                                      onChanged: (newValue) {
                                        setState(() {
                                          model.checkDate = !model.checkDate;
                                          if (model.checkDate) {
                                            model.checkShowAll = false;
                                            model.checkCode = false;
                                            model.checkSafe = false;
                                            model.checkUserCode = false;

                                            model.isDataFromEnable = true;
                                            model.isDataToEnable = true;
                                            model.isSafeEnable = false;
                                            model.isSheftIdEnable = false;
                                            model.isUserEnable = false;
                                          } else {
                                            model.isDataFromEnable = false;
                                            model.isDataToEnable = false;
                                          }
                                        });
                                      },
                                    ),
                                    SizedBox(
                                      width: screenSize.width / 2.6,
                                      child: TextFormField(
                                        enabled: model.isDataFromEnable,
                                        controller: from,
                                        decoration: const InputDecoration(
                                          suffixIcon: Icon(Icons.date_range),
                                          labelText: 'تاريخ الفتح',
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
                                              from.text =
                                                  DateFormat("MM-dd-yyyy")
                                                      .format(pickertime);
                                            });
                                          }
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: SizedBox(
                                        width: screenSize.width / 2.6,
                                        child: TextField(
                                          enabled: model.isDataToEnable,
                                          controller: to,
                                          decoration: const InputDecoration(
                                            suffixIcon: Icon(Icons.date_range),
                                            labelText: 'تاريخ القفل',
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
                                                to.text =
                                                    DateFormat("MM-dd-yyyy")
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
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Checkbox(
                                      value: model.checkCode,
                                      activeColor: Colors.blueGrey,
                                      onChanged: (newValue) {
                                        setState(() {
                                          model.GetHomeData();
                                          model.checkCode = !model.checkCode;
                                          if (model.checkCode) {
                                            model.checkShowAll = false;
                                            model.checkDate = false;

                                            model.checkUserCode = false;

                                            model.isDataFromEnable = false;
                                            model.isDataToEnable = false;

                                            model.isSheftIdEnable = true;
                                            model.isUserEnable = false;
                                          } else {
                                            model.checkSafe = false;
                                            model.isSafeEnable = false;
                                            model.isSheftIdEnable = false;
                                          }
                                        });
                                      },
                                    ),
                                    SizedBox(
                                      width: screenSize.width / 1.22,
                                      child: TextField(
                                        enabled: model.isSheftIdEnable,
                                        controller: shiftId,
                                        keyboardType: TextInputType.number,
                                        inputFormatters: <TextInputFormatter>[
                                          FilteringTextInputFormatter.digitsOnly
                                        ],
                                        decoration: const InputDecoration(
                                          labelText: 'كود الفتره',
                                          border: OutlineInputBorder(),
                                        ),
                                        onTap: () async {},
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Checkbox(
                                      activeColor: Colors.blueGrey,
                                      value: model.checkSafe,
                                      onChanged: (newValue) {
                                        setState(() {
                                          model.checkSafe = !model.checkSafe;
                                          if (model.checkSafe) {
                                            model.checkShowAll = false;
                                            model.checkDate = false;
                                            model.checkCode = true;
                                            model.checkUserCode = false;
                                            model.isDataFromEnable = false;
                                            model.isDataToEnable = false;
                                            model.isSafeEnable = true;
                                            model.isSheftIdEnable = true;
                                            model.isUserEnable = false;
                                          } else {
                                            model.checkCode = false;
                                            model.isSheftIdEnable = false;

                                            model.checkUserCode = false;
                                            model.isUserEnable = false;
                                            model.checkSafe = false;
                                            model.isSafeEnable = false;
                                          }
                                        });
                                      },
                                    ),
                                    SizedBox(
                                      height: 68,
                                      width: screenSize.width / 1.22,
                                      child: DropdownButtonFormField<String>(
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.transparent),
                                          ),
                                          filled: true,
                                          fillColor: Colors.white,
                                        ),
                                        value: model.selectedSafe,
                                        onChanged: model.isSafeEnable
                                            ? (value) {
                                                setState(() {
                                                  model.selectedSafe = value;
                                                });
                                              }
                                            : null,
                                        items: model.safes.map((item) {
                                          return DropdownMenuItem<String>(
                                            enabled: model.isSafeEnable,
                                            value: item.keys.first.toString(),
                                            child: Text(item.values.first),
                                          );
                                        }).toList(),
                                        hint: const Text('الخزنه'),
                                        disabledHint:
                                            const Text('غير متاح اختيار خزينه'),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Checkbox(
                                      activeColor: Colors.blueGrey,
                                      value: model.checkUserCode &&
                                          model.checkSafe &&
                                          model.checkCode,
                                      onChanged: (newValue) {
                                        setState(() {
                                          model.checkUserCode =
                                              !model.checkUserCode;
                                          if (model.checkUserCode) {
                                            model.checkShowAll = false;
                                            model.checkDate = false;

                                            model.isDataFromEnable = false;
                                            model.isDataToEnable = false;
                                            model.isUserEnable = true;
                                          }
                                          model.isUserEnable =
                                              model.checkUserCode &&
                                                  model.checkSafe &&
                                                  model.checkCode;
                                        });
                                      },
                                    ),
                                    SizedBox(
                                      height: 68,
                                      width: screenSize.width / 1.22,
                                      child: DropdownButtonFormField<String>(
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.transparent),
                                          ),
                                          filled: true,
                                          fillColor: Colors.white,
                                        ),
                                        value: model.selectedUser,
                                        onChanged: model.isUserEnable
                                            ? (value) {
                                                setState(() {
                                                  model.selectedUser = value;
                                                });
                                              }
                                            : null,
                                        items: model.users.map((item) {
                                          return DropdownMenuItem<String>(
                                            enabled: model.isUserEnable,
                                            value: item.keys.first.toString(),
                                            child: Text(item.values.first),
                                          );
                                        }).toList(),
                                        hint: const Text('المستخدم'),
                                        disabledHint: const Text(
                                            'غير متاح اختيار مستخدم'),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                SizedBox(
                                  width: isPortrait
                                      ? screenSize.width * 0.4
                                      : screenSize.width * 0.2,
                                  height: 50,
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      await model.GetData(from, to, shiftId);
                                      setState(() {
                                        model.isClicked = !model.isClicked;
                                        model.backButton = !model.backButton;
                                      });
                                    },
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
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
                              ],
                            )
                          : Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: SizedBox(
                                    height: 50,
                                    width: screenSize.width / 1.1,
                                    child: TextFormField(
                                      onChanged: (value) => model
                                          .updateListSearch(value.toString()),
                                      decoration: const InputDecoration(
                                        labelText: ' بحث',
                                        suffixIcon: Icon(Icons.search),
                                        border: OutlineInputBorder(),
                                      ),
                                      onTap: () async {},
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: screenSize.height / 1.3,
                                  width: screenSize.width / 1,
                                  child: model.data.isEmpty
                                      ? GifAnimation()
                                      : ListView(
                                          children: [
                                            ShiftReportTable(data: model.data),
                                          ],
                                        ),
                                ),
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
