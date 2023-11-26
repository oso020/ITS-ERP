import 'package:dashboard/model/classCodeScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PagntionTable extends StatefulWidget {
  final List<dynamic> data;

  const PagntionTable({super.key, required this.data});

  @override
  State<PagntionTable> createState() => _PagntionTableState();
}

class _PagntionTableState extends State<PagntionTable> {
  @override
  void initState() {
    super.initState();
    Provider.of<ReportSalesModel>(context, listen: false).selectedRows =
        List.generate(widget.data.length, (index) => false);
    // Initialize the selectedRows list with false values for each row
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ReportSalesModel>(
      builder: (context, value, child) {
        return PaginatedDataTable(
          rowsPerPage: 10,
          columns: const [
            // Define your DataColumn widgets here as you did before
            DataColumn(
              label: Text(
                "الكود",
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'arabic',
                    fontSize: 18),
              ),
            ),
            DataColumn(
              label: Text(
                "التاريخ",
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'arabic',
                    fontSize: 18),
              ),
            ),
            DataColumn(
              label: Text(
                "العميل",
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'arabic',
                    fontSize: 18),
              ),
            ),
            DataColumn(
              label: Text(
                "نقدي",
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'arabic',
                    fontSize: 18),
              ),
            ),
            DataColumn(
              label: Text(
                "فيزا",
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'arabic',
                    fontSize: 18),
              ),
            ),
            DataColumn(
              label: Text(
                "اجل",
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'arabic',
                    fontSize: 18),
              ),
            ),
            DataColumn(
              label: Text(
                "ضريبه",
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'arabic',
                    fontSize: 18),
              ),
            ),
            DataColumn(
              label: Text(
                "خدمه",
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'arabic',
                    fontSize: 18),
              ),
            ),
            DataColumn(
              label: Text(
                "الخصم",
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'arabic',
                    fontSize: 18),
              ),
            ),
            DataColumn(
              label: Text(
                "الاجمالي",
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'arabic',
                    fontSize: 18),
              ),
            ),
            DataColumn(
              label: Text(
                "المستخدم",
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'arabic',
                    fontSize: 18),
              ),
            ),
            DataColumn(
              label: Text(
                "الدليفري",
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'arabic',
                    fontSize: 18),
              ),
            ),
            DataColumn(
              label: Text(
                "الفتره",
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'arabic',
                    fontSize: 18),
              ),
            ),
            DataColumn(
              label: Text(
                "النوع",
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'arabic',
                    fontSize: 18),
              ),
            ),
          ],
          source: MyData(data: widget.data,reportSalesModel: ReportSalesModel()),
        );
      },
    );
  }
}

class MyData extends DataTableSource {
  final List<dynamic> data;
    final ReportSalesModel reportSalesModel;


  MyData({required this.data, required this.reportSalesModel});
  

  @override
  DataRow? getRow(int index) {
    if (index >= data.length) {
      return null;
    }

    final item = data[index];
  
    return DataRow(
      cells: [
        DataCell(
          Center(
            child: Text(
              "${item.id}",
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
              item.date.toString(),
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
              item.customer,
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
            child: Container(
              height: 40,
              width: 80,
              decoration: BoxDecoration(
                color: Colors.green[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  "${item.cash}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'arabic',
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
        ),
        DataCell(
          Center(
            child: Text(
              "${item.visa}",
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
              "${item.later}",
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
              "${item.tax}",
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
              "${item.service}",
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
              "${item.discount}",
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
              "${item.invoiceTotal}",
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
              item.userName,
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
              item.deleviry,
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
              item.shift,
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
              item.invType,
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
  
  
  
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => 0;
}
