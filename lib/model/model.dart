import 'package:intl/intl.dart';

class HomeScreen {
  String name;
  dynamic total;
  String from;
  String to;

  HomeScreen({
    required this.name,
    required this.total,
    required this.from,
    required this.to,
  });

  factory HomeScreen.fromJson(Map<String, dynamic> jsonData) {
    return HomeScreen(
      name: jsonData['name'],
      total: jsonData['total'],
      from: jsonData['from'],
      to: jsonData['to'],
    );
  }

  static List<HomeScreen> fromJsonList(List<dynamic> jsonList) {
    List<HomeScreen> homeScreens = [];
    for (var jsonData in jsonList) {
      homeScreens.add(HomeScreen.fromJson(jsonData));
    }
    return homeScreens;
  }
}

class ReportScreenSales {
  int id;
  dynamic date; // Change the type to DateTime
  dynamic customer;
  dynamic cash;
  dynamic visa;
  dynamic later;
  dynamic tax;
  dynamic service;
  dynamic discount;
  dynamic invoiceTotal;
  dynamic userName;
  dynamic deleviry;
  dynamic shift;
  dynamic invType;

  ReportScreenSales({
    required this.id,
    required this.date,
    required this.customer,
    required this.cash,
    required this.visa,
    required this.later,
    required this.tax,
    required this.service,
    required this.discount,
    required this.invoiceTotal,
    required this.userName,
    required this.deleviry,
    required this.shift,
    required this.invType,
  }); // Parse the date when initializing

  factory ReportScreenSales.fromJson(Map<String, dynamic> jsonData) {
    final DateTime dateTime = DateTime.parse(jsonData['date']);
    final DateFormat formatter = DateFormat('dd/MM/yyyy hh:mm a');
    final String formattedDate = formatter.format(dateTime);
    return ReportScreenSales(
      id: jsonData['id'],
      date: formattedDate,
      customer: jsonData['customer'],
      cash: jsonData['cash'],
      visa: jsonData['visa'],
      later: jsonData['later'],
      tax: jsonData['tax'],
      service: jsonData['service'],
      discount: jsonData['discount'],
      invoiceTotal: jsonData['invoiceTotal'],
      userName: jsonData['userName'],
      deleviry: jsonData['deleviry'],
      shift: jsonData['shift'],
      invType: jsonData['invType'],
    );
  }

  static List<ReportScreenSales> fromJsonList(List<dynamic> jsonList) {
    return jsonList
        .map((jsonData) => ReportScreenSales.fromJson(jsonData))
        .toList();
  }
}

class ReportScreenPurchese {
  int id;
  dynamic invoiceDate;
  dynamic supplierName;
  dynamic cash;
  dynamic visa;
  dynamic later;
  dynamic tax;
  dynamic discount;
  dynamic total;
  dynamic userName;

  ReportScreenPurchese({
    required this.id,
    required this.invoiceDate,
    required this.supplierName,
    required this.cash,
    required this.visa,
    required this.later,
    required this.tax,
    required this.discount,
    required this.total,
    required this.userName,
  });

  factory ReportScreenPurchese.fromJson(Map<String, dynamic> jsonData) {
       final DateTime dateTime = DateTime.parse(jsonData['invoiceDate']);
    final DateFormat formatter = DateFormat('dd/MM/yyyy hh:mm a');
    final String formattedDate = formatter.format(dateTime);
    return ReportScreenPurchese(
        id: jsonData['id'],
        invoiceDate: formattedDate,
        supplierName: jsonData['supplierName'],
        cash: jsonData['cash'],
        visa: jsonData['visa'],
        later: jsonData['later'],
        tax: jsonData['tax'],
        discount: jsonData['discount'],
        total: jsonData['total'],
        userName: jsonData['userName']);
  }

  static List<ReportScreenPurchese> fromJsonList(List<dynamic> jsonList) {
    List<ReportScreenPurchese> reportScreen = [];
    for (var jsonData in jsonList) {
      reportScreen.add(ReportScreenPurchese.fromJson(jsonData));
    }
    return reportScreen;
  }
}

