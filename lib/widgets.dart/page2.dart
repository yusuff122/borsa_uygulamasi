import 'dart:async';
import 'dart:io';
import 'package:doviz_projeler/getx_servis/altin_servis.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:doviz_projeler/widgets.dart/my_flutter_app_icons.dart';
import 'package:flutter/material.dart';
import 'package:restart_app/restart_app.dart';
import '../getx_servis/internet_kontrol.dart';
import 'package:sizer/sizer.dart';

class Page2 extends StatefulWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  Future? altinGet;

  final _altinControler = Get.put(AltinServis());
  InternetKontrol _internetKontrol = Get.put(InternetKontrol());
  @override
  void initState() {
    print('value = ');
    print(_altinControler.isLoading.value);

    super.initState();
  }

  var data = [
    1.0,
    1.5,
    1.3,
    0.0,
    -0.1,
    -1.0,
    -0.3,
    0.0,
    0.0,
    1.3,
    0.0,
    0.1,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 13, 2, 31),
        body: Obx(() => _internetKontrol.connectionStatus.value == 1
            ? Center(
                child: SingleChildScrollView(
                  child: Column(children: [
                    Container(
                      color: Color.fromARGB(255, 13, 2, 31),
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: CustomScrollView(
                          physics: BouncingScrollPhysics(),
                          slivers: [
                            SliverList(
                              delegate:
                                  SliverChildBuilderDelegate((context, index) {
                                return Container(
                                  height: 15.h,
                                  child: Center(
                                      child: Obx(
                                    () => _altinControler.isLoading.value
                                        ? Center(
                                            child: CircularProgressIndicator(
                                            backgroundColor: Colors.white,
                                          ))
                                        : Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                ' ${_altinControler.listAltinController[index + 4].name} ',
                                                style: TextStyle(
                                                    color:
                                                        Colors.yellow.shade100,
                                                    fontSize: 11.sp),
                                              ),
                                              Text(
                                                '${_altinControler.listAltinController[index + 4].buying.toString()}₺',
                                                style: TextStyle(
                                                    color: Colors.yellow,
                                                    fontSize: 22.sp),
                                              ),
                                            ],
                                          ),
                                  )),
                                );
                              }, childCount: 1),
                            ),
                            SliverGrid(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2),
                                delegate: SliverChildBuilderDelegate(
                                    (context, index) {
                                  return Card(
                                      margin: EdgeInsets.only(
                                          bottom: 0, left: 3.h, right: 3.h),
                                      color:
                                          const Color.fromARGB(255, 13, 2, 31),
                                      elevation: 30,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(11),
                                            gradient:
                                                const LinearGradient(colors: [
                                              Color.fromARGB(255, 40, 7, 98),
                                              Color.fromARGB(255, 33, 6, 76),
                                              Color.fromARGB(255, 21, 3, 51)
                                            ])),
                                        child: Obx(
                                          () => _altinControler.isLoading.value
                                              ? Container(
                                                  color: Color.fromARGB(
                                                      255, 13, 2, 31),
                                                )
                                              : Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        SizedBox(
                                                          width: 1.h,
                                                        ),
                                                        const Icon(
                                                          MyFlutterApp.gold_bar,
                                                          color: Colors.yellow,
                                                          size: 30,
                                                        ),
                                                        SizedBox(
                                                          width: 8,
                                                        ),
                                                        Text(
                                                          '${_altinControler.listAltinController[index].name}',
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .white70,
                                                              fontSize: 10.sp),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 4.h,
                                                    ),
                                                    Text(
                                                      '${_altinControler.listAltinController[index].buying.toStringAsFixed(1)}₺',
                                                      style: TextStyle(
                                                          color: Colors.yellow,
                                                          fontSize: 20.sp),
                                                    ),
                                                    SizedBox(
                                                      height: 2.h,
                                                    ),
                                                    Expanded(
                                                      child: Sparkline(
                                                        lineColor:
                                                            Colors.yellow,
                                                        data: data,
                                                        lineWidth: 2,
                                                        useCubicSmoothing: true,
                                                        fillMode:
                                                            FillMode.below,
                                                        fillColor:
                                                            Color.fromARGB(
                                                                255, 27, 5, 61),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 0,
                                                    )
                                                  ],
                                                ),
                                        ),
                                      ));
                                }, childCount: 2)),
                            SliverList(
                              delegate:
                                  SliverChildBuilderDelegate((context, index) {
                                return Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 10.h,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Color.fromARGB(255, 13, 2, 31)),
                                );
                              }, childCount: 1),
                            ),
                            SliverList(
                              delegate:
                                  SliverChildBuilderDelegate((context, index) {
                                return Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 10.h,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: const Color.fromARGB(
                                            255, 13, 2, 31)),
                                    child: Obx(
                                      () => _altinControler.isLoading.value
                                          ? Container(
                                              color: Color.fromARGB(
                                                  255, 13, 2, 31),
                                            )
                                          : ListTile(
                                              leading: CircleAvatar(
                                                  backgroundColor:
                                                      Color.fromARGB(
                                                          255, 43, 20, 79),
                                                  child: Text(
                                                      (index + 1).toString())),
                                              title: Text(
                                                  '${_altinControler.listAltinController[index].name}',
                                                  style: TextStyle(
                                                      color: Colors.white70,
                                                      fontSize: 14.sp)),
                                              subtitle: Text(
                                                  'Alış : ${_altinControler.listAltinController[index].buying}₺',
                                                  style: TextStyle(
                                                      color: Colors.white70,
                                                      fontSize: 12.sp)),
                                              trailing: Text(
                                                  '\n Satış : ${_altinControler.listAltinController[index].selling}₺',
                                                  style: TextStyle(
                                                      color: Colors.white70,
                                                      fontSize: 12.sp)),
                                            ),
                                    ));
                              }, childCount: 13),
                            ),
                            SliverList(
                              delegate:
                                  SliverChildBuilderDelegate((context, index) {
                                return Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 30.h,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color:
                                          const Color.fromARGB(255, 13, 2, 31)),
                                );
                              }, childCount: 1),
                            ),
                          ]),
                    ),
                  ]),
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

  listeyeDonustur(Map<String, dynamic> data) {
    return data.entries.map((e) {
      return e.value;
    }).toList();
  }
}
