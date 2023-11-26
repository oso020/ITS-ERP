// ignore_for_file: unused_local_variable, use_build_context_synchronously, avoid_single_cascade_in_expression_statements

import 'dart:convert';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:dashboard/Shared/snackBar.dart';
import 'package:dashboard/model/model.dart';
import 'package:dashboard/model/notification_service.dart';
import 'package:dashboard/screens/chartsSales.dart';
import 'package:dashboard/screens/main_screen.dart';

import 'package:dashboard/services/callApi.dart';
import 'package:dashboard/widgets/itemMangementable.dart';
import 'package:dashboard/widgets/purcheseTables/tablepurcheseInvoice.dart';
import 'package:dashboard/widgets/returnSales/tablereturnInvoicesales.dart';
import 'package:dashboard/widgets/salesTables/tableinVoiceItem.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../widgets/returnpurcheseTables/returnpursheseInvoiceTable.dart';

class ScreenLogicApi extends ChangeNotifier {
  String? userName;

  Future<String?> userNameToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    userName = prefs.getString('userName');

    return userName;
  }
}

class ReportExpencieseModel extends ChangeNotifier {
  bool isClicked = true;
  bool dateEnabled = true;
  bool backButton = true;
  bool isChecked = false;
  bool showAll = false;
  List<bool> selectedRows = [];
  int selectedRowIndex = -1;
  bool disableSelectAll = false;
  List<InvoiceItemTableModel> dataTable = [];
  dynamic currentPage = 1;
  int totalPages = 1;
  final int itemsPerPage = 15; // Number of items per page
  List<dynamic> displayedData = [];
  TextEditingController searchValueTable = TextEditingController();
  List<dynamic> data = [];

  void search() async {
    try {
      displayedData.clear();
      notifyListeners();
      dynamic jsonData = await ApiServices().fetchGetData(
          '/Expense/GetSearchExpensesReport/${searchValueTable.text}', null);

      displayedData = ReportScreenExpencese.fromJsonList(jsonData);
      currentPage = 1;
      notifyListeners();
    } catch (e) {
      currentPage = 1;
      displayedData = data;
      notifyListeners();
    }
  }

  void loadMoreData() {
    final startIndex = (currentPage - 1) * itemsPerPage;
    final endIndex = startIndex + itemsPerPage;

    if (startIndex >= data.length) {
      return; // No more data to load
    }

    final slicedData = data.sublist(startIndex, endIndex.clamp(0, data.length));

    displayedData = slicedData;
  }

  void goToPage(int page) async {
    if (page >= 1 && page <= totalPages) {
      currentPage = page;
      if (showAll == true) {
        dynamic jsonData = await ApiServices()
            .fetchGetData('/Expense/GetAllExpensesReport/$page', null);

        displayedData = ReportScreenExpencese.fromJsonList(jsonData);
      }
      loadMoreData();
    }
    notifyListeners();
  }

  dataPagesNubmer() async {
    dynamic jsonData = await ApiServices()
        .fetchGetData('/Expense/GetTableExpensesReport', null);
    totalPages = jsonData[0];
    notifyListeners();
  }

  Future<void> fetchData(TextEditingController? from, TextEditingController? to,
      TextEditingController? code) async {
    try {
      if (showAll == true) {
        dynamic jsonData = await ApiServices()
            .fetchGetData('/Expense/GetAllExpensesReport/$currentPage', null);

        data = ReportScreenExpencese.fromJsonList(jsonData);
      } else if (isChecked) {
        dynamic jsonData = await ApiServices().fetchGetData(
            '/Expense/GetExpensesReportByShiftId/${code!.text}', null);

        data = ReportScreenExpencese.fromJsonList(jsonData);
      } else {
        dynamic jsonData = await ApiServices().fetchGetData(
            '/Expense/GetExpensesReportBetweenDate/${from!.text}/${to!.text}',
            null);

        data = ReportScreenExpencese.fromJsonList(jsonData);
      }

      data;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}

class ReportPurcheseModel extends ChangeNotifier {
  bool isChecked = false;
  bool isClicked = true;
  bool dateEnabled = true;
  bool backButton = true;
  bool showAll = false;
  bool showloading = false;
  List<dynamic> data = [];
  List<bool> selectedRows = [];
  int selectedRowIndex = -1;
  bool disableSelectAll = false;
  List<TablepurcheseInvoiceModel> dataTable = [];
  dynamic currentPage = 1;
  int totalPages = 1;
  final int itemsPerPage = 15; // Number of items per page
  List<dynamic> displayedData = [];
  TextEditingController searchValueTable = TextEditingController();

  void search() async {
    try {
      displayedData.clear();
      notifyListeners();
      dynamic jsonData = await ApiServices().fetchGetData(
          '/Purchase/GetSearchPurchaseReport/${searchValueTable.text}', null);

      displayedData = ReportScreenPurchese.fromJsonList(jsonData);
      currentPage = 1;
      notifyListeners();
    } catch (e) {
      currentPage = 1;
      displayedData = data;
      notifyListeners();
    }
  }

  void loadMoreData() {
    final startIndex = (currentPage - 1) * itemsPerPage;
    final endIndex = startIndex + itemsPerPage;

    if (startIndex >= data.length) {
      return; // No more data to load
    }

    final slicedData = data.sublist(startIndex, endIndex.clamp(0, data.length));

    displayedData = slicedData;
  }

  void goToPage(int page) async {
    if (page >= 1 && page <= totalPages) {
      currentPage = page;
      if (showAll == true) {
        displayedData.clear();
        notifyListeners();
        dynamic jsonData = await ApiServices()
            .fetchGetData('/Purchase/GetAllPurchaseReport/$page', null);

        displayedData = ReportScreenPurchese.fromJsonList(jsonData);
      }
      loadMoreData();
    }
    notifyListeners();
  }

  dataPagesNubmer() async {
    dynamic jsonData = await ApiServices()
        .fetchGetData('/Purchase/GetTablePurchaseReport', null);
    totalPages = jsonData[0];
    notifyListeners();
  }

  Future<void> fetchData(TextEditingController? from, TextEditingController? to,
      TextEditingController? code) async {
    try {
      if (showAll == true) {
        dynamic jsonData = await ApiServices()
            .fetchGetData('/Purchase/GetAllPurchaseReport/$currentPage', null);
        data = ReportScreenPurchese.fromJsonList(jsonData);
        print(data);
      } else if (isChecked == true) {
        dynamic jsonData = await ApiServices().fetchGetData(
            '/Purchase/GetPurchaseReportById/${code!.text}', null);
        data = ReportScreenPurchese.fromJsonList(jsonData);
        print(data);
      } else {
        dynamic jsonData = await ApiServices().fetchGetData(
            '/Purchase/GetPurchaseReportBetweenDate/${from!.text}/${to!.text}',
            null);
        data = TablepurcheseInvoiceModel.fromJsonList(jsonData);
      }

      data;
      notifyListeners();
    } catch (e) {
      print("${e}");
    }
  }

  void showBottomSheet(
      BuildContext context, ReportScreenPurchese rowData) async {
    dynamic jsonData = await ApiServices()
        .fetchGetData('/Purchase/GetPurchaseItemsById/${rowData.id}', null);

    dataTable = TablepurcheseInvoiceModel.fromJsonList(jsonData);

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ListView(children: [
          Center(
            child: SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  dataTable.isEmpty
                      ? const Center(child: Text("لا توجد فواتير"))
                      : ReportPurcheseInvoiceTable(data: rowData)
                ],
              ),
            ),
          ),
        ]);
      },
    );
  }
}

