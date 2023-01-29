import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../getx_servis/coin_servis.dart';

class Grafiktext extends StatelessWidget {
  Grafiktext(
      {required this.yuksek24Saat,
      required this.dusuk24Saat,
      required this.islemHacim,
      required this.piyasaDeger,
      required this.tumZamanEnYuksek,
      required this.tumZamanEnDusuk,
      this.rank});
  var yuksek24Saat;
  var dusuk24Saat;
  var islemHacim;
  var piyasaDeger;
  var tumZamanEnYuksek;
  var tumZamanEnDusuk;
  var rank;

  final _controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50.h,
        width: MediaQuery.of(context).size.width,
        child: Obx(
          () => _controller.isLoading.value
              ? CircularProgressIndicator()
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    DividerClass(
                        baslik: 'Yüksek 24s ', deger: yuksek24Saat.toString()),
                    DividerClass(
                        baslik: 'Düşük 24s ', deger: dusuk24Saat.toString()),
                    DividerClass(
                        baslik: 'İşlem hacmi ', deger: islemHacim.toString()),
                    DividerClass(
                        baslik: 'Piyasa Değeri', deger: piyasaDeger.toString()),
                    DividerClass(
                        baslik: 'Piyasa Değeri Sıralaması',
                        deger: rank.toString()),
                    DividerClass(
                        baslik: 'Tüm zamanların en yükseği',
                        deger: tumZamanEnYuksek.toString()),
                    DividerClass(
                        baslik: 'Tüm zamanların en düşüğü',
                        deger: tumZamanEnDusuk.toString()),
                    SizedBox(
                      height: 40,
                    )
                  ],
                ),
        ));
  }
}

class DividerClass extends StatelessWidget {
  String baslik = "";
  String deger = "";
  DividerClass({required this.baslik, required this.deger});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(top: 2.h),
        decoration: BoxDecoration(
            border:
                Border(bottom: BorderSide(color: Colors.white30, width: 1))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              baslik,
              style: TextStyle(color: Colors.white70, fontSize: 13.sp),
            ),
            Text(
              deger,
              style: TextStyle(color: Colors.white70, fontSize: 13.sp),
            )
          ],
        ),
      ),
    );
  }
}
