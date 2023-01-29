import 'dart:async';
import 'dart:convert';
import 'package:doviz_projeler/model/haber_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:xml2json/xml2json.dart';

class ControllerHaber extends GetxController {
  @override
  void onInit() {
    haberGetir();
    Timer.periodic(
      Duration(seconds: 60),
      (timer) => haberGetir(),
    );
    super.onInit();
  }

  List<Haber> controllerHaberList = <Haber>[].obs;
  var isLoading = true.obs;
  String haberUrl =
      'https://www.trthaber.com/xml_mobile.php?tur=xml_genel&kategori=ekonomi&adet=20&selectEx=yorumSay,okunmaadedi,anasayfamanset,kategorimanset';

  Future<List> haberGetir() async {
    haberList = [];
    final Xml2Json xml2json = Xml2Json();
    var res = await http.get(Uri.parse(haberUrl));
    if (res.statusCode == 200) {
      var jsonRes;
      xml2json.parse(res.body);
      var jsonString = await xml2json.toParker();
      jsonRes = jsonDecode(jsonString);
      var jsonLs = jsonRes['haberler']['haber'] as List;
      haberList = (jsonLs as List).map((e) => Haber.fromJson(e)).toList();
      controllerHaberList.assignAll(haberList);
      print('haber istek gönderildi');
      isLoading.value = false;
      return controllerHaberList;
    } else {
      print(res.statusCode);
      return throw Exception();
    }
  }
}