class ReportScreenReturnSales {
  int id;
  String invoiceDate;
  int invId;
  int sheftId;
  double discount;
  double service;
  double tax;
  double total;
  String customerName;
  String safeName;
  String userName;

  ReportScreenReturnSales({
    required this.id,
    required this.invoiceDate,
    required this.invId,
    required this.sheftId,
    required this.discount,
    required this.service,
    required this.tax,
    required this.total,
    required this.customerName,
    required this.safeName,
    required this.userName,
  });

  factory ReportScreenReturnSales.fromJson(Map<String, dynamic> json) {
       final DateTime dateTime = DateTime.parse(json['invoiceDate']);
    final DateFormat formatter = DateFormat('dd/MM/yyyy hh:mm a');
    final String formattedDate = formatter.format(dateTime);
    return ReportScreenReturnSales(
      id: json['id'],
      invoiceDate: formattedDate,
      invId: json['invId'],
      sheftId: json['sheftId'],
      discount: json['discount'],
      service: json['service'],
      tax: json['tax'],
      total: json['total'],
      customerName: json['customerName'],
      safeName: json['safeName'],
      userName: json['userName'],
    );
  }

  static List<ReportScreenReturnSales> fromJsonList(List<dynamic> jsonList) {
    List<ReportScreenReturnSales> reportScreen = [];
    for (var jsonData in jsonList) {
      reportScreen.add(ReportScreenReturnSales.fromJson(jsonData));
    }
    return reportScreen;
  }
}

class ReportScreenReturnPurchese {
  int id;
  String invoiceDate;
  int invId;
  int sheftId;
  double discount;
  double service;
  double tax;
  double total;
  String customerName;
  String safeName;
  String userName;

  ReportScreenReturnPurchese({
    required this.id,
    required this.invoiceDate,
    required this.invId,
    required this.sheftId,
    required this.discount,
    required this.service,
    required this.tax,
    required this.total,
    required this.customerName,
    required this.safeName,
    required this.userName,
  });

  factory ReportScreenReturnPurchese.fromJson(Map<String, dynamic> json) {
    final DateTime dateTime = DateTime.parse(json['invoiceDate']);
    final DateFormat formatter = DateFormat('dd/MM/yyyy hh:mm a');
    final String formattedDate = formatter.format(dateTime);
    return ReportScreenReturnPurchese(
      id: json['id'],
      invoiceDate: formattedDate,
      invId: json['invId'],
      sheftId: json['sheftId'],
      discount: json['discount'],
      service: json['service'],
      tax: json['tax'],
      total: json['total'],
      customerName: json['supplierName'],
      safeName: json['safeName'],
      userName: json['userName'],
    );
  }

  static List<ReportScreenReturnPurchese> fromJsonList(List<dynamic> jsonList) {
    List<ReportScreenReturnPurchese> reportScreen = [];
    for (var jsonData in jsonList) {
      reportScreen.add(ReportScreenReturnPurchese.fromJson(jsonData));
    }
    return reportScreen;
  }
}

class ReportScreenExpencese {
  int expensesId;
  int payment;
  dynamic date;
  String note;
  String expensesName;
  String userName;
  int sheftId;
  String safeName;
  int safeId;

  ReportScreenExpencese({
    required this.expensesId,
    required this.payment,
    required this.date,
    required this.note,
    required this.expensesName,
    required this.userName,
    required this.sheftId,
    required this.safeName,
    required this.safeId,
  });

  factory ReportScreenExpencese.fromJson(Map<String, dynamic> json) {
    final DateTime openDateTime = DateTime.parse(json['date']);
    final DateFormat formatter = DateFormat('dd/MM/yyyy hh:mm a');
    final String formatopenDateTime = formatter.format(openDateTime);
    return ReportScreenExpencese(
      expensesId: json['expensesId'],
      payment: json['payment'],
      date: formatopenDateTime,
      note: json['note']??'',
      expensesName: json['expensesName'],
      userName: json['userName'],
      sheftId: json['sheftId'],
      safeName: json['safeName'],
      safeId: json['safeId'],
    );
  }
  static List<ReportScreenExpencese> fromJsonList(List<dynamic> jsonList) {
    List<ReportScreenExpencese> reportScreen = [];
    for (var jsonData in jsonList) {
      reportScreen.add(ReportScreenExpencese.fromJson(jsonData));
    }
    return reportScreen;
  }
}