class ReportreturnPurcheseModel extends ChangeNotifier {
  bool isChecked = false;
  bool isClicked = true;
  bool dateEnabled = true;
  bool backButton = true;
  bool showAll = false;
  bool showloading = false;

  List<dynamic> data = [];
  List<bool> selectedRows = [];
  int selectedRowIndex = -1;
  bool disableSelectAll = false;
  List<TabelreturnInvoicePurcheseModel> dataTable = [];
  dynamic currentPage = 1;
  int totalPages = 1;
  final int itemsPerPage = 15; // Number of items per page
  List<dynamic> displayedData = [];

  TextEditingController searchValueTable = TextEditingController();

  void search() async {
    try {
      displayedData.clear();
      notifyListeners();
      dynamic jsonData = await ApiServices().fetchGetData(
          '/Purchase/GetSearchPurchaseReturnReport/${searchValueTable.text}',
          null);

      displayedData = ReportScreenReturnPurchese.fromJsonList(jsonData);
      currentPage = 1;
      notifyListeners();
    } catch (e) {
      print(e);
      currentPage = 1;
      displayedData = data;
      notifyListeners();
    }
  }

  void loadMoreData() {
    final startIndex = (currentPage - 1) * itemsPerPage;
    final endIndex = startIndex + itemsPerPage;

    if (startIndex >= data.length) {
      return; // No more data to load
    }

    final slicedData = data.sublist(startIndex, endIndex.clamp(0, data.length));

    displayedData = slicedData;
  }

  void goToPage(int page) async {
    if (page >= 1 && page <= totalPages) {
      currentPage = page;
      displayedData.clear();
      notifyListeners();
      if (showAll == true) {
        dynamic jsonData = await ApiServices()
            .fetchGetData('/Purchase/GetAllPurchaseReturnReport/$page', null);

        displayedData = ReportScreenReturnPurchese.fromJsonList(jsonData);
      }
      loadMoreData();
    }
    notifyListeners();
  }

  dataPagesNubmer() async {
    dynamic jsonData = await ApiServices()
        .fetchGetData('/Purchase/GetTablePurchaseReturnReport', null);
    totalPages = jsonData[0];
    notifyListeners();
  }

  void showBottomSheet(
      BuildContext context, ReportScreenReturnPurchese rowData) async {
    dynamic jsonData = await ApiServices().fetchGetData(
        '/Purchase/GetPurchaseReturnsItemById/${rowData.id}', null);

    dataTable = TabelreturnInvoicePurcheseModel.fromJsonList(jsonData);

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ListView(children: [
          Center(
            child: SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  dataTable.isEmpty
                      ? const Center(child: Text("لا توجد فواتير"))
                      : ReportreturnPurcheseTable(data: rowData)
                ],
              ),
            ),
          ),
        ]);
      },
    );
  }

  Future<void> fetchData(
    TextEditingController? from,
    TextEditingController? to,
    TextEditingController? code,
  ) async {
    try {
      if (showAll == true) {
        dynamic jsonData = await ApiServices().fetchGetData(
            '/Purchase/GetAllPurchaseReturnReport/$currentPage', null);
        data = ReportScreenReturnPurchese.fromJsonList(jsonData);
      } else if (isChecked) {
        dynamic jsonData = await ApiServices().fetchGetData(
            '/Purchase/GetPurchaseReturnReportById/${code!.text}', null);
        data = ReportScreenReturnPurchese.fromJsonList(jsonData);
      } else {
        dynamic jsonData = await ApiServices().fetchGetData(
            '/Purchase/GetPurchaseReturnReportBetweenDate/${from!.text}/${to!.text}',
            null);
        data = ReportScreenReturnPurchese.fromJsonList(jsonData);
      }

      data;
      notifyListeners();
    } catch (e) {
      print("${e}");
    }
  }
}

class ReportreturnSalesModel extends ChangeNotifier {
  bool isChecked = false;
  bool isClicked = true;
  bool dateEnabled = true;
  bool backButton = true;
  bool showAll = false;
  bool showloading = false;

