import 'dart:io';

import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:doviz_projeler/grafik/grafik_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restart_app/restart_app.dart';
import '../getx_servis/coin_servis.dart';
import '../getx_servis/internet_kontrol.dart';
import 'package:sizer/sizer.dart';

class Deneme extends StatefulWidget {
  var name;
  var symbol;
  var anlikFiyat;
  var gunlukdegisim;
  var yuksek24Saat;
  var dusuk24Saat;
  var islemHacim;
  var piyasaDeger;
  var tumZamanEnYuksek;
  var tumZamanEnDusuk;
  var rank;
  int index;
  var grfikVeri;
  Deneme(
      {required this.name,
      required this.symbol,
      required this.anlikFiyat,
      required this.gunlukdegisim,
      required this.yuksek24Saat,
      required this.dusuk24Saat,
      required this.islemHacim,
      required this.piyasaDeger,
      required this.tumZamanEnYuksek,
      required this.tumZamanEnDusuk,
      required this.rank,
      required this.grfikVeri,
      required this.index});

  @override
  State<Deneme> createState() => _DenemeState();
}

class _DenemeState extends State<Deneme> {
  List<double> data = [];
  final _controller = Get.put(Controller());
  InternetKontrol _internetKontrol = Get.put(InternetKontrol());
  @override
  void initState() {
    for (int i = 0; i < 150; i++) {
      data.add(double.parse(widget.grfikVeri[0][i].toString()));
    }
    print(_controller.isLoading.value);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 13, 2, 31),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 13, 2, 31),
          centerTitle: true,
          title: Row(children: [
            Text(
              widget.name,
              style: TextStyle(fontSize: 25),
            ),
            Image.network(
              widget.symbol,
              height: 9.h,
              scale: 6.0,
            ),
          ]),
          elevation: 0,
        ),
        body: Obx(() => _internetKontrol.connectionStatus.value == 1
            ? ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Obx(() => _controller.isLoading.value
                              ? CircularProgressIndicator()
                              : Text(
                                  '\$ ${widget.anlikFiyat.toString()}',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20.sp),
                                )),
                          SizedBox(height: 3.h),
                        ],
                      ),
                    ),
                  ),
                  Center(
                      child: Obx(
                    () => _controller.isLoading.value
                        ? CircularProgressIndicator()
                        : Text(
                            widget.gunlukdegisim.toString(),
                            style: TextStyle(
                                color: widget.gunlukdegisim > 0
                                    ? Colors.green
                                    : Colors.red,
                                fontSize: 14),
                          ),
                  )),
                  SizedBox(
                    height: 5.h,
                  ),
                  Container(
                    height: 25.h,
                    child: Sparkline(
                      lineColor: Colors.cyan,
                      data: data,
                      lineWidth: 2,
                      useCubicSmoothing: true,
                      fillMode: FillMode.below,
                      fillColor: Color.fromARGB(255, 27, 5, 61),
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Center(
                      child: Text(
                    '${widget.name} 7 günlük grafiği',
                    style: TextStyle(color: Colors.lime, fontSize: 3.h),
                  )),
                  SizedBox(
                    height: 2.h,
                  ),
                  Divider(
                    height: 5,
                    color: Colors.white54,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 6.h, right: 6.h),
                      child: Obx(
                        () => _controller.isLoading.value
                            ? CircularProgressIndicator()
                            : Grafiktext(
                                dusuk24Saat: widget.dusuk24Saat,
                                yuksek24Saat: widget.yuksek24Saat,
                                islemHacim: widget.islemHacim,
                                piyasaDeger: widget.piyasaDeger,
                                tumZamanEnDusuk: widget.tumZamanEnDusuk,
                                tumZamanEnYuksek: widget.tumZamanEnYuksek,
                                rank: widget.rank,
                              ),
                      )),
                ],
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