class ReportScreenShift {
  int sheftId;
  String openUserName;
  dynamic openDateTime;
  double cash;
  double later;
  double visa;
  double tax;
  double service;
  double discounts;
  dynamic closeDateTime;
  dynamic closeUserName;
  int openingBalance;
  int expence;
  double invoiceTotal;
  double salesReturns;
  double purchasesReturns;
  int totalCustomerPayment;
  int totalSupplierPayment;
  int safeBalance;

  ReportScreenShift({
    required this.sheftId,
    required this.openUserName,
    required this.openDateTime,
    required this.cash,
    required this.later,
    required this.visa,
    required this.tax,
    required this.service,
    required this.discounts,
    required this.closeDateTime,
    required this.closeUserName,
    required this.openingBalance,
    required this.expence,
    required this.invoiceTotal,
    required this.salesReturns,
    required this.purchasesReturns,
    required this.totalCustomerPayment,
    required this.totalSupplierPayment,
    required this.safeBalance,
  });

  // Factory constructor
  factory ReportScreenShift.fromJson(Map<String, dynamic> json) {
    final DateTime openDateTime = DateTime.parse(json['openDateTime']);
    final DateFormat formatter = DateFormat('dd/MM/yyyy hh:mm a');
    final String formatopenDateTime = formatter.format(openDateTime);

    // --------------------------------------------------------------
    final dynamic closeDateTime = json['closeDateTime'] != null
        ? DateTime.parse(json['closeDateTime'])
        : null;
    String formatcloseDateTime = '';

    if (closeDateTime != null) {
      final DateFormat formatterCloseDateTime =
          DateFormat('dd/MM/yyyy hh:mm a');
      formatcloseDateTime = formatterCloseDateTime.format(closeDateTime);
    } else {
      formatcloseDateTime =
          'لا يوجد تاريخ'; // You can use any default string you want
    }

    return ReportScreenShift(
      sheftId: json['sheftId'],
      openUserName: json['openUserName'],
      openDateTime: formatopenDateTime,
      cash: json['cash'],
      later: json['later'],
      visa: json['visa'],
      tax: json['tax'],
      service: json['service'],
      discounts: json['discounts'],
      closeDateTime: formatcloseDateTime,
      closeUserName: json['closeUserName'] ?? "لا يوجد",
      openingBalance: json['openingBalance'],
      expence: json['expence'],
      invoiceTotal: json['invoiceTotal'],
      salesReturns: json['salesReturns'],
      purchasesReturns: json['purchasesReturns'],
      totalCustomerPayment: json['totalCustomerPayment'],
      totalSupplierPayment: json['totalSupplierPayment'],
      safeBalance: json['safeBalance'],
    );
  }

  static List<ReportScreenShift> fromJsonList(List<dynamic> jsonList) {
    List<ReportScreenShift> reportScreen = [];
    for (var jsonData in jsonList) {
      reportScreen.add(ReportScreenShift.fromJson(jsonData));
    }
    return reportScreen;
  }
}

class LoginScreen {
  String email;
  String password;

  LoginScreen({
    required this.email,
    required this.password,
  });

  factory LoginScreen.toJson(String jsonData) {
    return LoginScreen(
      email: jsonData,
      password: jsonData,
    );
  }
}

class ItemManagementModel {
  dynamic itemId;
  dynamic itemUnitId;
  dynamic arName;
  dynamic enName;
  dynamic unitName;
  dynamic salesPrice;
  dynamic categoryName;
  dynamic categoryId;
  dynamic barcode;
  dynamic isTaxAndService;
  dynamic creditLimit;
  dynamic leastPrice;
  dynamic gomlaPrice;
  dynamic halfGomlaPrice;
  dynamic purchasePrice;

  ItemManagementModel({
    required this.itemId,
    required this.itemUnitId,
    required this.arName,
    required this.enName,
    required this.unitName,
    required this.salesPrice,
    required this.categoryName,
    required this.categoryId,
    required this.barcode,
    required this.isTaxAndService,
    required this.creditLimit,
    required this.leastPrice,
    required this.gomlaPrice,
    required this.halfGomlaPrice,
    required this.purchasePrice,
  });