  List<dynamic> data = [];
  List<bool> selectedRows = [];
  int selectedRowIndex = -1;
  bool disableSelectAll = false;
  List<TablereturnInvoicesalesModel> dataTable = [];
  List<String> filteredItems = [];
  dynamic currentPage = 1;
  int totalPages = 1;
  final int itemsPerPage = 15; // Number of items per page
  List<dynamic> displayedData = [];

  TextEditingController searchValueTable = TextEditingController();

  void search() async {
    try {
      displayedData.clear();
      notifyListeners();
      dynamic jsonData = await ApiServices().fetchGetData(
          '/Sales/GetSearchSalesReturnReport/${searchValueTable.text}', null);

      displayedData = ReportScreenReturnSales.fromJsonList(jsonData);
      currentPage = 1;
      notifyListeners();
    } catch (e) {
      print(e);
      currentPage = 1;
      displayedData = data;
      notifyListeners();
    }
  }

  void loadMoreData() {
    final startIndex = (currentPage - 1) * itemsPerPage;
    final endIndex = startIndex + itemsPerPage;

    if (startIndex >= data.length) {
      return; // No more data to load
    }

    final slicedData = data.sublist(startIndex, endIndex.clamp(0, data.length));

    displayedData = slicedData;
  }

  void goToPage(int page) async {
    if (page >= 1 && page <= totalPages) {
      currentPage = page;
      displayedData.clear();
      notifyListeners();
      if (showAll == true) {
        dynamic jsonData = await ApiServices()
            .fetchGetData('/Sales/GetAllSalesReturnReport/$page', null);

        displayedData = ReportScreenReturnSales.fromJsonList(jsonData);
      }
      loadMoreData();
    }
    notifyListeners();
  }

  dataPagesNubmer() async {
    dynamic jsonData = await ApiServices()
        .fetchGetData('/Sales/GetTableSalesReturnReport', null);
    totalPages = jsonData[0];
    notifyListeners();
  }

  void showBottomSheet(
      BuildContext context, ReportScreenReturnSales rowData) async {
    dynamic jsonData = await ApiServices()
        .fetchGetData('/Sales/GetSalesReturnItemById/${rowData.id}', null);

    dataTable = TablereturnInvoicesalesModel.fromJsonList(jsonData);

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ListView(children: [
          Center(
            child: SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  dataTable.isEmpty
                      ? const Center(child: Text("لا توجد فواتير"))
                      : TablereturnInvoicesales(data: rowData)
                ],
              ),
            ),
          ),
        ]);
      },
    );
  }

  Future<void> fetchData(TextEditingController? from, TextEditingController? to,
      TextEditingController? code) async {
    try {
      if (showAll == true) {
        dynamic jsonData = await ApiServices()
            .fetchGetData('/Sales/GetAllSalesReturnReport/$currentPage', null);
        data = ReportScreenReturnSales.fromJsonList(jsonData);
      } else if (isChecked) {
        dynamic jsonData = await ApiServices().fetchGetData(
            '/Sales/GetSalesReturnsReportById/${code!.text}', null);
        data = ReportScreenReturnSales.fromJsonList(jsonData);
      } else {
        dynamic jsonData = await ApiServices().fetchGetData(
            '/Sales/GetSalesReturnsReportBetweenDate/${from!.text}/${to!.text}',
            null);
        data = ReportScreenReturnSales.fromJsonList(jsonData);
      }

      data;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}

class ReportSalesModel extends ChangeNotifier {
  bool isChecked = false;
  bool isClicked = true;
  bool dateEnabled = true;
  bool backButton = false;
  bool showAll = false;
  bool showloading = false;
  List<dynamic> data = [];
  List<bool> selectedRows = [];
  int selectedRowIndex = -1;
  bool disableSelectAll = false;
  List<InvoiceItemTableModel> dataTable = [];
  dynamic currentPage = 1;
  int totalPages = 1;
  final int itemsPerPage = 15; // Number of items per page
  List<dynamic> displayedData = [];

  TextEditingController searchValueTable = TextEditingController();

  void search() async {
    try {
      displayedData.clear();
      notifyListeners();
      dynamic jsonData = await ApiServices().fetchGetData(
          '/Sales/GetSearchSalesReport/${searchValueTable.text}', null);

      displayedData = ReportScreenSales.fromJsonList(jsonData);
      currentPage = 1;
      notifyListeners();
    } catch (e) {
      currentPage = 1;
      displayedData = data;
      notifyListeners();
    }
  }

  void loadMoreData() {
    final startIndex = (currentPage - 1) * itemsPerPage;
    final endIndex = startIndex + itemsPerPage;

    if (startIndex >= data.length) {
      return; // No more data to load
    }

    final slicedData = data.sublist(startIndex, endIndex.clamp(0, data.length));

    displayedData = slicedData;
  }

  void goToPage(int page) async {
    if (page >= 1 && page <= totalPages) {
      currentPage = page;
      displayedData.clear();
      notifyListeners();
      if (showAll == true) {
        dynamic jsonData = await ApiServices()
            .fetchGetData('/Sales/GetAllSalesReport/$page', null);

        displayedData = ReportScreenSales.fromJsonList(jsonData);
      }
      loadMoreData();
    }
    notifyListeners();
  }

  dataPagesNubmer() async {
    dynamic jsonData =
        await ApiServices().fetchGetData('/Sales/GetTableSalesReport', null);
    totalPages = jsonData[0];
    notifyListeners();
  }

  void showBottomSheet(BuildContext context, ReportScreenSales rowData) async {
    try {
      dynamic jsonData = await ApiServices()
          .fetchGetData('/Sales/GetSalesItemById/${rowData.id}', null);

      dataTable = InvoiceItemTableModel.fromJsonList(jsonData);
    } catch (e) {
      print(e);
    }
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ListView(children: [
          Center(
            child: SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  dataTable.isEmpty
                      ? const Center(child: Text("لا توجد فواتير"))
                      : InvoiceItemTable(data: rowData)
                ],
              ),
            ),
          ),
        ]);
      },
    );
  }

  Future<void> fetchData(TextEditingController? from, TextEditingController? to,
      TextEditingController? code) async {
    try {
      if (showAll == true) {
        dynamic jsonData = await ApiServices()
            .fetchGetData('/Sales/GetAllSalesReport/${currentPage}', null);

        data = ReportScreenSales.fromJsonList(jsonData);
      } else if (isChecked) {
        dynamic jsonData = await ApiServices()
            .fetchGetData('/Sales/GetSalesReportById/${code!.text}', null);
        data = ReportScreenSales.fromJsonList(jsonData);
      } else {
        dynamic jsonData = await ApiServices().fetchGetData(
            '/Sales/GetSalesReportBetweenDate/${from!.text}/${to!.text}', null);
        data = ReportScreenSales.fromJsonList(jsonData);
      }

      data;
      notifyListeners();
    } catch (e) {
      print("$e");
    }
  }
}

