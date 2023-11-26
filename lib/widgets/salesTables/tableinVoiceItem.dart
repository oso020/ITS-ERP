import 'package:dashboard/model/classCodeScreen.dart';
import 'package:dashboard/model/model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InvoiceItemTable extends StatefulWidget {
  final ReportScreenSales data;

  const InvoiceItemTable({Key? key, required this.data}) : super(key: key);

  @override
  State<InvoiceItemTable> createState() => _InvoiceItemTableState();
}

class _InvoiceItemTableState extends State<InvoiceItemTable> {
  @override


  @override
  Widget build(BuildContext context) {
     final screenSize = MediaQuery.of(context).size;
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Consumer<ReportSalesModel>(
      builder: (context, model, child) {
        return 
                      model.dataTable.isEmpty?
SizedBox(
   height: screenSize.height / 1.2,
                          width: screenSize.width / 1,
  child:   Center(
  
                                  child: SizedBox(
  
                                    height: screenSize.height / 2,
  
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
          scrollDirection: Axis.horizontal,
          child: DataTable(
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
                      Text('الاسم',
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('الكميه',
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('السعر',
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('الخدمه',
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('الضريبه',
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('الاجمالي',
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
            rows: model.dataTable.map((row) {
              return DataRow(cells: [
              
                 DataCell(
                  Center(
                      child: Text(
                    row.name,
                    style: const TextStyle(
                        color: Colors.grey, fontFamily: 'arabic', fontSize: 18),
                  )),
                ),
                 DataCell(
                  Center(
                      child: Text(
                    "${row.qty}",
                    style: const TextStyle(
                        color: Colors.grey, fontFamily: 'arabic', fontSize: 18),
                  )),
                ),
                 DataCell(
                  Center(
                      child: Text(
                    "${row.salesPrice}",
                    style: const TextStyle(
                        color: Colors.grey, fontFamily: 'arabic', fontSize: 18),
                  )),
                ),
                 DataCell(
                  Center(
                      child: Text(
                    "${row.service}",
                    style: const TextStyle(
                        color: Colors.grey, fontFamily: 'arabic', fontSize: 18),
                  )),
                ),
                 DataCell(
                  Center(
                      child: Text(
                    "${row.tax}",
                    style: const TextStyle(
                        color: Colors.grey, fontFamily: 'arabic', fontSize: 18),
                  )),
                ),
              
                 DataCell(
                  Center(
                      child: Text(
                    "${row.total}",
                    style: const TextStyle(
                        color: Colors.grey, fontFamily: 'arabic', fontSize: 18),
                  )),
                ),
                
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
              ]);
            }).toList(),
          ),
        );
      },
    );
  }
}