  factory ItemManagementModel.fromJson(Map<dynamic, dynamic> json) {
    return ItemManagementModel(
      itemId: json['itemId'],
      itemUnitId: json['itemUnitId'],
      arName: json['arName'],
      enName: json['enName'],
      unitName: json['unitName'],
      salesPrice: json['salesPrice'],
      categoryName: json['categoryName'],
      categoryId: json['categoryId'],
      barcode: json['barcode'],
      isTaxAndService: json['isTaxAndService'],
      creditLimit: json['creditLimit'],
      leastPrice: json['leastPrice'],
      gomlaPrice: json['gomlaPrice'],
      halfGomlaPrice: json['halfGomlaPrice'],
      purchasePrice: json['puchasePrice'],
    );
  }

  static List<ItemManagementModel> fromJsonList(List<dynamic> jsonList) {
    List<ItemManagementModel> reportScreen = [];
    for (var jsonData in jsonList) {
      reportScreen.add(ItemManagementModel.fromJson(jsonData));
    }
    return reportScreen;
  }
}

class EditingPageModelitem {
  dynamic itemId;
  dynamic itemUnitId;
  dynamic unitId;
  dynamic arName;
  dynamic enName;
  dynamic unitName;
  dynamic salesPrice;
  dynamic categoryName;
  dynamic categoryId;
  dynamic barcode;
  dynamic isTaxAndService;
  dynamic creditLimit;
  dynamic leastPrice;
  dynamic gomlaPrice;
  dynamic halfGomlaPrice;
  dynamic purchasePrice;
  EditingPageModelitem({
    required this.itemId,
    required this.itemUnitId,
    required this.unitId,
    required this.arName,
    required this.enName,
    required this.unitName,
    required this.salesPrice,
    required this.categoryName,
    required this.categoryId,
    required this.barcode,
    required this.isTaxAndService,
    required this.creditLimit,
    required this.leastPrice,
    required this.gomlaPrice,
    required this.halfGomlaPrice,
    required this.purchasePrice,
  });
  factory EditingPageModelitem.fromJson(Map<String, dynamic> json) {
    return EditingPageModelitem(
      itemId: json['itemId'],
      itemUnitId: json['itemUnitId'],
      unitId: json['unitId'] ?? '',
      arName: json['arName'],
      enName: json['enName'],
      unitName: json['unitName'],
      salesPrice: json['salesPrice'],
      categoryName: json['categoryName'],
      categoryId: json['categoryId'].toString(),
      barcode: json['barcode'],
      isTaxAndService: json['isTaxAndService'],
      creditLimit: json['creditLimit'],
      leastPrice: json['leastPrice'],
      gomlaPrice: json['gomlaPrice'],
      halfGomlaPrice: json['halfGomlaPrice'],
      purchasePrice: json['puchasePrice'],
    );
  }
}

class StoreinventoreModel {
  final int itemUnitId;
  final String itemName;
  final String barcode;
  final String storeName;
  final double availableQty;
  final double sales;
  final double purchases;
  final double capital;

  StoreinventoreModel({
    required this.itemUnitId,
    required this.itemName,
    required this.barcode,
    required this.storeName,
    required this.availableQty,
    required this.sales,
    required this.purchases,
    required this.capital,
  });

  factory StoreinventoreModel.fromJson(Map<String, dynamic> json) {
    return StoreinventoreModel(
      itemUnitId: json['itemUnitId'],
      itemName: json['itemName'],
      barcode: json['barcode'],
      storeName: json['storeName'],
      availableQty: json['avilableQty'].toDouble(),
      sales: json['sales'].toDouble(),
      purchases: json['purchases'].toDouble(),
      capital: json['capital'].toDouble(),
    );
  }
  static List<StoreinventoreModel> fromJsonList(List<dynamic> jsonList) {
    List<StoreinventoreModel> reportScreen = [];
    for (var jsonData in jsonList) {
      reportScreen.add(StoreinventoreModel.fromJson(jsonData));
    }
    return reportScreen;
  }
}

