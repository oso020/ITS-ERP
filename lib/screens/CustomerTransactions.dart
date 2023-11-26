import 'package:dashboard/model/classCodeScreen.dart';
import 'package:dashboard/screens/anmtiongif.dart';
import 'package:dashboard/screens/main_screen.dart';
import 'package:dashboard/widgets/CustomerTransactionsTable.dart';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';


class CustomerTransactions extends StatefulWidget {
  const CustomerTransactions({super.key});

  @override
  State<CustomerTransactions> createState() => _CustomerTransactionsState();
}

class _CustomerTransactionsState extends State<CustomerTransactions> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Consumer<CustomerTransactionsScreenModel>(
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            centerTitle: true,
            title: const Text(
              'مدفوعات عملاء',
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
                        model.isClicked = true;
                        model.backButton = !model.backButton;
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
                                          model.isChecked = false;
                                          model.isUserEnable = false;
                                        } else {
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
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Row(
                                    children: [
                                      Checkbox(
                                        activeColor: Colors.blueGrey,
                                        value: model.isChecked,
                                        onChanged: (newValue) {
                                          setState(() {
                                            model.isChecked = newValue!;
                                            if (model.isChecked == true) {
                                              model.getItemHomedata();
                                              model.showAll = false;
                                              model.isUserEnable = true;
                                            }
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  SizedBox(
                                    height: 68,
                                    width: 250,
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
                                      hint: const Text('اختيار محدد'),
                                      disabledHint:
                                          const Text(' غير متاح عميل محدد'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              width: isPortrait
                                  ? screenSize.width * 0.6
                                  : screenSize.width * 0.2,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    model.GetData();
                                    setState(() {
                                      model.isClicked = !model.isClicked;
                                      model.backButton = !model.backButton;
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
                                  onChanged: (value) =>
                                      model.updateListSearch(value.toString()),
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
                            :ListView(
                                children: [
                                  CustomerTransactionsTable(
                                      data: model.displayData)
                                ],
                              ),
                            ),
                          ],
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
