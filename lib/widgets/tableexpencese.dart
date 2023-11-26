import 'package:dashboard/model/classCodeScreen.dart';
import 'package:dashboard/screens/anmtiongif.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReportexpencieseTable extends StatefulWidget {
  final List data;

  const ReportexpencieseTable({Key? key, required this.data}) : super(key: key);

  @override
  State<ReportexpencieseTable> createState() => _ReportexpencieseTableState();
}

class _ReportexpencieseTableState extends State<ReportexpencieseTable> {
  void initState() {
    super.initState();

    Provider.of<ReportExpencieseModel>(context, listen: false).selectedRows =
        List.generate(widget.data.length, (index) => false);

    Provider.of<ReportExpencieseModel>(context, listen: false).loadMoreData();

    Provider.of<ReportExpencieseModel>(context, listen: false).dataPagesNubmer();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Consumer<ReportExpencieseModel>(builder: (context, model, child) {

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


          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              child: Column(
                children: [

                  DataTable(
                    headingRowColor: MaterialStateColor.resolveWith(
                          (states) {
                        return const Color.fromARGB(118, 187, 210, 221);
                      },
                    ),
                    columns: const <DataColumn>[
                      DataColumn(
                        label: Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('كود المصروف',
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
                        label:Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('المدفوع',
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
                        label:Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
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
                        label:Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('ملاحظه',
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
                        label:Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
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
                        label:Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('اسم المصروف',
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
                        label:Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('اسم المستخدم',
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
                        label:Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('كود الفتره',
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
                        label:Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('اسم الخزينه',
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
                        label:Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('كود الخزينه',
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
                    rows:  List.generate(
                      model.displayedData.length,
                          (index) {
                        final rowData =  model.displayedData[index];
                        return DataRow(
                          cells: [
                            DataCell(
                              Center(
                                child: Text(
                                  "${rowData.expensesId}",
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
                                  "${rowData.payment}",
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
                                  "${rowData.date}",
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
                                  "${rowData.note}",
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
                                  "${rowData.safeName}",
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
                                  "${rowData.expensesName}",
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
                                  "${rowData.userName}",
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
                                  "${rowData.sheftId}",
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
                                  "${rowData.safeId}",
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
                                  "${rowData.safeName}",
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontFamily: 'arabic',
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    )

                  ),

                ],
              ),
            ),

          ),
         
            model.displayedData.isEmpty
                ? const GifAnimation()
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
      );



    },);

  }
}
