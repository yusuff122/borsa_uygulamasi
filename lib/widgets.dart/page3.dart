import 'dart:async';
import 'dart:io';
import 'package:doviz_projeler/getx_servis/doviz_servis.dart';
import 'package:doviz_projeler/kart/my_card.dart';
import 'package:doviz_projeler/model/doviz_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restart_app/restart_app.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:sizer/sizer.dart';
import '../getx_servis/internet_kontrol.dart';

class Page3 extends StatefulWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  @override
  void initState() {
    print(_internetKontrol.connectionStatus.value);
    super.initState();
  }

  final controller = PageController(viewportFraction: 0.8, keepPage: true);
  final _controllerDoviz = Get.put(DovizController());
  InternetKontrol _internetKontrol = Get.put(InternetKontrol());

  @override
  Widget build(BuildContext context) {
    if (_controllerDoviz.listDovizController.isEmpty) {
      return Container(
          color: Color.fromARGB(255, 13, 2, 31),
          child: Center(
              child: CircularProgressIndicator(
            backgroundColor: Colors.white,
          )));
    } else {
      return Scaffold(
          backgroundColor: const Color.fromARGB(255, 13, 2, 31),
          body: Obx(() => _internetKontrol.connectionStatus.value == 1
              ? Center(
                  child: CustomScrollView(
                      physics: const BouncingScrollPhysics(),
                      slivers: [
                        SliverList(
                          delegate:
                              SliverChildBuilderDelegate((context, index) {
                            return Container(
                              color: const Color.fromARGB(255, 13, 2, 31),
                              height: 35.h,
                              width: 100.h,
                              child: PageView(
                                controller: controller,
                                scrollDirection: Axis.horizontal,
                                children: [
                                  MyCard(
                                    isim: _controllerDoviz
                                        .listDovizController[0].isim,
                                    alis: double.parse(_controllerDoviz
                                        .listDovizController[0].forexBuying),
                                    satis: double.parse(_controllerDoviz
                                        .listDovizController[0].forexSelling),
                                  ),
                                  MyCard(
                                      isim: _controllerDoviz
                                          .listDovizController[3].isim,
                                      alis: double.parse(_controllerDoviz
                                          .listDovizController[3].forexBuying),
                                      satis: double.parse(_controllerDoviz
                                          .listDovizController[3]
                                          .forexSelling)),
                                ],
                              ),
                            );
                          }, childCount: 1),
                        ),
                        SliverList(
                            delegate:
                                SliverChildBuilderDelegate((context, index) {
                          return Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SmoothPageIndicator(
                                  controller: controller,
                                  count: 2,
                                  effect: ExpandingDotsEffect(
                                      activeDotColor: Colors.deepPurple),
                                ),
                              ]);
                        }, childCount: 1)),
                        SliverList(
                            delegate:
                                SliverChildBuilderDelegate((context, index) {
                          return Obx(
                              () => _internetKontrol.connectionStatus.value != 1
                                  ? CircularProgressIndicator()
                                  : ExpansionTile(
                                      //iconColor: Colors.cyan,
                                      //collapsedIconColor: Colors.cyan,

                                      title: Text(
                                        _controllerDoviz
                                            .listDovizController[index]
                                            .currencyName
                                            .toString(),
                                        style: TextStyle(
                                            color: Colors.deepPurple.shade200,
                                            fontSize: 11.sp),
                                      ),
                                      initiallyExpanded: false,
                                      subtitle: Text(
                                        '${_controllerDoviz.listDovizController[index].forexBuying} ₺',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12.sp),
                                      ),
                                      trailing: Icon(
                                        Icons.arrow_drop_down_rounded,
                                        color: Colors.cyan,
                                        size: 40,
                                      ),
                                      key: PageStorageKey("$index"),
                                      children: [
                                        Container(
                                          color:
                                              Colors.deepPurpleAccent.shade700,
                                          height: 8.h,
                                          child: Row(
                                            children: [
                                              Text(
                                                  '     Döviz Alış ${_controllerDoviz.listDovizController[index].forexBuying}₺',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12.sp)),
                                              Text(
                                                  '     Döviz Satış ${_controllerDoviz.listDovizController[index].forexSelling}₺',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12.sp)),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          color:
                                              Colors.deepPurpleAccent.shade700,
                                          height: 8.h,
                                          child: Row(
                                            children: [
                                              Text(
                                                  _controllerDoviz
                                                              .listDovizController[
                                                                  index]
                                                              .banknoteBuying ==
                                                          ''
                                                      ? '  Efektif Alış :'
                                                      : '     Efektif Alış ${_controllerDoviz.listDovizController[index].banknoteBuying}₺',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12.sp)),
                                              Text(
                                                  _controllerDoviz
                                                              .listDovizController[
                                                                  index]
                                                              .banknoteSelling ==
                                                          ''
                                                      ? '           Efektif Satış :'
                                                      : '    Efektif Satış ${_controllerDoviz.listDovizController[index].banknoteSelling}₺',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12.sp)),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ));
                        }, childCount: dovizList.length)),
                        SliverList(
                          delegate:
                              SliverChildBuilderDelegate((context, index) {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              height: 15.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: const Color.fromARGB(255, 13, 2, 31)),
                            );
                          }, childCount: 1),
                        ),
                      ]),
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
}
