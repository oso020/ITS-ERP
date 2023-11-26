import 'package:dashboard/model/classCodeScreen.dart';
import 'package:dashboard/model/model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class TablereturnInvoicesales extends StatelessWidget {
  ReportScreenReturnSales data;

  TablereturnInvoicesales({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ReportreturnSalesModel>(
      builder: (context, model, child) {
        return SingleChildScrollView(
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
               label:Expanded(
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
                label:Expanded(
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
                 label:Expanded(
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
                label:Expanded(
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
               label:Expanded(
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
          rows: model.dataTable.map((rowData) {
            return DataRow(
              cells: [
                DataCell(
                  Center(
                    child: Text(rowData.name,
                    style: const TextStyle(
                        color: Colors.grey, fontFamily: 'arabic', fontSize: 18)),
                  ),
                ),
                DataCell(
                  Center(child: Text("${rowData.qty}",
                    style: const TextStyle(
                        color: Colors.grey, fontFamily: 'arabic', fontSize: 18))),
                ),
                DataCell(
                  Center(child: Text("${rowData.price}",
                    style: const TextStyle(
                        color: Colors.grey, fontFamily: 'arabic', fontSize: 18))),
                ),
                DataCell(
                  Center(child: Text("${rowData.service}",
                    style: const TextStyle(
                        color: Colors.grey, fontFamily: 'arabic', fontSize: 18))),
                ),
                DataCell(
                  Center(child: Text("${rowData.tax}",
                    style: const TextStyle(
                        color: Colors.grey, fontFamily: 'arabic', fontSize: 18))),
                ),
                DataCell(
                  Center(child: Text("${rowData.total}",
                    style: const TextStyle(
                        color: Colors.grey, fontFamily: 'arabic', fontSize: 18))),
                ),
           
             
              ],
            );
          }).toList(),
       
       
       
       
       
       
       
        ),
      ),
    );
  
  
  
      },
    );
  }
}