class CustomerAccouentModel {
  final int customerId;
  final String customerName;
  final String phone;
  final String type;
  final String address;
  final String note;
  final double creditLimit;
  final dynamic debt;
  final dynamic credit;
  final dynamic balance;
  final dynamic invCount;

  CustomerAccouentModel({
    required this.customerId,
    required this.customerName,
    required this.phone,
    required this.type,
    required this.address,
    required this.note,
    required this.creditLimit,
    required this.debt,
    required this.credit,
    required this.balance,
    required this.invCount,
  });

  factory CustomerAccouentModel.fromJson(Map<String, dynamic> json) {
    return CustomerAccouentModel(
      customerId: json['customerId'] as int,
      customerName: json['customerName'] as String,
      phone: json['phone'] ?? "",
      type: json['type'] as String,
      address: json['address'] as String,
      note: json['note'] ?? "",
      creditLimit: (json['creditLimit'] as num).toDouble(),
      debt: json['debt'].toString(),
      credit: json['credit'].toString(),
      balance: json['balance'].toString(),
      invCount: json['invCount'].toString(),
    );
  }

  static List<CustomerAccouentModel> fromJsonList(List<dynamic> jsonList) {
    List<CustomerAccouentModel> reportScreen = [];
    for (var jsonData in jsonList) {
      reportScreen.add(CustomerAccouentModel.fromJson(jsonData));
    }
    return reportScreen;
  }


}

class InvoiceDataCusromer {
  final int id;
  final dynamic invoiceDate;
  final double debt;
  final double credit;
  final double balance;
  final String type;
  final String customerName;
  final int customerId;
  final bool isInvoice;

  InvoiceDataCusromer({
    required this.id,
    required this.invoiceDate,
    required this.debt,
    required this.credit,
    required this.balance,
    required this.type,
    required this.customerName,
    required this.customerId,
    required this.isInvoice,
  });

  factory InvoiceDataCusromer.fromJson(Map<String, dynamic> json) {
        final DateTime openDateTime = DateTime.parse(json['invoiceDate']);
    final DateFormat formatter = DateFormat('dd/MM/yyyy hh:mm a');
    final String formatopenDateTime = formatter.format(openDateTime);
    print(json['isInvoice']);
    return InvoiceDataCusromer(
      id: json['id'] as int,
      invoiceDate: formatopenDateTime.toString(),
      debt: json['debt'] as double,
      credit: json['credit'] as double,
      balance: json['balance'] as double,
      type: json['type'] as String,
      customerName: json['customerName'] as String,
      customerId: json['customerId'] as int,
      isInvoice: json['isInvoice'],
    );
  }
  static List<InvoiceDataCusromer> fromJsonList(List<dynamic> jsonList) {
    List<InvoiceDataCusromer> reportScreen = [];
    for (var jsonData in jsonList) {
      reportScreen.add(InvoiceDataCusromer.fromJson(jsonData));
    }
    return reportScreen;
  }
}

class TransactionModel {
  final int id;
  final String customerName;
  final int qty;
  final String userName;
  final String safe;
  final dynamic date;
  final String transactionType;
  final int sheftId;
  final int custId;

  TransactionModel({
    required this.id,
    required this.customerName,
    required this.qty,
    required this.userName,
    required this.safe,
    required this.date,
    required this.transactionType,
    required this.sheftId,
    required this.custId,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
        final DateTime openDateTime = DateTime.parse(json['date']);
    final DateFormat formatter = DateFormat('dd/MM/yyyy hh:mm a');
    final String formatopenDateTime = formatter.format(openDateTime);
    return TransactionModel(
      id: json['id'],
      customerName: json['customerName'],
      qty: json['qty'],
      userName: json['userName'],
      safe: json['safe'],
      date: formatopenDateTime.toString(),
      transactionType: json['transactionType'],
      sheftId: json['sheftId'],
      custId: json['custId'],
    );
  }
  static List<TransactionModel> fromJsonList(List<dynamic> jsonList) {
    List<TransactionModel> reportScreen = [];
    for (var jsonData in jsonList) {
      reportScreen.add(TransactionModel.fromJson(jsonData));
    }
    return reportScreen;
  }
}

class SupplierTransactionsModel {
  final int id;

