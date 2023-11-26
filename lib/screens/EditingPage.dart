// ignore_for_file: use_build_context_synchronously, unused_local_variable

import 'package:dashboard/model/classCodeScreen.dart';
import 'package:dashboard/screens/anmtiongif.dart';
import 'package:dashboard/screens/main_screen.dart';
import 'package:dashboard/widgets/itemMangementable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class EditingPage extends StatefulWidget {
  int id;
  EditingPage({super.key, required this.id});

  @override
  State<EditingPage> createState() => _EditingPageState();
}

class _EditingPageState extends State<EditingPage> {
  TextEditingController nameArabic = TextEditingController();
  TextEditingController? nameEnglish = TextEditingController();
  TextEditingController purschsePrice = TextEditingController();
  TextEditingController salesPrice = TextEditingController();
  TextEditingController gomlaPrice = TextEditingController();
  TextEditingController gomlahalfPrice = TextEditingController();
  TextEditingController lowPrice = TextEditingController();
  TextEditingController creditLimit = TextEditingController();
  TextEditingController? barCode = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    Provider.of<EditingPageModel>(context, listen: false).fetchData(
        widget.id,
        nameArabic,
        nameEnglish,
        purschsePrice,
        salesPrice,
        gomlaPrice,
        gomlahalfPrice,
        lowPrice,
        creditLimit,
        barCode);
  }

  @override
  void dispose() {
    super.dispose();
    nameArabic.dispose();
    nameEnglish!.dispose();
    purschsePrice.dispose();
    salesPrice.dispose();
    gomlaPrice.dispose();
    gomlahalfPrice.dispose();
    lowPrice.dispose();
    creditLimit.dispose();
    barCode!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    EditingPageModel appBarData =
        Provider.of<EditingPageModel>(context, listen: false);

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            backgroundColor: Colors.blueGrey,
            leading: widget.id == 0
                ? IconButton(
                    onPressed: () {
                      setState(() {
                         appBarData.selectedUnit = null;
                                appBarData.selectedCategories = null;
                      });
                      Navigator.pushReplacement(
                          context,
                          PageTransition(
                              type: PageTransitionType.leftToRight,
                              child: const MainScreen()));
                    },
                    icon: const Icon(Icons.arrow_back))
                : IconButton(
                    onPressed: () {
                      setState(() {
                        appBarData.selectedUnit = null;
                                appBarData.selectedCategories = null;

                      });

                      Navigator.pushReplacement(
                          context,
                          PageTransition(
                              type: PageTransitionType.leftToRight,
                              child: const ItemMangementable()));
                    },
                    icon: const Icon(Icons.arrow_back))),
        body: Consumer<EditingPageModel>(
          builder: (context, model, child) {
            return model.units.isEmpty && model.categories.isEmpty
                ? const GifAnimation()
                : SizedBox(
                    height: screenSize.height,
                    width: screenSize.width,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: SingleChildScrollView(
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  width: screenSize.width - 50,
                                  child: TextFormField(
                                      controller: nameArabic,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'حقل الاسم مطلوب';
                                        }
                                        return null;
                                      },
                                      decoration: const InputDecoration(
                                        labelText: 'الاسم عربي',
                                        border: OutlineInputBorder(),
                                      ),
                                      onTap: () async {
                                        setState(() {});
                                      }),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  width: screenSize.width - 50,
                                  child: TextFormField(
                                      // enabled: dateEnabled,
                                      controller: nameEnglish,
                                      decoration: const InputDecoration(
                                        labelText: 'الاسم انجليزي',
                                        border: OutlineInputBorder(),
                                      ),
                                      onTap: () async {}),
                                ),
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 100,
                                      width: screenSize.width / 2.5,
                                      child: DropdownButtonFormField<String>(
                                        validator: (value) {
                                          if (widget.id == 0) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'برجاء ادخال الوحده';
                                            }
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          border: const OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.transparent),
                                          ),
                                          filled: true,
                                          fillColor: Colors.grey[200],
                                        ),
                                        value: model.selectedUnit,
                                        hint: const Text("الوحدة"),
                                        onChanged: (value) {
                                          setState(() {
                                            model.selectedUnit = value!;
                                          });
                                        },
                                        items: model.units.map((item) {
                                          return DropdownMenuItem<String>(
                                            value: item.keys.first.toString(),
                                            child: Text(item.values.first),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    SizedBox(
                                      height: 100,
                                      width: screenSize.width / 2.3,
                                      child: DropdownButtonFormField<String>(
                                        validator: (value) {
                                          if (widget.id == 0) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'برجاء ادخال التصنيف';
                                            }
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          border: const OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.transparent),
                                          ),
                                          filled: true,
                                          fillColor: Colors.grey[200],
                                        ),
                                        value: model.selectedCategories,
                                        hint: const Text("التصنيف"),
                                        onChanged: (value) {
                                          setState(() {
                                            model.selectedCategories = value!;
                                          });
                                        },
                                        items: model.categories.map((item) {
                                          return DropdownMenuItem<String>(
                                            value: item.keys.first.toString(),
                                            child: Text(item.values.first),
                                          );
                                        }).toList(),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Checkbox(
                                      activeColor: Colors.blueGrey,
                                      value: model.isTax,
                                      onChanged: (newValue) {
                                        setState(() {
                                          model.isTax = newValue!;
                                        });
                                      },
                                    ),
                                    const Text("خاضع لخدمه او ضريبه"),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: SizedBox(
                                      width: screenSize.width / 2.3,
                                      child: TextFormField(
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'حقل الشراء مطلوب';
                                            }
                                            return null;
                                          },
                                          controller: purschsePrice,
                                          inputFormatters: <TextInputFormatter>[
                                            FilteringTextInputFormatter.allow(
                                                RegExp(r'^\d+\.?\d{0,2}')),
                                          ],
                                          keyboardType: const TextInputType
                                              .numberWithOptions(decimal: true),
                                          decoration: const InputDecoration(
                                            labelText: 'سعر الشراء',
                                            border: OutlineInputBorder(),
                                          ),
                                          onTap: () async {}),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: SizedBox(
                                      width: screenSize.width / 2.3,
                                      child: TextFormField(
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'حقل البيع مطلوب';
                                            }
                                            return null;
                                          },
                                          controller: salesPrice,
                                          inputFormatters: <TextInputFormatter>[
                                            FilteringTextInputFormatter.allow(
                                                RegExp(r'^\d+\.?\d{0,2}')),
                                          ],
                                          keyboardType: const TextInputType
                                              .numberWithOptions(decimal: true),
                                          decoration: const InputDecoration(
                                            labelText: 'سعر البيع',
                                            border: OutlineInputBorder(),
                                          ),
                                          onTap: () async {}),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: SizedBox(
                                      width: screenSize.width / 2.3,
                                      child: TextFormField(
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'حقل الجمله مطلوب';
                                            }
                                            return null;
                                          },
                                          controller: gomlaPrice,
                                          inputFormatters: <TextInputFormatter>[
                                            FilteringTextInputFormatter.allow(
                                                RegExp(r'^\d+\.?\d{0,2}')),
                                          ],
                                          keyboardType: const TextInputType
                                              .numberWithOptions(decimal: true),
                                          decoration: const InputDecoration(
                                            labelText: 'سعر الجمله',
                                            border: OutlineInputBorder(),
                                          ),
                                          onTap: () async {}),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: SizedBox(
                                      width: screenSize.width / 2.3,
                                      child: TextFormField(
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'حقل نصف الجمله مطلوب مطلوب';
                                            }
                                            return null;
                                          },
                                          controller: gomlahalfPrice,
                                          inputFormatters: <TextInputFormatter>[
                                            FilteringTextInputFormatter.allow(
                                                RegExp(r'^\d+\.?\d{0,2}')),
                                          ],
                                          keyboardType: const TextInputType
                                              .numberWithOptions(decimal: true),
                                          decoration: const InputDecoration(
                                            labelText: 'سعر النصف الجمله',
                                            border: OutlineInputBorder(),
                                          ),
                                          onTap: () async {}),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: SizedBox(
                                      width: screenSize.width / 2.3,
                                      child: TextFormField(
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'حقل اقل سعر مطلوب';
                                            }
                                            return null;
                                          },
                                          controller: lowPrice,
                                          inputFormatters: <TextInputFormatter>[
                                            FilteringTextInputFormatter.allow(
                                                RegExp(r'^\d+\.?\d{0,2}')),
                                          ],
                                          keyboardType: const TextInputType
                                              .numberWithOptions(decimal: true),
                                          decoration: const InputDecoration(
                                            labelText: 'اقل سعر',
                                            border: OutlineInputBorder(),
                                          ),
                                          onTap: () async {}),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: SizedBox(
                                      width: screenSize.width / 2.3,
                                      child: TextFormField(
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'حقل حد الائتمان مطلوب';
                                            }
                                            return null;
                                          },
                                          controller: creditLimit,
                                          inputFormatters: <TextInputFormatter>[
                                            FilteringTextInputFormatter.allow(
                                                RegExp(r'^\d+\.?\d{0,2}')),
                                          ],
                                          keyboardType: const TextInputType
                                              .numberWithOptions(decimal: true),
                                          decoration: const InputDecoration(
                                            labelText: 'حد الائتمان',
                                            border: OutlineInputBorder(),
                                          ),
                                          onTap: () async {}),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: SizedBox(
                                      width: screenSize.width / 1.2,
                                      child: TextFormField(
                                          controller: barCode,
                                          decoration: const InputDecoration(
                                            labelText: 'البار كود',
                                            border: OutlineInputBorder(),
                                          ),
                                          onTap: () async {}),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 150,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      await model.addOrEdit(
                                          widget.id,
                                          context,
                                          nameArabic,
                                          nameEnglish,
                                          salesPrice,
                                          barCode,
                                          creditLimit,
                                          lowPrice,
                                          gomlaPrice,
                                          gomlahalfPrice,
                                          purschsePrice);

                                      setState(() {
                                        model.isLoading = true;

                                        model.isLoading = false;
                                      });
                                    }
                                  },
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.blueGrey),
                                    padding: MaterialStateProperty.all(
                                        const EdgeInsets.all(4)),
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8))),
                                  ),
                                  child: model.isLoading
                                      ? const Center(
                                          child: CircularProgressIndicator())
                                      : const Text(
                                          "حفظ",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
          },
        ));
  }
}
