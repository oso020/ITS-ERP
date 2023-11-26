import 'package:dashboard/screens/anmtiongif.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dashboard/model/classCodeScreen.dart';

class Table1 extends StatefulWidget {
  final List data;

  Table1({Key? key, required this.data}) : super(key: key);

  @override
  State<Table1> createState() => _Table1State();
}

class _Table1State extends State<Table1> {
  @override
  void initState() {
    super.initState();

    Provider.of<ReportSalesModel>(context, listen: false).selectedRows =
        List.generate(widget.data.length, (index) => false);

    Provider.of<ReportSalesModel>(context, listen: false).loadMoreData();

    Provider.of<ReportSalesModel>(context, listen: false).dataPagesNubmer();
  }


  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return Consumer<ReportSalesModel>(
      builder: (context, model, child) {
        return Column(
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
                        padding:
                            MaterialStateProperty.all(const EdgeInsets.all(4)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
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
                              return const Color.fromARGB(118, 187, 210, 221);
                            },
                          ),
                          columns: const [
                            DataColumn(
                              label: Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "الكود",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'arabic',
                                          fontSize: 18),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "التاريخ",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'arabic',
                                          fontSize: 18),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "العميل",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'arabic',
                                          fontSize: 18),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "نقدي",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'arabic',
                                          fontSize: 18),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "فيزا",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'arabic',
                                          fontSize: 18),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "اجل",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'arabic',
                                          fontSize: 18),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "ضريبه",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'arabic',
                                          fontSize: 18),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "خدمه",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'arabic',
                                          fontSize: 18),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "الخصم",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'arabic',
                                          fontSize: 18),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "الاجمالي",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'arabic',
                                          fontSize: 18),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "المستخدم",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'arabic',
                                          fontSize: 18),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "الدليفري",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'arabic',
                                          fontSize: 18),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "الفتره",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'arabic',
                                          fontSize: 18),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "النوع",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'arabic',
                                          fontSize: 18),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                          rows: List<DataRow>.generate(
                            model.displayedData.length,
                            (int index) {
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
                                          fontSize: 18),
                                    )),
                                    // Apply alignment to center the content in the cell
                                    // alignment: Alignment.center,
                                  ),
                                  DataCell(
                                    Center(
                                        child: Text(
                                      item.date.toString(),
                                      style: const TextStyle(
                                          color: Colors.grey,
                                          fontFamily: 'arabic',
                                          fontSize: 18),
                                    )),
                                    // alignment: Alignment.center,
                                  ),
                                  DataCell(
                                    Center(
                                        child: Text(
                                      item.customer,
                                      style: const TextStyle(
                                          color: Colors.grey,
                                          fontFamily: 'arabic',
                                          fontSize: 18),
                                    )),
                                  ),
                                  DataCell(
                                    Center(
                                      child: Container(
                                        height: 40,
                                        width: 80,
                                        decoration: BoxDecoration(
                                          color: item.cash > 0
                                              ? Colors.green[200]
                                              : null,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Center(
                                            child: Text(
                                          "${item.cash}",
                                          style: TextStyle(
                                              color: item.cash > 0
                                                  ? Colors.white
                                                  : Colors.grey,
                                              fontFamily: 'arabic',
                                              fontSize: 18),
                                        )),
                                      ),
                                    ),
                                    // Set the background color for the "نقدي" column
                                  ),
                                  DataCell(
                                    Center(
                                        child: Text(
                                      "${item.visa}",
                                      style: const TextStyle(
                                          color: Colors.grey,
                                          fontFamily: 'arabic',
                                          fontSize: 18),
                                    )),
                                  ),
                                  DataCell(
                                    Center(
                                      child: Container(
                                        height: 40,
                                        width: 80,
                                        decoration: BoxDecoration(
                                          color: item.later > 0
                                              ? const Color.fromARGB(
                                                  255, 227, 123, 123)
                                              : null,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Center(
                                            child: Text(
                                          "${item.later}",
                                          style: TextStyle(
                                              color: item.later > 0
                                                  ? Colors.white
                                                  : Colors.grey,
                                              fontFamily: 'arabic',
                                              fontSize: 18),
                                        )),
                                      ),
                                    ),
                                    // Set the background color for the "نقدي" column
                                  ),
                                  DataCell(
                                    Center(
                                        child: Text(
                                      "${item.tax}",
                                      style: const TextStyle(
                                          color: Colors.grey,
                                          fontFamily: 'arabic',
                                          fontSize: 18),
                                    )),
                                  ),
                                  DataCell(
                                    Center(
                                        child: Text(
                                      "${item.service}",
                                      style: const TextStyle(
                                          color: Colors.grey,
                                          fontFamily: 'arabic',
                                          fontSize: 18),
                                    )),
                                  ),
                                  DataCell(
                                    Center(
                                        child: Text(
                                      "${item.discount}",
                                      style: const TextStyle(
                                          color: Colors.grey,
                                          fontFamily: 'arabic',
                                          fontSize: 18),
                                    )),
                                  ),
                                  DataCell(
                                    Center(
                                        child: Text(
                                      "${item.invoiceTotal}",
                                      style: const TextStyle(
                                          color: Colors.grey,
                                          fontFamily: 'arabic',
                                          fontSize: 18),
                                    )),
                                  ),
                                  DataCell(
                                    Center(
                                        child: Text(
                                      item.userName,
                                      style: const TextStyle(
                                          color: Colors.grey,
                                          fontFamily: 'arabic',
                                          fontSize: 18),
                                    )),
                                  ),
                                  DataCell(
                                    Center(
                                        child: Text(
                                      item.deleviry,
                                      style: const TextStyle(
                                          color: Colors.grey,
                                          fontFamily: 'arabic',
                                          fontSize: 18),
                                    )),
                                  ),
                                  DataCell(
                                    Center(
                                        child: Text(
                                      item.shift,
                                      style: const TextStyle(
                                          color: Colors.grey,
                                          fontFamily: 'arabic',
                                          fontSize: 18),
                                    )),
                                  ),
                                  DataCell(
                                    Center(
                                        child: Text(
                                      item.invType,
                                      style: const TextStyle(
                                          color: Colors.grey,
                                          fontFamily: 'arabic',
                                          fontSize: 18),
                                    )),
                                  ),
                                ],
                              );
                            },
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
        );
      },
    );
  }
}