  final String supplierName;

  final int qty;

  final String userName;

  final String safe;

  final String date;

  final String transactionType;
  final int sheftId;

  final int supplierId;

SupplierTransactionsModel({

required this.id,
required this.sheftId,
required this.transactionType,
required this.supplierId,
required this.date,
required this.safe,
required this.qty,
required this.userName,
required this.supplierName,
});
factory SupplierTransactionsModel.fromJson(Map<String, dynamic> json) {
     final DateTime dateTime = DateTime.parse(json['date']);
    final DateFormat formatter = DateFormat('dd/MM/yyyy hh:mm a');
    final String formattedDate = formatter.format(dateTime);
    return SupplierTransactionsModel(
      id: json['id'],
      sheftId: json['sheftId'],
      transactionType: json['transactionType'],
      supplierId: json['supplierId'],
      date: formattedDate,
      safe: json['safe'],
      qty: json['qty'],
      userName: json['userName'],
      supplierName: json['supplierName'],
    );
  }
  static List<SupplierTransactionsModel> fromJsonList(List<dynamic> jsonList) {
    List<SupplierTransactionsModel> reportScreen = [];
    for (var jsonData in jsonList) {
      reportScreen.add(SupplierTransactionsModel.fromJson(jsonData));
    }
    return reportScreen;
  }



}


class SupplierAccountsModel {
  final int supplierId;
  final String supplierName;
  final String phone;
  final String address;
  final String note;
  final double debt;
  final double credit;
  final double balance;
  final int invCount;

  SupplierAccountsModel({
    required this.supplierId,
    required this.supplierName,
    required this.phone,
    required this.address,
    required this.note,
    required this.debt,
    required this.credit,
    required this.balance,
    required this.invCount,
  });

  factory SupplierAccountsModel.fromJson(Map<String, dynamic> json) {
    return SupplierAccountsModel(
      supplierId: json['supplierId'],
      supplierName: json['supplierName'],
      phone: json['phone'],
      address: json['address'],
      note: json['note'],
      debt: json['debt'].toDouble(),
      credit: json['credit'].toDouble(),
      balance: json['balance'].toDouble(),
      invCount: json['invCount'],
    );
  }
   static List<SupplierAccountsModel> fromJsonList(List<dynamic> jsonList) {
    List<SupplierAccountsModel> reportScreen = [];
    for (var jsonData in jsonList) {
      reportScreen.add(SupplierAccountsModel.fromJson(jsonData));
    }
    return reportScreen;
  }
}


class SupplierDropDownModel {
  final int id;
  final dynamic invoiceDate;
  final double debt;
  final double credit;
  final double balance;
  final String type;
  final String supplierName;
  final int supplierId;
  final bool isInvoice;

  SupplierDropDownModel({
    required this.id,
    required this.invoiceDate,
    required this.debt,
    required this.credit,
    required this.balance,
    required this.type,
    required this.supplierName,
    required this.supplierId,
    required this.isInvoice,
  });

  factory SupplierDropDownModel.fromJson(Map<String, dynamic> json) {
    final DateTime openDateTime = DateTime.parse(json['invoiceDate']);
    final DateFormat formatter = DateFormat('dd/MM/yyyy hh:mm a');
    final String formatopenDateTime = formatter.format(openDateTime);
    return SupplierDropDownModel(
      id: json['id'],
      invoiceDate: formatopenDateTime.toString(),
      debt: json['debt'].toDouble(),
      credit: json['credit'].toDouble(),
      balance: json['balance'].toDouble(),
      type: json['type'],
      supplierName: json['supplierName'],
      supplierId: json['supplierId'],
      isInvoice: json['isInvoice'],
    );
  }
    static List<SupplierDropDownModel> fromJsonList(List<dynamic> jsonList) {
    List<SupplierDropDownModel> reportScreen = [];
    for (var jsonData in jsonList) {
      reportScreen.add(SupplierDropDownModel.fromJson(jsonData));
    }
    return reportScreen;
  }
}


class InvoiceItemTableModel {

