import 'package:flutter/material.dart';

class GetSupplierAccountByIdTable extends StatelessWidget {
  final List<dynamic> data;

  GetSupplierAccountByIdTable({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
          ),
        ),
        child: DataTable(
           headingRowColor: MaterialStateColor.resolveWith(
          (states) {
            return const Color.fromARGB(118, 187, 210, 221);
          },
        ),
          columns: const <DataColumn>[
            DataColumn(
              label:Expanded(
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
              label: Expanded(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Text('تاريخ الفاتوره',
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
                   Text('دائن',
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
                   Text('مدين',
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
                   Text('الرصيد',
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
                   Text('النوع',
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
          rows: [
            for (int i = 0; i < data.length; i++)
              DataRow(
                color: MaterialStateProperty.all(
                  data[i].isInvoice == true ? Colors.white : Colors.greenAccent,
                ),
                cells: [
                  DataCell(
                    Center(
                      child: Text(data[i].id.toString(),
                    style: const TextStyle(
                        color: Colors.grey, fontFamily: 'arabic', fontSize: 18)),
                    ),
                  ),
                  DataCell(
                    Center(child: Text(data[i].invoiceDate.toString(),
                    style: const TextStyle(
                        color: Colors.grey, fontFamily: 'arabic', fontSize: 18))),
                  ),
                  DataCell(
                    Center(child: Text(data[i].debt.toString(),
                    style: const TextStyle(
                        color: Colors.grey, fontFamily: 'arabic', fontSize: 18))),
                  ),
                  DataCell(
                    Center(child: Text(data[i].credit.toString(),
                    style: const TextStyle(
                        color: Colors.grey, fontFamily: 'arabic', fontSize: 18))),
                  ),
                  DataCell(
                    Center(child: Text(data[i].balance.toString(),
                    style: const TextStyle(
                        color: Colors.grey, fontFamily: 'arabic', fontSize: 18))),
                  ),
                  DataCell(
                    Center(child: Text(data[i].type.toString(),
                    style: const TextStyle(
                        color: Colors.grey, fontFamily: 'arabic', fontSize: 18))),
                  ),
                  DataCell(
                    Center(child: Text(data[i].supplierName.toString(),
                    style: const TextStyle(
                        color: Colors.grey, fontFamily: 'arabic', fontSize: 18))),
                  ),
                  DataCell(
                    Center(child: Text(data[i].supplierId.toString(),
                    style: const TextStyle(
                        color: Colors.grey, fontFamily: 'arabic', fontSize: 18))),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
