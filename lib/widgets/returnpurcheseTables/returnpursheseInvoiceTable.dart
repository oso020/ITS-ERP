// ignore_for_file: must_be_immutable

import 'package:dashboard/model/classCodeScreen.dart';
import 'package:dashboard/model/model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReportreturnPurcheseTable extends StatelessWidget {
  ReportScreenReturnPurchese data;
  ReportreturnPurcheseTable({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Consumer<ReportreturnPurcheseModel>(
      builder: (context, value, child) {
        return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
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
        rows: [
          ...value.dataTable.map((row) => DataRow(
                cells: [
                  DataCell(
                    Center(child: Text(row.name,style: const TextStyle(
                        color: Colors.grey, fontFamily: 'arabic', fontSize: 18))),
                  ),
                  DataCell(
                    Center(child: Text(row.qty.toString(),style: const TextStyle(
                        color: Colors.grey, fontFamily: 'arabic', fontSize: 18))),
                  ),
                  DataCell(
                    Center(child: Text(row.price.toString(),style: const TextStyle(
                        color: Colors.grey, fontFamily: 'arabic', fontSize: 18))),
                  ),
                  DataCell(
                    Center(child: Text(row.service.toString(),style: const TextStyle(
                        color: Colors.grey, fontFamily: 'arabic', fontSize: 18))),
                  ),
                  DataCell(
                    Center(child: Text(row.tax.toString(),style: const TextStyle(
                        color: Colors.grey, fontFamily: 'arabic', fontSize: 18))),
                  ),
                  DataCell(
                    Center(child: Text(row.total.toString(),style: const TextStyle(
                        color: Colors.grey, fontFamily: 'arabic', fontSize: 18))),
                  ),
             
                ],
              )),
        ],
      ),
    );
  
  
  
  
      },
    );
  }
}