  final String name;
  final double qty;
  final double salesPrice;
  final double service;
  final double tax;
  final double total;

  InvoiceItemTableModel({
    required this.name,
    required this.qty,
    required this.salesPrice,
    required this.service,
    required this.tax,
    required this.total,
  });

  factory InvoiceItemTableModel.fromJson(Map<String, dynamic> json) {
    return InvoiceItemTableModel(
      name: json['name'],
      qty: json['qty'].toDouble(),
      salesPrice: json['price'].toDouble(),
      service: json['service'].toDouble(),
      tax: json['tax'].toDouble(),
      total: json['total'].toDouble(),
    );
  }
  static List<InvoiceItemTableModel> fromJsonList(List<dynamic> jsonList) {
    List<InvoiceItemTableModel> reportScreen = [];
    for (var jsonData in jsonList) {
      reportScreen.add(InvoiceItemTableModel.fromJson(jsonData));
    }
    return reportScreen;
  }


}

class TablepurcheseInvoiceModel {
  final String name;
  final double qty;
  final double price;
  final double service;
  final double tax;
  final double total;

  TablepurcheseInvoiceModel({
    required this.name,
    required this.qty,
    required this.price,
    required this.service,
    required this.tax,
    required this.total,
  });

  factory TablepurcheseInvoiceModel.fromJson(Map<String, dynamic> json) {
    return TablepurcheseInvoiceModel(
      name: json['name'],
      qty: json['qty'].toDouble(),
      price: json['price'].toDouble(),
      service: json['service'].toDouble(),
      tax: json['tax'].toDouble(),
      total: json['total'].toDouble(),
    );
  }
   static List<TablepurcheseInvoiceModel> fromJsonList(List<dynamic> jsonList) {
    List<TablepurcheseInvoiceModel> reportScreen = [];
    for (var jsonData in jsonList) {
      reportScreen.add(TablepurcheseInvoiceModel.fromJson(jsonData));
    }
    return reportScreen;
  }
}


class TablereturnInvoicesalesModel {
  final String name;
  final double qty;
  final double price;
  final double service;
  final double tax;
  final double total;

  TablereturnInvoicesalesModel({
    required this.name,
    required this.qty,
    required this.price,
    required this.service,
    required this.tax,
    required this.total,
  });

  factory TablereturnInvoicesalesModel.fromJson(Map<String, dynamic> json) {
    return TablereturnInvoicesalesModel(
      name: json['name'],
      qty: json['qty'].toDouble(),
      price: json['price'].toDouble(),
      service: json['service'].toDouble(),
      tax: json['tax'].toDouble(),
      total: json['total'].toDouble(),
    );
  }
    static List<TablereturnInvoicesalesModel> fromJsonList(List<dynamic> jsonList) {
    List<TablereturnInvoicesalesModel> reportScreen = [];
    for (var jsonData in jsonList) {
      reportScreen.add(TablereturnInvoicesalesModel.fromJson(jsonData));
    }
    return reportScreen;
  }
}


class TabelreturnInvoicePurcheseModel {
  final String name;
  final double qty;
  final double price;
  final double service;
  final double tax;
  final double total;

  // Constructor
  TabelreturnInvoicePurcheseModel({
    required this.name,
    required this.qty,
    required this.price,
    required this.service,
    required this.tax,
    required this.total,
  });

  // Factory constructor
  factory TabelreturnInvoicePurcheseModel.fromJson(Map<String, dynamic> json) {
    return TabelreturnInvoicePurcheseModel(
      name: json['name'] as String,
      qty: json['qty'] as double,
      price: json['price'] as double,
      service: json['service'] as double,
      tax: json['tax'] as double,
      total: json['total'] as double,
    );
  }
  static List<TabelreturnInvoicePurcheseModel> fromJsonList(List<dynamic> jsonList) {
    List<TabelreturnInvoicePurcheseModel> reportScreen = [];
    for (var jsonData in jsonList) {
      reportScreen.add(TabelreturnInvoicePurcheseModel.fromJson(jsonData));
    }
    return reportScreen;
  }
}
