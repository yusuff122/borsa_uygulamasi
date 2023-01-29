import 'dart:async';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:doviz_projeler/model/kripto_model.dart';

class Controller extends GetxController {
  @override
  void onInit() {
    super.onInit();
    kriptoGetir();
    Timer.periodic(
      Duration(seconds: 40),
      (timer) => kriptoGetir(),
    );
  }

  List<KriptoModel> list = <KriptoModel>[].obs;
  List<dynamic> listGrafikSevis = <dynamic>[].obs;
  var isLoading = true.obs;
  Future<List<KriptoModel>> kriptoGetir() async {
    kriptoList = [];
    listGrafik = [];
    String url =
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=true&price_change_percentage=1d';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List<dynamic> jsonRes = [];
      jsonRes = json.decode(response.body);
      for (var i = 0; i < jsonRes.length; i++) {
        if (jsonRes[i] != null) {
          Map<String, dynamic> map = jsonRes[i];
          kriptoList.add(KriptoModel.fromJson(map));
          listGrafik.add(jsonRes[i]['sparkline_in_7d']['price']);
        }
      }
      list.assignAll(kriptoList);
      listGrafikSevis.assignAll(listGrafik);
      isLoading.value = false;
      print('coin istek gönderildi');
      return list;
    } else {
      print(response.statusCode);

      return throw Exception('istek başarısız');
    }
  }
}
