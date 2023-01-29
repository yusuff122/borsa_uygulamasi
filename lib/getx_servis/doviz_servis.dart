import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:doviz_projeler/model/doviz_model.dart';
import 'package:get/get.dart';
import 'package:xml2json/xml2json.dart';

class DovizController extends GetxController {
  @override
  void onInit() {
    dovizGetir();
    Timer.periodic(
      Duration(seconds: 30),
      (timer) => dovizGetir(),
    );
    super.onInit();
  }

  List<Currency> listDovizController = <Currency>[].obs;
  final Xml2Json xml2json = Xml2Json();
  var isLoading = true.obs;

  Future dovizGetir() async {
    dovizList = [];
    print('çalıştı');
    String url = "https://www.tcmb.gov.tr/kurlar/today.xml";
    var res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      xml2json.parse(res.body);
      var jsStr = await xml2json.toParker();
      var jsonRes = jsonDecode(jsStr);
      var jsonLs = jsonRes["Tarih_Date"]["Currency"] as List;
      dovizList = (jsonLs).map((e) => Currency.fromJson(e)).toList();
      listDovizController.assignAll(dovizList);
      isLoading.value = false;
      print('doviz istek gönderildi');
      return listDovizController;
    } else {
      print(res.statusCode);
    }
  }
}
