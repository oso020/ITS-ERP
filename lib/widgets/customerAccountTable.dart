import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomerAccountTable extends StatelessWidget {
  List<dynamic> data;

  CustomerAccountTable({Key? key, required this.data})
      : super(key: key);

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
          columnSpacing: 10.0,
          columns: 
            const <DataColumn>[
                  DataColumn(
                    label:Expanded(
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
                    label:Expanded(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Text('حد ائتمان',
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
                   Text('دائم',
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
                    label:Expanded(
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
          rows: List.generate(data.length, (index) {
            return DataRow(
              cells: 
                    [
                      DataCell(
                        Center(
                          child: Text("${data[index].customerId}",
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
                          child: Text(data[index].phone.toString(),
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
                          child: Text(data[index].address.toString(),
                    style: const TextStyle(
                        color: Colors.grey, fontFamily: 'arabic', fontSize: 18)),
                        ),
                      ),
                      DataCell(
                        Center(
                          child: Text(data[index].note.toString(),
                    style: const TextStyle(
                        color: Colors.grey, fontFamily: 'arabic', fontSize: 18)),
                        ),
                      ),
                      DataCell(
                        Center(
                          child: Text(data[index].creditLimit.toString(),
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
                          child: Text(data[index].invCount.toString(),
                    style: const TextStyle(
                        color: Colors.grey, fontFamily: 'arabic', fontSize: 18)),
                        ),
                      ),
                    ],
            );
          }),
        ),
      ),
    );
  }
}