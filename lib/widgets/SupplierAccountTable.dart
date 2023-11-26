import 'package:flutter/material.dart';

class SupplierAccountTable extends StatelessWidget {
  final List<dynamic> data;

  SupplierAccountTable({
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
                   Text('رقم الموبيل',
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
                   Text('العنوان',
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
                   Text('ملاحظات',
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
              label:Expanded(
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
                   Text('عدد الفواتير',
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
             
                cells: [
                  DataCell(
                    Center(
                      child: Text(data[i].supplierId.toString(),
                    style: const TextStyle(
                        color: Colors.grey, fontFamily: 'arabic', fontSize: 18),),
                    ),
                  ),
                  DataCell(
                    Center(child: Text(data[i].supplierName.toString(),
                    style: const TextStyle(
                        color: Colors.grey, fontFamily: 'arabic', fontSize: 18),)),
                  ),
                  DataCell(
                    Center(child: Text(data[i].phone.toString(),
                    style: const TextStyle(
                        color: Colors.grey, fontFamily: 'arabic', fontSize: 18),)),
                  ),
                  DataCell(
                    Center(child: Text(data[i].address.toString(),
                    style: const TextStyle(
                        color: Colors.grey, fontFamily: 'arabic', fontSize: 18),)),
                  ),
                  DataCell(
                    Center(child: Text(data[i].note.toString(),
                    style: const TextStyle(
                        color: Colors.grey, fontFamily: 'arabic', fontSize: 18),)),
                  ),
                  DataCell(
                    Center(child: Text(data[i].debt.toString(),
                    style: const TextStyle(
                        color: Colors.grey, fontFamily: 'arabic', fontSize: 18),)),
                  ),
                  DataCell(
                    Center(child: Text(data[i].credit.toString(),
                    style: const TextStyle(
                        color: Colors.grey, fontFamily: 'arabic', fontSize: 18),)),
                  ),
                  DataCell(
                    Center(child: Text(data[i].balance.toString(),
                    style: const TextStyle(
                        color: Colors.grey, fontFamily: 'arabic', fontSize: 18),)),
                  ),
                  DataCell(
                    Center(child: Text(data[i].invCount.toString(),
                    style: const TextStyle(
                        color: Colors.grey, fontFamily: 'arabic', fontSize: 18),)),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