class ShiftReportModel extends ChangeNotifier {
  bool isClicked = true;
  bool backButton = true;
  bool checkShowAll = true;
  bool checkDate = false;
  bool checkCode = false;
  bool checkSafe = false;
  bool checkUserCode = false;
  bool showloading = false;

  bool isDataFromEnable = false;
  bool isDataToEnable = false;
  bool isSheftIdEnable = false;
  bool isSafeEnable = false;
  bool isUserEnable = false;

  String? selectedSafe;
  String? selectedUser;
  List<Map<int, String>> safes = [];
  List<Map<int, String>> users = [];

  List<dynamic> data = [];
  List<dynamic> displayData = [];

  void shodata(String searchValue) {
    if (searchValue.isEmpty) {
      // Reset displayData to show all data when searchValue is empty
      displayData = List<dynamic>.from(data);
    } else {
      // Filter the data based on the searchValue
      displayData = data.where((item) {
        return item.openUserName
                .toString()
                .toLowerCase()
                .contains(searchValue.toLowerCase()) ||
            item.sheftId
                .toString()
                .toLowerCase()
                .contains(searchValue.toLowerCase());
      }).toList();
    }
  }

  void updateListSearch(String searchValue) {
    if (searchValue.isEmpty) {
      // Reset displayData to show all data when searchValue is empty
      displayData = List<dynamic>.from(data);
    } else {
      // Filter the data based on the searchValue
      displayData = data.where((item) {
        return item.openUserName
                .toString()
                .toLowerCase()
                .contains(searchValue.toLowerCase()) ||
            item.sheftId
                .toString()
                .toLowerCase()
                .contains(searchValue.toLowerCase());
      }).toList();
    }
    notifyListeners();
  }

  List<Map<int, String>> processData(List<dynamic> listData) {
    return listData
        .map((item) => {item['id'] as int: item['name'] as String})
        .toList();
  }

  Future<void> GetHomeData() async {
    try {
      dynamic jsonData =
          await ApiServices().fetchGetData('/ShiftReports/GetHomeData', null);

      for (var data in jsonData) {
        if (data['name'] == 'Users') {
          users = processData(data['listData']);
        } else if (data['name'] == 'Safes') {
          safes = processData(data['listData']);
        }
        notifyListeners();
      }
    } catch (e) {
      print("error");
    }
  }

  Future<void> GetData(
    TextEditingController? from,
    TextEditingController? to,
    TextEditingController? code,
  ) async {
    try {
      if (checkShowAll) {
        dynamic jsonData = await ApiServices()
            .fetchGetData('/ShiftReports/GetAllSheftReports', null);
        data = ReportScreenShift.fromJsonList(jsonData);

        print(jsonData);
      } else if (checkDate) {
        dynamic jsonData = await ApiServices().fetchGetData(
            '/ShiftReports/GetSheftReportsBetweenDate/${from!.text}/${to!.text}',
            null);
        data = ReportScreenShift.fromJsonList(jsonData);
      } else if (checkSafe && checkUserCode && checkCode) {
        dynamic jsonData = await ApiServices().fetchGetData(
            '/ShiftReports/GetSheftReportsByShiftIdAndUserIdAndSafeId/${code!.text}/$selectedUser/$selectedSafe/',
            null);
        data = ReportScreenShift.fromJsonList(jsonData);
      } else if (checkSafe && checkCode) {
        dynamic jsonData = await ApiServices().fetchGetData(
            '/ShiftReports/GetSheftReportsByShiftIdAndSafeId/${code!.text}/$selectedSafe',
            null);
        data = ReportScreenShift.fromJsonList(jsonData);
      } else if (checkCode) {
        dynamic jsonData = await ApiServices().fetchGetData(
            '/ShiftReports/GetSheftReportsByShiftId/${code!.text}', null);
        data = ReportScreenShift.fromJsonList(jsonData);
      }
      notifyListeners();
    } catch (e) {
      print("$e");
    }
  }
}

class EditingPageModel extends ChangeNotifier {
  List<Map<int, String>> categories = [];
  List<Map<int, String>> units = [];
  dynamic data = {};
  bool isTax = true;
  bool isunitEnable = false;
  bool backButton = false;
  bool isLoading = false;
  String? selectedUnit;
  String? selectedCategories;

  List<Map<int, String>> processData(List<dynamic> listData) {
    return listData
        .map((item) => {item['id'] as int: item['name'] as String})
        .toList();
  }

  Future<void> getItemHomedata() async {
    try {
      dynamic jsonData =
          await ApiServices().fetchGetData('/Item/GetHomeData', null);

      for (var data in jsonData) {
        if (data['name'] == 'Units') {
          units = processData(data['listData']);
          notifyListeners();
        } else if (data['name'] == 'Categoreis') {
          categories = processData(data['listData']);
          notifyListeners();
        }
      }
    } catch (e) {
      print("error");
    }
  }

