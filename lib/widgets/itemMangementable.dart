import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Import your model and other dependencies
import 'package:dashboard/model/classCodeScreen.dart';
import 'package:dashboard/screens/EditingPage.dart';
import 'package:dashboard/screens/main_screen.dart';

class ItemMangementable extends StatefulWidget {
  const ItemMangementable({Key? key});

  @override
  State<ItemMangementable> createState() => _ItemMangementableState();
}

class _ItemMangementableState extends State<ItemMangementable> {
  

  // Function to change the current page
  

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1)).then((_) {
      Provider.of<ItemMangementableModel>(context, listen: false)
          .fetchData(context);
    });
     Provider.of<ItemMangementableModel>(context, listen: false).loadMoreData();

    Provider.of<ItemMangementableModel>(context, listen: false).dataPagesNubmer();
        super.initState();

  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
 final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    final appBarProvider =
        Provider.of<ItemMangementableModel>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'إداره اصناف',
          style: TextStyle(
            fontSize: 25,
            fontFamily: 'arabic',
            color: Colors.blueGrey,
          ),
        ),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => MainScreen(),
              ),
            );
            appBarProvider.displayData.clear();
            appBarProvider.data.clear();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.blueGrey,
          ),
        ),
      ),
      body: Consumer<ItemMangementableModel>(
        builder: (context, model, child) {
          return  SingleChildScrollView(
                  child: Column(
                    children: [
                 
                       Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: SizedBox(
                          height: 50,
                          width: screenSize.width / 1.4,
                          child: TextFormField(
                            controller: model.searchValueTable,
                            decoration: const InputDecoration(
                              labelText: ' بحث',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: isPortrait
                            ? screenSize.width / 4.5
                            : screenSize.width * 0.2,
                        height: 50,
                        child: ElevatedButton(
                            onPressed: () async {
                              model.search();
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                Colors.blueGrey,
                              ),
                              padding: MaterialStateProperty.all(
                                  const EdgeInsets.all(4)),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25))),
                            ),
                            child: const Icon(
                              Icons.search,
                              size: 30,
                            )),
                      ),
                    ],
                  ),
                 
                 
                 
                    model.displayData.isEmpty
              ? SizedBox(
                 height: screenSize.height / 1.2,
                          width: screenSize.width / 1,
                child: Center(
                    child: SizedBox(
                      height: screenSize.height / 2.5,
                      width: screenSize.width / 1.2,
                      child: const Image(
                          image: AssetImage(
                        'assets/invoice-animation-dribbble.gif',
                      )),
                    ),
                  ),
              )
              :
                      SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: model.displayData.isEmpty
                              ? Center(
                                  child: SizedBox(
                                    height: screenSize.height / 2.5,
                                    width: screenSize.width / 1.2,
                                    child: const Image(
                                        image: AssetImage(
                                      'assets/invoice-animation-dribbble.gif',
                                    )),
                                  ),
                                )
                              : DataTable(
                                  headingRowColor:
                                      MaterialStateColor.resolveWith(
                                    (states) {
                                      return const Color.fromARGB(
                                          118, 187, 210, 221);
                                    },
                                  ),
                                  columns:  const <DataColumn>[
                                    DataColumn(
                                      label: Expanded(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text('الاسم عربي',
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'arabic',
                                                    fontSize: 18)),
                                          ],
                                        ),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Expanded(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text('سعر الشراء',
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'arabic',
                                                    fontSize: 18)),
                                          ],
                                        ),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Expanded(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text('سعر البيع',
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'arabic',
                                                    fontSize: 18)),
                                          ],
                                        ),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Expanded(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text('الاسم اجنبي',
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'arabic',
                                                    fontSize: 18)),
                                          ],
                                        ),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Expanded(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text('الوحده',
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'arabic',
                                                    fontSize: 18)),
                                          ],
                                        ),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Expanded(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text('التصنيف',
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'arabic',
                                                    fontSize: 18)),
                                          ],
                                        ),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Expanded(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text('سعر الجمله',
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'arabic',
                                                    fontSize: 18)),
                                          ],
                                        ),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Expanded(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text('سعر نصف الجمله',
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'arabic',
                                                    fontSize: 18)),
                                          ],
                                        ),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Expanded(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text('اقل سعر',
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'arabic',
                                                    fontSize: 18)),
                                          ],
                                        ),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Expanded(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text('البار كود',
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'arabic',
                                                    fontSize: 18)),
                                          ],
                                        ),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Expanded(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text('خاضع للضريبه',
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'arabic',
                                                    fontSize: 18)),
                                          ],
                                        ),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Expanded(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text('عمليات',
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'arabic',
                                                    fontSize: 18)),
                 
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                  rows: List.generate(
                                 model.displayData.length,
                                    (index) {
                                      
                                      return DataRow(
                                        cells: [
                                          DataCell(
                                            Center(
                                              child: Text(
                                                "${model.displayData[index].arName}",
                                                style: const TextStyle(
                                                  color: Colors.grey,
                                                  fontFamily: 'arabic',
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ),
                                          ),
                                          DataCell(
                                            Center(
                                              child: Text(
                                                model.displayData[index]
                                                    .purchasePrice
                                                    .toString(),
                                                style: const TextStyle(
                                                  color: Colors.grey,
                                                  fontFamily: 'arabic',
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ),
                                          ),
                                          DataCell(
                                            Center(
                                              child: Text(
                                                model.displayData[index].salesPrice
                                                    .toString(),
                                                style: const TextStyle(
                                                  color: Colors.grey,
                                                  fontFamily: 'arabic',
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ),
                                          ),
                                          DataCell(
                                            Center(
                                              child: Text(
                                                model.displayData[index].enName
                                                    .toString(),
                                                style: const TextStyle(
                                                  color: Colors.grey,
                                                  fontFamily: 'arabic',
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ),
                                          ),
                                          DataCell(
                                            Center(
                                              child: Text(
                                                model.displayData[index].unitName
                                                    .toString(),
                                                style: const TextStyle(
                                                  color: Colors.grey,
                                                  fontFamily: 'arabic',
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ),
                                          ),
                                          DataCell(
                                            Center(
                                              child: Text(
                                                model
                                                    .displayData[index].categoryName
                                                    .toString(),
                                                style: const TextStyle(
                                                  color: Colors.grey,
                                                  fontFamily: 'arabic',
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ),
                                          ),
                                          DataCell(
                                            Center(
                                              child: Text(
                                                model.displayData[index].gomlaPrice
                                                    .toString(),
                                                style: const TextStyle(
                                                  color: Colors.grey,
                                                  fontFamily: 'arabic',
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ),
                                          ),
                                          DataCell(
                                            Center(
                                              child: Text(
                                                model.displayData[index]
                                                    .halfGomlaPrice
                                                    .toString(),
                                                style: const TextStyle(
                                                  color: Colors.grey,
                                                  fontFamily: 'arabic',
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ),
                                          ),
                                          DataCell(
                                            Center(
                                              child: Text(
                                                model.displayData[index].leastPrice
                                                    .toString(),
                                                style: const TextStyle(
                                                  color: Colors.grey,
                                                  fontFamily: 'arabic',
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ),
                                          ),
                                          DataCell(
                                            Center(
                                              child: Text(
                                                model.displayData[index].barcode
                                                    .toString(),
                                                style: const TextStyle(
                                                  color: Colors.grey,
                                                  fontFamily: 'arabic',
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ),
                                          ),
                                          DataCell(
                                            Center(
                                              child: Text(
                                                model.displayData[index]
                                                    .isTaxAndService
                                                    .toString(),
                                                style: const TextStyle(
                                                  color: Colors.grey,
                                                  fontFamily: 'arabic',
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ),
                                          ),
                                          DataCell(
                                            Center(
                                              child: Row(
                                                children: [
                                                  IconButton(
                                                    icon: const Icon(
                                                      Icons.delete,
                                                      color: Colors.grey,
                                                      size: 20,
                                                    ),
                                                    onPressed: () {
                                                      model.showAlertDialog(
                                                        context,
                                                        model.displayData[index]
                                                            .itemUnitId,
                                                        model.displayData[index],
                                                      );
                                                    },
                                                  ),
                                                  IconButton(
                                                    icon: const Icon(
                                                      Icons.edit,
                                                      color: Colors.grey,
                                                      size: 20,
                                                    ),
                                                    onPressed: () {
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              EditingPage(
                                                            id: model
                                                                .displayData[index]
                                                                .itemUnitId,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                        ),
                      ),
                  
                  
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {
                                model.goToPage(model.currentPage + 1);
                              },
                              icon: const Icon(Icons.arrow_back_rounded),
                            ),
                            Text(
                                "صفحه ${model.currentPage} من ${model.totalPages}"),
                            IconButton(
                              onPressed: () {
                                model.goToPage(model.currentPage - 1);
                              },
                              icon: const Icon(Icons.arrow_forward_rounded),
                            ),
                          ],
                        ),
             
             

                    ],
                  ),
                );
        },
      ),
    );
  }
}
