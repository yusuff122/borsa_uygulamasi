class Welcome5 {
  Welcome5({
    required this.tarihDate,
  });

  TarihDate tarihDate;
}

class TarihDate {
  TarihDate({
    required this.currency,
    required this.tarih,
    required this.date,
    required this.bultenNo,
  });

  List<Currency> currency;
  String tarih;
  String date;
  String bultenNo;
}

class Currency {
  Currency({
    required this.unit,
    required this.isim,
    required this.currencyName,
    required this.forexBuying,
    required this.forexSelling,
    required this.banknoteBuying,
    required this.banknoteSelling,
    required this.crossRateUsd,
    required this.crossRateOther,
    required this.crossOrder,
    required this.kod,
    required this.currencyCode,
  });

  String unit;
  String isim;
  String currencyName;
  String forexBuying;
  String forexSelling;
  String banknoteBuying;
  String banknoteSelling;
  String crossRateUsd;
  String crossRateOther;
  String crossOrder;
  String kod;
  String currencyCode;

  factory Currency.fromJson(Map<String, dynamic> json) {
    return Currency(
      unit: json['Unit'].toString(),
      isim: json['Isim'].toString(),
      currencyName: json['CurrencyName'].toString(),
      forexBuying: json['ForexBuying'].toString(),
      forexSelling: json['ForexSelling'].toString(),
      banknoteBuying: json['BanknoteBuying'].toString(),
      banknoteSelling: json['BanknoteSelling'].toString(),
      crossRateUsd: json["CrossRateUsd"].toString(),
      crossRateOther: json["CrossRateOther"].toString(),
      crossOrder: json["CrossOrder"].toString(),
      kod: json["Kod"].toString(),
      currencyCode: json["CurrencyCode"].toString(),
    );
  }
}

List<Currency> dovizList = [];