  Future<void> fetchData(id, nameArabic, nameEnglish, purschsePrice, salesPrice,
      gomlaPrice, gomlahalfPrice, lowPrice, creditLimit, barCode) async {
    dynamic jsonData = await ApiServices()
        .fetchGetDataforEditingpage('/Item/GetItemDetails/${id}', null);
    getItemHomedata();
    data = EditingPageModelitem.fromJson(jsonData);
    notifyListeners();

    if (id != 0) {
      selectedCategories = data.categoryId?.toString() ?? '';
      selectedUnit = data.unitId?.toString() ?? '';
    }
    nameArabic.text = data.arName ?? '';
    nameEnglish!.text = data.enName ?? '';
    purschsePrice.text = data.purchasePrice?.toString() ?? '';
    salesPrice.text = data.salesPrice?.toString() ?? '';
    gomlaPrice.text = data.gomlaPrice?.toString() ?? '';
    gomlahalfPrice.text = data.halfGomlaPrice?.toString() ?? '';
    lowPrice.text = data.leastPrice?.toString() ?? '';
    creditLimit.text = data.creditLimit?.toString() ?? '';
    barCode!.text = data.barcode?.toString() ?? '';
  }

  Future<dynamic> addOrEdit(
      id,
      BuildContext context,
      nameArabic,
      nameEnglish,
      salesPrice,
      barCode,
      creditLimit,
      lowPrice,
      gomlaPrice,
      gomlahalfPrice,
      purschsePrice) async {
    final dataPost = {
      "itemId": data.itemId,
      "itemUnitId": data.itemUnitId,
      "unitId": num.parse(selectedUnit!),
      "arName": nameArabic.text,
      "enName": nameEnglish?.text ?? '',
      "unitName": '0',
      "salesPrice": num.parse(salesPrice.text),
      "categoryName": '0',
      "categoryId": num.parse(selectedCategories!),
      "barcode": barCode!.text,
      "isTaxAndService": isTax,
      "creditLimit": num.parse(creditLimit.text),
      "leastPrice": num.parse(lowPrice.text),
      "gomlaPrice": num.parse(gomlaPrice.text),
      "halfGomlaPrice": num.parse(gomlahalfPrice.text),
      "puchasePrice": num.parse(purschsePrice.text)
    };
    if (id == 0) {
      Map<dynamic, dynamic>? result =
          await ApiServices().postDataforEditingPage(
        '/Item/AddItem',
        null,
        json.encode(dataPost),
      );

      await showSnackBar(context, "تم اضافه البيانات  بنجاح");
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const ItemMangementable()));
    } else {
      Map<dynamic, dynamic>? result =
          await ApiServices().postDataforEditingPage(
        '/Item/EditItem',
        null,
        json.encode(dataPost),
      );

      await showSnackBar(context, "تم تعديل البيانات بنجاح");
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const ItemMangementable()));
    }
  }
}

class ItemMangementableModel extends ChangeNotifier {
  List<ItemManagementModel> data = [];
  List<ItemManagementModel> displayData = [];
  TextEditingController searchValueTable = TextEditingController();
  dynamic currentPage = 1;
  int totalPages = 1;
  int itemsPerPage = 10; //

  void search() async {
    try {
      dynamic jsonData = await ApiServices()
          .fetchGetData('/Item/GetSearchItems/${searchValueTable.text}', null);

      displayData = ItemManagementModel.fromJsonList(jsonData);
      currentPage = 1;
    } catch (e) {
      currentPage = 1;

      displayData = data;
    }
    notifyListeners();
  }

  showAlertDialog(BuildContext context, item, allitem) {
    Widget okButton = TextButton(
      child: const Text("نعم",
          style: TextStyle(
              fontSize: 20, fontFamily: 'arabic', color: Colors.blueGrey)),
      onPressed: () {
        Navigator.of(context).pop();

        displayData.remove(allitem);
        notifyListeners();

        deleleapi(item);
      },
    );

    Widget noButton = TextButton(
      child: const Text("لا",
          style: TextStyle(
              fontSize: 20, fontFamily: 'arabic', color: Colors.blueGrey)),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    AlertDialog alert = AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(15.0), // Adjust the radius as needed
      ),
      title: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 20.0, // Adjust this value as needed
            child: Image.asset("assets/icons/delete.png",
                scale: 0.01), // Adjust the scale as needed
          ),
          const SizedBox(
            width: 10,
          ),
          const Text("تاكيد الحذف",
              style: TextStyle(
                  fontSize: 25, fontFamily: 'arabic', color: Colors.blueGrey)),
        ],
      ),
      content: const Text("هل انت متاكد من الحذف",
          style: TextStyle(
              fontSize: 20, fontFamily: 'arabic', color: Colors.grey)),
      actions: [
        noButton,
        okButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void loadMoreData() {
    final startIndex = (currentPage - 1) * itemsPerPage;
    final endIndex = startIndex + itemsPerPage;

    if (startIndex >= data.length) {
      return; // No more data to load
    }

    final slicedData = data.sublist(startIndex, endIndex.clamp(0, data.length));

    displayData = slicedData;
  }

  void goToPage(int page) async {
    if (page >= 1 && page <= totalPages) {
      currentPage = page;
      displayData.clear();
      notifyListeners();
      dynamic jsonData =
          await ApiServices().fetchGetData('/Item/GetAllItems/$page', null);

      displayData = ItemManagementModel.fromJsonList(jsonData);

      loadMoreData();
    }
    notifyListeners();
  }

  dataPagesNubmer() async {
    dynamic jsonData =
        await ApiServices().fetchGetData('/Item/GetTableItem', null);
    print(jsonData);
    totalPages = jsonData[0];
    notifyListeners();
  }

  Future<void> fetchData(BuildContext context) async {
    try {
      dynamic jsonData =
          await ApiServices().fetchGetData('/Item/GetAllItems/0', null);

      data = ItemManagementModel.fromJsonList(jsonData);
      displayData = List<ItemManagementModel>.from(data);

      notifyListeners();
    } catch (e) {
      showSnackBar(context, "حدث خطا اثناء ادخال البيانات");
    }
  }

  Future<void> deleleapi(int item) async {
    try {
      dynamic jsonData = await ApiServices().deleteApi(
        '/Item/DeleteItemUnit/$item',
        null,
      );
    } catch (e) {
      // Handle the error appropriately
    }
  }
}

