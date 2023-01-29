import 'dart:io';
import 'package:doviz_projeler/widgets.dart/drop_down.dart';
import 'package:doviz_projeler/getx_servis/api_servis.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:restart_app/restart_app.dart';
import '../getx_servis/internet_kontrol.dart';
import 'package:sizer/sizer.dart';

class Page4 extends StatefulWidget {
  const Page4({Key? key}) : super(key: key);

  @override
  State<Page4> createState() => _Page4State();
}

class _Page4State extends State<Page4> {
  ApiClient client = ApiClient();
  List<double>? dovizDegerListe;
  List<String> dovizIsimListe = [];
  List<String> dovizIsimListe2 = [];
  List<String> indexBul = [];
  String? basla = '';
  String? devamEt = '';
  double deger1 = 0;
  double deger2 = 0;
  double miktar = 0;
  final myController = TextEditingController();
  final controllerTextMiktar = TextEditingController();
  final InternetKontrol _internetKontrol = Get.find<InternetKontrol>();
  Future<List<String>> isimMethod() async {
    return await client.dovizIsimGetir();
  }

  Future<List<double>> degerMethod() async {
    return await client.dovizDegerGetir();
  }

  @override
  void initState() {
    print(_internetKontrol.connectionStatus.value);
    super.initState();
    (() async {
      List<double> deger = await degerMethod();
      List<String> isim = await isimMethod();
      print(isim);
      if (this.mounted) {
        setState(() {
          dovizDegerListe = deger;
          dovizIsimListe = isim;
          dovizIsimListe2 = isim.reversed.toList();
          basla = dovizIsimListe[0];
          devamEt = dovizIsimListe2[0];
          var index = dovizIsimListe.indexOf(basla.toString());
          deger2 = dovizDegerListe![index];
          index = dovizIsimListe.indexOf(devamEt.toString());
          deger1 = dovizDegerListe![index];
        });
      }
    })();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 13, 2, 31),
        body: Obx(() => _internetKontrol.connectionStatus.value == 1
            ? ListView(physics: BouncingScrollPhysics(), children: [
                Center(
                  child: Text(
                    'Döviz çevirci',
                    style: TextStyle(color: Colors.white, fontSize: 21.sp),
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables

                  children: [
                    Container(
                      height: 8.h,
                      child: customDropdown(dovizIsimListe, devamEt!, (val) {
                        setState(() {
                          devamEt = val;
                          var index =
                              dovizIsimListe.indexOf(devamEt.toString());
                          deger1 = dovizDegerListe![index];
                          print(deger1);
                        });
                      }),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        String doviz3 = basla!;
                        setState(() {
                          basla = devamEt;
                          devamEt = doviz3;
                        });
                      },
                      child: Icon(
                        Icons.swap_vert,
                        size: 30,
                      ),
                      elevation: 0,
                      backgroundColor: Color.fromARGB(255, 15, 75, 123),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Container(
                      height: 8.h,
                      child: customDropdown(dovizIsimListe2, basla!, (val) {
                        setState(() {
                          basla = val;
                          var index = dovizIsimListe.indexOf(basla.toString());
                          deger2 = dovizDegerListe![index];
                          print(deger2);
                        });
                      }),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    TextField(
                      controller: controllerTextMiktar,
                      onChanged: ((value) {
                        myController.clear();
                        try {
                          miktar = double.parse(value);
                        } catch (e) {}

                        print('miktar2 $miktar');
                      }),
                      onSubmitted: (value) {
                        setState(() {
                          print(' value $value');
                        });
                      },
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: "Değer giriniz",
                          labelStyle: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 12.sp)),
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          methodDovizHesapla(deger1, deger2, miktar);
                        },
                        child: Text(
                          'Çevir',
                          style: TextStyle(fontSize: 18),
                        )),
                    SizedBox(
                      height: 2.h,
                    ),
                    Container(
                      width: double.infinity,
                      height: 10.h,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4)),
                      child: Column(children: [
                        TextField(
                            enabled: false,
                            controller: myController,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.bold))
                      ]),
                    ),
                    SizedBox(
                      height: 15.h,
                    )
                  ],
                )
              ])
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

  methodDovizHesapla(
      double cevrilecekDeger, double cevrilienDeger, double miktar) {
    double deger = (cevrilecekDeger / cevrilienDeger) * miktar;

    if (deger.toString() == 'NaN' || deger < 0.0001) {
      myController.text = 'Lütfen para birimi seçiniz';
    } else {
      myController.text = deger.toStringAsFixed(6);
    }

    controllerTextMiktar.clear();
  }
}
