import 'dart:io';

import 'package:doviz_projeler/widgets.dart/haber_detay.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restart_app/restart_app.dart';
import '../getx_servis/haber_servis.dart';
import '../getx_servis/internet_kontrol.dart';
import '../model/haber_model.dart';

class Ayarlar extends StatefulWidget {
  const Ayarlar({Key? key}) : super(key: key);

  @override
  State<Ayarlar> createState() => _AyarlarState();
}

class _AyarlarState extends State<Ayarlar> {
  Haber? haber;
  int? sayfaIndex;
  Map<String, List> haberMap = Map<String, List>();
  final _haberController = Get.put(ControllerHaber());
  InternetKontrol _internetKontrol = Get.put(InternetKontrol());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 13, 2, 31),
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white, size: 28),
          title: const Text(
            'Haberler',
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
          backgroundColor: Color.fromARGB(255, 13, 2, 31),
          elevation: 0,
        ),
        body: Obx(() => _internetKontrol.connectionStatus.value == 1
            ? Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Color.fromARGB(255, 13, 2, 31),
                ),
                child: _haberController.isLoading.value
                    ? CircularProgressIndicator()
                    : ListView.builder(
                        padding: const EdgeInsets.all(2),
                        itemCount: _haberController.controllerHaberList.length,
                        itemBuilder: (context, index) {
                          return Card(
                              color: Color.fromARGB(255, 13, 2, 31),
                              elevation: 0,
                              child: ListTile(
                                leading: Container(
                                  width: 90,
                                  height: 65,
                                  child: Image.network(
                                    _haberController
                                        .controllerHaberList[index].haberResim
                                        .toString(),
                                  ),
                                ),
                                title: Text(
                                    _haberController
                                        .controllerHaberList[index].haberManset
                                        .toString(),
                                    style: TextStyle(color: Colors.white70)),
                                trailing: const Icon(
                                  Icons.keyboard_arrow_right,
                                  size: 32,
                                  color: Colors.white,
                                ),
                                onTap: (() {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HaberDetay(
                                                haberDetay: _haberController
                                                    .controllerHaberList[index]
                                                    .haberMetni
                                                    .toString(),
                                                haberImageUrl: haberList[index]
                                                    .haberResim
                                                    .toString(),
                                                haberMansetDetay:
                                                    haberList[index]
                                                        .haberAciklama
                                                        .toString(),
                                              )));
                                }),
                              ));
                        },
                      ),
              )
            : CupertinoAlertDialog(
                title: const Text('Bağlantı bulunamadı'),
                content:
                    const Text('lütfen internet bağlantınızı kontrol edin'),
                actions: [
                  TextButton(
                      onPressed: () {
                        if (Platform.isAndroid) {
                          Restart.restartApp();
                        }
                      },
                      child: Text('Ok'))
                ],
              )));
  }
}