class StoreInventoreScreenModel extends ChangeNotifier {
  bool isChecked = false;
  bool isClicked = true;
  bool dateEnabled = true;
  bool backButton = true;
  bool showAll = true;
  List<StoreinventoreModel> data = [];
  List<dynamic> display = [];
  String? selectedUser;
  List<Map<int, String>> users = [];
  bool isUserEnable = false;

  dynamic currentPage = 1;
  int totalPages = 1;
  final int itemsPerPage = 15; // Number of items per page

  TextEditingController searchValueTable = TextEditingController();

  void search() async {
    try {
      display.clear();
      notifyListeners();
      dynamic jsonData = await ApiServices().fetchGetData(
          '/Store/GetSearchStoreInventoryReport/${searchValueTable.text}',
          null);

      display = StoreinventoreModel.fromJsonList(jsonData);
      currentPage = 1;
      notifyListeners();
    } catch (e) {
      currentPage = 1;
      display = data;
      notifyListeners();
    }
  }

  void loadMoreData() {
    final startIndex = (currentPage - 1) * itemsPerPage;
    final endIndex = startIndex + itemsPerPage;

    if (startIndex >= data.length) {
      return; // No more data to load
    }

    final slicedData = data.sublist(startIndex, endIndex.clamp(0, data.length));

    display = slicedData;
  }

  Future goToPage(int page) async {
    if (page >= 1 && page <= totalPages) {
      display.clear();
      notifyListeners();
      currentPage = page;
      if (showAll == true) {
        dynamic jsonData = await ApiServices()
            .fetchGetData('/Store/GetAllStoreInventory/$page', null);

        display = StoreinventoreModel.fromJsonList(jsonData);
      }
      loadMoreData();
    }
    notifyListeners();
  }

  dataPagesNubmer() async {
    dynamic jsonData = await ApiServices()
        .fetchGetData('/Store/GetTableStoreInventoryReport', null);
    totalPages = jsonData[0];
    notifyListeners();
  }

  List<Map<int, String>> processData(List<dynamic> listData) {
    return listData
        .map((item) => {item['id'] as int: item['name'] as String})
        .toList();
  }

  Future<void> getItemHomedata() async {
    try {
      dynamic jsonData =
          await ApiServices().fetchGetData('/Store/GetAllStore', null);

      for (var data in jsonData) {
        if (data['name'] == 'Store') {
          users = processData(data['listData']);
          notifyListeners();
        }
      }
    } catch (e) {
      print("error");
    }
  }

  Future GetData() async {
    try {
      if (showAll == true) {
        dynamic jsonData = await ApiServices()
            .fetchGetData('/Store/GetAllStoreInventory/$currentPage', null);
        data = StoreinventoreModel.fromJsonList(jsonData);
        display = List<StoreinventoreModel>.from(data);
        notifyListeners();
      } else if (isChecked == true) {
        dynamic jsonData = await ApiServices()
            .fetchGetData('/Store/GetStoreInventoryById/$selectedUser', null);
        data = StoreinventoreModel.fromJsonList(jsonData);
        return List<StoreinventoreModel>.from(data);
      }
      notifyListeners();
    } catch (e) {
      print("$e");
    }
  }
}

class CustomerAccountScreenModel extends ChangeNotifier {
  bool isChecked = false;
  bool isClicked = true;
  bool backButton = true;
  bool showAll = true;

  String? selectedUser;
  List<Map<int, String>> users = [];
  bool isUserEnable = false;
  List<dynamic> data = [];
  List<dynamic> displayData = [];
  List<Map<int, String>> processData(List<dynamic> listData) {
    return listData
        .map((item) => {item['id'] as int: item['name'] as String})
        .toList();
  }

  void updateListSearch(String searchValue) {
    if (searchValue.isEmpty) {
      // Reset displayData to show all data when searchValue is empty
      displayData = List<dynamic>.from(data);
    } else {
      // Filter the data based on the searchValue
      displayData = data.where((item) {
        return isChecked == true
            ? item.id
                    .toString()
                    .toLowerCase()
                    .contains(searchValue.toLowerCase()) ||
                item.type
                    .toString()
                    .toLowerCase()
                    .contains(searchValue.toLowerCase())
            : item.customerName
                    .toString()
                    .toLowerCase()
                    .contains(searchValue.toLowerCase()) ||
                item.type
                    .toString()
                    .toLowerCase()
                    .contains(searchValue.toLowerCase());
      }).toList();
    }
    notifyListeners(); // Notify listeners to rebuild widgets
  }

  Future<void> getItemHomedata() async {
    try {
      dynamic jsonData =
          await ApiServices().fetchGetData('/Customer/GetAllCustomers', null);

      for (var data in jsonData) {
        if (data['name'] == 'Store') {
          users = processData(data['listData']);
          notifyListeners();
        }
      }
    } catch (e) {
      print("error");
    }
  }

