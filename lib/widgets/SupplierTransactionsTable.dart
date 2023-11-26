import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SupplierTransactionsTable extends StatelessWidget {
  List<dynamic> data;

  SupplierTransactionsTable({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              label:Expanded(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
              label: Expanded(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Text('الخزينه',
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
                  mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Text('نوع العمليه',
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
              label: Expanded(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Text('كود المورد',
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
            data.length,
            (index) => DataRow(
              cells: [
                DataCell(
                  Center(
                    child: Text(data[index].id.toString(),
                    style: const TextStyle(
                        color: Colors.grey, fontFamily: 'arabic', fontSize: 18)),
                  ),
                ),
                DataCell(
                  Center(
                    child: Text(data[index].supplierName.toString(),
                    style: const TextStyle(
                        color: Colors.grey, fontFamily: 'arabic', fontSize: 18)),
                  ),
                ),
                DataCell(
                  Center(
                    child: Text(data[index].qty.toString(),
                    style: const TextStyle(
                        color: Colors.grey, fontFamily: 'arabic', fontSize: 18)),
                  ),
                ),
                DataCell(
                  Center(
                    child: Text(data[index].userName.toString(),
                    style: const TextStyle(
                        color: Colors.grey, fontFamily: 'arabic', fontSize: 18)),
                  ),
                ),
                DataCell(
                  Center(
                    child: Text(data[index].safe.toString(),
                    style: const TextStyle(
                        color: Colors.grey, fontFamily: 'arabic', fontSize: 18)),
                  ),
                ),
                DataCell(
                  Center(
                    child: Text(data[index].date.toString(),
                    style: const TextStyle(
                        color: Colors.grey, fontFamily: 'arabic', fontSize: 18)),
                  ),
                ),
                DataCell(
                  Center(
                    child: Text(data[index].transactionType.toString(),
                    style: const TextStyle(
                        color: Colors.grey, fontFamily: 'arabic', fontSize: 18)),
                  ),
                ),
                DataCell(
                  Center(
                    child: Text(data[index].sheftId.toString(),
                    style: const TextStyle(
                        color: Colors.grey, fontFamily: 'arabic', fontSize: 18)),
                  ),
                ),
                DataCell(
                  Center(
                    child: Text(data[index].supplierId.toString(),
                    style: const TextStyle(
                        color: Colors.grey, fontFamily: 'arabic', fontSize: 18)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}