import 'package:dashboard/model/classCodeScreen.dart';
import 'package:dashboard/screens/anmtiongif.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PurcheseTable extends StatefulWidget {
  final List data;

  const PurcheseTable({Key? key, required this.data}) : super(key: key);

  @override
  State<PurcheseTable> createState() => _PurcheseTableState();
}

class _PurcheseTableState extends State<PurcheseTable> {
  @override
  void initState() {
    super.initState();
    Provider.of<ReportPurcheseModel>(context, listen: false).selectedRows =
        List.generate(widget.data.length, (index) => false);
    Provider.of<ReportPurcheseModel>(context, listen: false).loadMoreData();

    Provider.of<ReportPurcheseModel>(context, listen: false).dataPagesNubmer();
  }



  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Consumer<ReportPurcheseModel>(
      builder: (context, model, child) {
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
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
              model.displayedData.isEmpty
                  ? GifAnimation()
                  : Column(
                      children: [
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DataTable(
                              onSelectAll: (value) {
                                model.disableSelectAll = value!;
                              },
                              headingRowColor: MaterialStateColor.resolveWith(
                                (states) {
                                  return const Color.fromARGB(
                                      118, 187, 210, 221);
                                },
                              ),
                              columns: const <DataColumn>[
                                DataColumn(
                                  label: Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text('الكود',
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
                                        Text('التاريخ',
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
                                        Text('المورد',
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
                                        Text('كاش',
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
                                        Text('اسم المورد',
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
                                        Text('فيزا',
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
                                        Text('اجل',
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
                                        Text('خصم',
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
                                        Text('اجمال',
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
                                        Text('المستخدم',
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
                              rows: List<DataRow>.generate(
                                  model.displayedData.length, (index) {
                                final item = model.displayedData[index];
                                return DataRow(
                                    selected: model.selectedRowIndex == index,
                                    onSelectChanged: (isSelected) {
                                      setState(() {
                                        model.selectedRows[index] = isSelected!;

                                        if (isSelected) {
                                          model.selectedRowIndex = index;
                                          model.disableSelectAll =
                                              true; // Disable "Select All"
                                        } else {
                                          model.selectedRowIndex = -1;
                                          model.disableSelectAll = model
                                              .selectedRows
                                              .every((selected) => !selected);
                                        }
                                      });
                                      if (isSelected!) {
                                        model.showBottomSheet(context,
                                            item); // Show the bottom sheet with the selected row data
                                      }
                                    },
                                    cells: [
                                      DataCell(
                                        Center(
                                          child: Text(
                                            "${item.id}",
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
                                            "${item.invoiceDate}",
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
                                            "${item.supplierName}",
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
                                            "${item.cash}",
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
                                            item.visa.toString(),
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
                                            "${item.later}",
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
                                            "${item.tax}",
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
                                            "${item.discount}",
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
                                            "${item.total}",
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
                                            "${item.userName}",
                                            style: const TextStyle(
                                              color: Colors.grey,
                                              fontFamily: 'arabic',
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ]);
                              })),
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
                                    icon:
                                        const Icon(Icons.arrow_forward_rounded),
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
