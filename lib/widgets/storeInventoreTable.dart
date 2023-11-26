import 'package:dashboard/model/classCodeScreen.dart';
import 'package:dashboard/screens/anmtiongif.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class StoreInventoreTable extends StatefulWidget {
  List<dynamic> data;

  StoreInventoreTable({Key? key, required this.data}) : super(key: key);

  @override
  State<StoreInventoreTable> createState() => _StoreInventoreTableState();
}

class _StoreInventoreTableState extends State<StoreInventoreTable> {
  void initState() {
    super.initState();

    Provider.of<StoreInventoreScreenModel>(context, listen: false)
        .loadMoreData();

    Provider.of<StoreInventoreScreenModel>(context, listen: false)
        .dataPagesNubmer();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Consumer<StoreInventoreScreenModel>(
      builder: (context, model, child) {
        return 
             
          
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          
          child: 


          
          Column(
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
           
         model.display.isEmpty
                  ? const GifAnimation()
                  :
           Column(
children: [
     SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  child: DataTable(
                    headingRowColor: MaterialStateColor.resolveWith(
                      (states) {
                        return const Color.fromARGB(118, 187, 210, 221);
                      },
                    ),
                    columns: const <DataColumn>[
                      DataColumn(
                        label: Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('كود الوحده',
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
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('اسم الوحده',
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
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
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
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('اسم المخزن',
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
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('الكميه المتاحه',
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
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('المبيعات',
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
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('المشتريات',
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
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('راس المال',
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
                    rows: List<DataRow>.generate(model.display.length, (index) {
                      final data = model.display[index];

                      return DataRow(
                        cells: [
                          DataCell(
                            Center(
                              child: Text("${data.itemUnitId}",
                                  style: const TextStyle(
                                      color: Colors.grey,
                                      fontFamily: 'arabic',
                                      fontSize: 18)),
                            ),
                          ),
                          DataCell(
                            Center(
                              child: Text(data.itemName.toString(),
                                  style: const TextStyle(
                                      color: Colors.grey,
                                      fontFamily: 'arabic',
                                      fontSize: 18)),
                            ),
                          ),
                          DataCell(
                            Center(
                              child: Text(data.barcode.toString(),
                                  style: const TextStyle(
                                      color: Colors.grey,
                                      fontFamily: 'arabic',
                                      fontSize: 18)),
                            ),
                          ),
                          DataCell(
                            Center(
                              child: Text(data.storeName.toString(),
                                  style: const TextStyle(
                                      color: Colors.grey,
                                      fontFamily: 'arabic',
                                      fontSize: 18)),
                            ),
                          ),
                          DataCell(
                            Center(
                              child: Text(data.availableQty.toString(),
                                  style: const TextStyle(
                                      color: Colors.grey,
                                      fontFamily: 'arabic',
                                      fontSize: 18)),
                            ),
                          ),
                          DataCell(
                            Center(
                              child: Text(data.sales.toString(),
                                  style: const TextStyle(
                                      color: Colors.grey,
                                      fontFamily: 'arabic',
                                      fontSize: 18)),
                            ),
                          ),
                          DataCell(
                            Center(
                              child: Text(data.purchases.toString(),
                                  style: const TextStyle(
                                      color: Colors.grey,
                                      fontFamily: 'arabic',
                                      fontSize: 18)),
                            ),
                          ),
                          DataCell(
                            Center(
                              child: Text(data.capital.toString(),
                                  style: const TextStyle(
                                      color: Colors.grey,
                                      fontFamily: 'arabic',
                                      fontSize: 18)),
                            ),
                          ),
                        ],
                      );
                    }),
                  ),
                ),
              ),
              model.showAll == false
                  ? const SizedBox()
                  : Row(
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
           )
           
           
            ],
          ),
        );
      },
    );
  }
}