  Future<void> GetData() async {
    if (showAll == true) {
      dynamic jsonData = await ApiServices()
          .fetchGetData('/Customer/GetAllCustomerAccounts', null);
      data = CustomerAccouentModel.fromJsonList(jsonData);
      displayData = List<CustomerAccouentModel>.from(data);
      notifyListeners();
    } else if (isChecked == true) {
      try {
        dynamic jsonData = await ApiServices().fetchGetData(
            '/Customer/GetCustomerAccountById/$selectedUser', null);

        data = InvoiceDataCusromer.fromJsonList(jsonData);
        displayData = List<InvoiceDataCusromer>.from(data);
        notifyListeners();
      } catch (e) {
        print(e);
      }
    }
  }
}

class CustomerTransactionsScreenModel extends ChangeNotifier {
  bool isChecked = false;
  bool isClicked = true;
  bool dateEnabled = true;
  bool backButton = true;
  bool showAll = true;

  String? selectedUser;
  List<Map<int, String>> users = [];
  bool isUserEnable = false;
  List<Map<int, String>> processData(List<dynamic> listData) {
    return listData
        .map((item) => {item['id'] as int: item['name'] as String})
        .toList();
  }

  List<dynamic> data = [];
  List<dynamic> displayData = [];

  void updateListSearch(String searchValue) {
    if (searchValue.isEmpty) {
      // Reset displayData to show all data when searchValue is empty
      displayData = List<dynamic>.from(data);
    } else {
      // Filter the data based on the searchValue
      displayData = data.where((item) {
        return item.sheftId
                .toString()
                .toLowerCase()
                .contains(searchValue.toLowerCase()) ||
            item.customerName
                .toString()
                .toLowerCase()
                .contains(searchValue.toLowerCase()) ||
            item.id
                .toString()
                .toLowerCase()
                .contains(searchValue.toLowerCase());
      }).toList();
    }
    notifyListeners(); // Notify listeners to rebuild widgets
  }

  Future<void> getItemHomedata() async {
    try {
      dynamic jsonData =
          await ApiServices().fetchGetData('/Customer/GetAllCustomers', null);

      for (var data in jsonData) {
        if (data['name'] == 'Store') {
          users = processData(data['listData']);
          notifyListeners();
        }
      }
    } catch (e) {
      print("error");
    }
  }

  Future<void> GetData() async {
    if (showAll == true) {
      dynamic jsonData = await ApiServices()
          .fetchGetData('/Customer/GetAllCustomerTransactions', null);
      data = TransactionModel.fromJsonList(jsonData);
      displayData = List<TransactionModel>.from(data);
      notifyListeners();
    } else if (isChecked == true) {
      try {
        dynamic jsonData = await ApiServices().fetchGetData(
            '/Customer/GetCustomerTransactionById/$selectedUser', null);

        data = TransactionModel.fromJsonList(jsonData);
        displayData = List<TransactionModel>.from(data);
        notifyListeners();
      } catch (e) {
        print(e);
      }
    }
  }
}

class SupplierTransactionsScreenModel extends ChangeNotifier {
  bool isChecked = false;
  bool isClicked = true;
  bool dateEnabled = true;
  bool backButton = true;
  bool showAll = true;

  String? selectedUser;
  List<Map<int, String>> users = [];
  bool isUserEnable = false;
  List<Map<int, String>> processData(List<dynamic> listData) {
    return listData
        .map((item) => {item['id'] as int: item['name'] as String})
        .toList();
  }

  List<dynamic> data = [];
  List<dynamic> displayData = [];

  void updateListSearch(String searchValue) {
    if (searchValue.isEmpty) {
      // Reset displayData to show all data when searchValue is empty
      displayData = List<dynamic>.from(data);
    } else {
      // Filter the data based on the searchValue
      displayData = data.where((item) {
        return item.id
                .toString()
                .toLowerCase()
                .contains(searchValue.toLowerCase()) ||
            item.supplierName
                .toString()
                .toLowerCase()
                .contains(searchValue.toLowerCase()) ||
            item.userName
                .toString()
                .toLowerCase()
                .contains(searchValue.toLowerCase()) ||
            item.sheftId
                .toString()
                .toLowerCase()
                .contains(searchValue.toLowerCase());
      }).toList();
    }
    notifyListeners(); // Notify listeners to rebuild widgets
  }

  Future<void> getItemHomedata() async {
    try {
      dynamic jsonData =
          await ApiServices().fetchGetData('/Supplier/GetAllSuppliers', null);

      for (var data in jsonData) {
        if (data['name'] == 'Suppliers') {
          users = processData(data['listData']);
          notifyListeners();
        }
      }
    } catch (e) {
      print("error");
    }
  }

  Future<void> GetData() async {
    if (showAll == true) {
      dynamic jsonData = await ApiServices()
          .fetchGetData('/Supplier/GetAllSupplierTransactions', null);
      data = SupplierTransactionsModel.fromJsonList(jsonData);
      displayData = List<SupplierTransactionsModel>.from(data);
      notifyListeners();
    } else if (isChecked == true) {
      try {
        dynamic jsonData = await ApiServices().fetchGetData(
            '/Supplier/GetSupplierTransactionById/$selectedUser', null);

        data = SupplierTransactionsModel.fromJsonList(jsonData);
        displayData = List<SupplierTransactionsModel>.from(data);
        notifyListeners();
      } catch (e) {
        print(e);
      }
    }
  }
}

class SupplierAccountScreenModel extends ChangeNotifier {
  bool isChecked = false;
  bool isClicked = true;
  bool dateEnabled = true;
  bool backButton = true;
  bool showAll = true;

  String? selectedUser;
  List<Map<int, String>> users = [];
  bool isUserEnable = false;
  List<Map<int, String>> processData(List<dynamic> listData) {
    return listData
        .map((item) => {item['id'] as int: item['name'] as String})
        .toList();
  }

  List<dynamic> data = [];
  List<dynamic> displayData = [];

