import 'dart:async';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/altin_model.dart';
import '../model/atlin_lint.dart';
import 'dart:convert';

class AltinServis extends GetxController {
  @override
  void onInit() {
    getData();
    Timer.periodic(
      Duration(minutes: 5),
      (timer) => getData(),
    );
    super.onInit();
  }

  List<Altin> listAltinController = <Altin>[].obs;
  var isLoading = true.obs;

  Future getData() async {
    filteredList = [];
    AyarAltins ayarAltins = await altinGetir();

    Map<String, dynamic> map = ayarAltins.toJson();

    filteredList =
        ayarAltins.elements.where((element) => element.buying > 700).toList();

    listAltinController.assignAll(filteredList);
    isLoading.value = false;
    print('altın istek gönderildi');
    return listAltinController;
  }

  Future<AyarAltins> altinGetir() async {
    String url = 'https://finans.truncgil.com/v4/today.json';
    final res = await http.get(Uri.parse(url));

    if (res.statusCode != 200) {
      throw Exception('error');
    }
    var altin = utf8.decode(res.body.runes.toList());
      print(altin);
    var js = json.decode(altin);
    js;
    return AyarAltins.fromJson(js);
  }
}
