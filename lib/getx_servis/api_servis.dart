import 'dart:convert';

import 'package:doviz_projeler/model/doviz_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:xml2json/xml2json.dart';

import '../model/altin_model.dart';

class ApiClient {
  final Xml2Json xml2json = Xml2Json();

  Future<List<String>> dovizIsimGetir() async {
    List<String> dovizIsimListe = [];
    String url = "https://www.tcmb.gov.tr/kurlar/today.xml";
    var res = await http.get(Uri.parse(url));
    xml2json.parse(res.body);
    var jsStr = await xml2json.toParker();
    var jsonRes = jsonDecode(jsStr);
    var jsonLs = jsonRes["Tarih_Date"]["Currency"] as List;
    print(jsonLs.length);
    for (int i = 0; i < jsonLs.length; i++) {
      dovizIsimListe.add(jsonLs[i]['CurrencyName']);
    }
    return dovizIsimListe;
  }

  Future<List<double>> dovizDegerGetir() async {
    List<double> dovizDegerListe = [];
    String url = "https://www.tcmb.gov.tr/kurlar/today.xml";
    var res = await http.get(Uri.parse(url));
    xml2json.parse(res.body);
    var jsStr = await xml2json.toParker();
    var jsonRes = jsonDecode(jsStr);
    var jsonLs = jsonRes["Tarih_Date"]["Currency"] as List;
    print(jsonLs.length);
    for (int i = 0; i < jsonLs.length; i++) {
      dovizDegerListe.add(double.parse(jsonLs[i]['ForexBuying'].toString()));
      print(dovizDegerListe[i]);
    }
    return dovizDegerListe;
  }

  List<Currency> apiList = [];
  Future dovizGetir() async {
    String url = "https://www.tcmb.gov.tr/kurlar/today.xml";
    var res = await http.get(Uri.parse(url));
    xml2json.parse(res.body);
    var jsStr = await xml2json.toParker();
    var jsonRes = jsonDecode(jsStr);
    var jsonLs = jsonRes["Tarih_Date"]["Currency"] as List;
    apiList = (jsonLs as List).map((e) => Currency.fromJson(e)).toList();
    return apiList;
  }
}