  void updateListSearch(String searchValue) {
    if (searchValue.isEmpty) {
      // Reset displayData to show all data when searchValue is empty
      displayData = List<dynamic>.from(data);
    } else {
      // Filter the data based on the searchValue
      displayData = data.where((item) {
        return isChecked == true
            ? item.id
                    .toString()
                    .toLowerCase()
                    .contains(searchValue.toLowerCase()) ||
                item.supplierName
                    .toString()
                    .toLowerCase()
                    .contains(searchValue.toLowerCase())
            : item.supplierId
                    .toString()
                    .toLowerCase()
                    .contains(searchValue.toLowerCase()) ||
                item.supplierName
                    .toString()
                    .toLowerCase()
                    .contains(searchValue.toLowerCase());
      }).toList();
    }
    notifyListeners(); // Notify listeners to rebuild widgets
  }

  Future<void> getItemHomedata() async {
    try {
      dynamic jsonData =
          await ApiServices().fetchGetData('/Supplier/GetAllSuppliers', null);

      for (var data in jsonData) {
        if (data['name'] == 'Suppliers') {
          users = processData(data['listData']);
          notifyListeners();
        }
      }
    } catch (e) {
      print("error");
    }
  }

  Future<void> GetData() async {
    if (showAll == true) {
      dynamic jsonData = await ApiServices()
          .fetchGetData('/Supplier/GetAllSupplierAccounts', null);
      data = SupplierAccountsModel.fromJsonList(jsonData);
      displayData = List<SupplierAccountsModel>.from(data);
      notifyListeners();
    } else if (isChecked == true) {
      try {
        dynamic jsonData = await ApiServices().fetchGetData(
            '/Supplier/GetSupplierAccountById/$selectedUser', null);
        print(selectedUser);
        data = SupplierDropDownModel.fromJsonList(jsonData);
        displayData = List<SupplierDropDownModel>.from(data);
        notifyListeners();
      } catch (e) {
        print(e);
      }
    }
  }
}

class ChartsApp extends ChangeNotifier {
  List data = [];

  TooltipBehavior? tooltipBehavior;

  List<SalesData> chartData = [];

  Future<void> getItemHomedata(link) async {
    dynamic item;
    dynamic i;
    try {
      dynamic jsonData =
          await ApiServices().fetchGetDataforEditingpage(link, null);
      for (item in jsonData['data']) {
        chartData.add(SalesData(item['date'], item['total']));
        notifyListeners();
      }
    } catch (e) {
      print(e);
    }
  }
}

class HandleNotification extends ChangeNotifier {
  setNotifications(BuildContext context) async {
    FirebaseMessaging.onMessageOpenedApp.listen((event) async {});
    FirebaseMessaging.onMessage.listen(
      (message) async {
        Map<String, String?> dataMessage = {
          'title': message.notification!.title,
          'body': message.notification!.body
        };

        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('title', dataMessage['title'] ?? '');
        await prefs.setString('body', dataMessage['body'] ?? '');
        // AwesomeDialog(
        //   context: context,
        //   dialogType: DialogType.info,
        //   // Change this to the desired type
        //   animType: AnimType.topSlide,
        //   title: message.notification!.title,
        //   desc: message.notification!.body,
        //   btnOkText: 'اذهب لفحص اشعارات جديده',
        //   btnOkOnPress: () {
        //     Navigator.pushReplacement(
        //         context,
        //         MaterialPageRoute(
        //           builder: (context) => const ScreenNotefication(),
        //         ));
        //   },
        // )..show();

        if (message.notification != null) {
          AwesomeNotifications().createNotification(
              content: NotificationContent(
                  id: 10,
                  channelKey: 'basic_channel',
                  title: message.notification!.title,
                  body: message.notification!.body));
        }
      },
    );
  }
}

class Course_grid extends ChangeNotifier {
  List<dynamic> data = [];

  Future<void> refreshData(BuildContext context) async {
    data.clear();
    notifyListeners();
    fetchData(context);
  }

  Future<void> fetchData(BuildContext context) async {
    try {
      dynamic jsonData =
          await ApiServices().fetchGetHomeData('/MonyReports/GetHomeReport', null,context);
      data = HomeScreen.fromJsonList(jsonData);
      notifyListeners();

      // Notify listeners again to update with new data
    } catch (e) {
      print(e);
    }
  }
}

class LoginScreenModel extends ChangeNotifier {
  bool isChecked = true;
  bool isLogin = false;
  Future<void> postData(email, password, BuildContext context) async {
    try {


      SharedPreferences prefs = await SharedPreferences.getInstance();

      final String fcmToken = prefs.getString('fcmToken') ?? '';
      print(fcmToken);

      final data = {
        "userName": email.text,
        "password": password.text,
        'deviceToken': fcmToken.toString()
      };

      isLogin = true;
      notifyListeners();

      final dynamic result = await ApiServices().fetchPostData(
        '/Authorization/GetToken',
        null,
        json.encode(data),
      );

      isLogin = false;
      notifyListeners();

      if (result != null) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MainScreen()),
        );
        final fcmService = FCMService();
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString(
            'refreshTokenExpiration', result['refreshTokenExpiration']);
        await prefs.setString('token', result['token']);
      } else {
        isLogin = false;
        notifyListeners();
        showSnackBar(context, "حدث خطا اثناء ادخال البيانات");
      }
    } catch (e) {
      isLogin = false;
      notifyListeners();
      showSnackBar(context, "حدث خطا اثناء ادخال البيانات");
    }
  }

  LinkSave(BuildContext context, link, topa) async {
    Navigator.pop(context);
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString('baseUrl', link.text);
    await prefs.setString('id', topa.text);
  }

  LoadRequierdData(link, topa) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    link.text = prefs.getString('baseUrl') ?? "";
    topa.text = prefs.getString('id') ?? '';
    notifyListeners();
  }
}
