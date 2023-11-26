import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomerAccountTableinfo extends StatelessWidget {
  List<dynamic> data;

  CustomerAccountTableinfo({
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
              label: Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('كود العمليه',
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
                   Text('تاريخ العمليه',
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
              label:Expanded(
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
                   Text('اسم العميل',
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
                   Text('كود العميل',
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
                    child: Text(data[index].invoiceDate.toString(),
                    style: const TextStyle(
                        color: Colors.grey, fontFamily: 'arabic', fontSize: 18)),
                  ),
                ),
                DataCell(
                  Center(
                    child: Text(data[index].debt.toString(),
                    style: const TextStyle(
                        color: Colors.grey, fontFamily: 'arabic', fontSize: 18)),
                  ),
                ),
                DataCell(
                  Center(
                    child: Text(data[index].credit.toString(),
                    style: const TextStyle(
                        color: Colors.grey, fontFamily: 'arabic', fontSize: 18)),
                  ),
                ),
                DataCell(
                  Center(
                    child: Text(data[index].balance.toString(),
                    style: const TextStyle(
                        color: Colors.grey, fontFamily: 'arabic', fontSize: 18)),
                  ),
                ),
                DataCell(
                  Center(
                    child: Text(data[index].type.toString(),
                    style: const TextStyle(
                        color: Colors.grey, fontFamily: 'arabic', fontSize: 18)),
                  ),
                ),
                DataCell(
                  Center(
                    child: Text(data[index].customerName.toString(),
                    style: const TextStyle(
                        color: Colors.grey, fontFamily: 'arabic', fontSize: 18)),
                  ),
                ),
                DataCell(
                  Center(
                    child: Text(data[index].customerId.toString(),
                    style: const TextStyle(
                        color: Colors.grey, fontFamily: 'arabic', fontSize: 18)),
                  ),
                ),
              ],
              color: MaterialStateColor.resolveWith((states) {
                if (data[index].isInvoice == true) {
                  return Colors.white;
                } else {
                  return Colors.greenAccent; // Alternating row colors
                }
              }),
            ),
          ),
        ),
      ),
    );
  }
}
