import 'dart:io';
import 'package:doviz_projeler/widgets.dart/haberler.dart';
import 'package:doviz_projeler/getx_servis/haber_servis.dart';
import 'package:doviz_projeler/kart/coin_card.dart';
import 'package:doviz_projeler/model/haber_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:doviz_projeler/model/kripto_model.dart';
import 'package:flutter/material.dart';
import 'package:restart_app/restart_app.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import '../getx_servis/coin_servis.dart';
import '../getx_servis/internet_kontrol.dart';
import 'package:sizer/sizer.dart';

class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);
  @override
  State<Page1> createState() => _Page1State();
}

var client = HttpClient();
Haber? haber;

final GlobalKey<LiquidPullToRefreshState> _refreshIndicatorKey =
    GlobalKey<LiquidPullToRefreshState>();

final InternetKontrol _internetKontrol = Get.find<InternetKontrol>();

class _Page1State extends State<Page1> {


  final _controller = Get.put(Controller());

  final _haberController = Get.put(ControllerHaber());

  PageController _pageController = new PageController();

  InternetKontrol _internetKontrol = Get.put(InternetKontrol());
  
  @override
  void initState() {
    print(_internetKontrol.connectionStatus.value);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 13, 2, 31),
      body: Obx(() => _internetKontrol.connectionStatus.value == 1
          ? Container(
              color: Color.fromARGB(255, 13, 2, 31),
              child: CustomScrollView(
                physics: BouncingScrollPhysics(),
                slivers: [
                  SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                    return GestureDetector(
                      child: Container(
                        height: 30.h,
                        width: MediaQuery.of(context).size.width,
                        child: PageView(
                          controller: _pageController,
                          children: [
                            _page(index),
                            _page(index + 1),
                            _page(index + 2),
                            _page(index + 3),
                            _page(index + 4),
                            _page(index + 5),
                            _page(index + 6),
                            _page(index + 7),
                            _page(index + 8),
                          ],
                        ),
                      ),
                      onTap: (() => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Ayarlar(),
                          ))),
                    );
                  }, childCount: 1)),
                  SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                    return Container(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 13, 2, 31),
                          borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.all(10),
                      child: Center(
                          child: SmoothPageIndicator(
                        controller: _pageController,
                        count: 9,
                        textDirection: TextDirection.ltr,
                        effect: const ExpandingDotsEffect(
                            activeDotColor: Colors.green,
                            dotHeight: 10,
                            dotWidth: 10,
                            dotColor: Colors.white),
                        onDotClicked: ((index) {
                          sayfaGecis(index);
                        }),
                      )),
                    );
                  }, childCount: 1)),
                  SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      return Obx(() => _controller.isLoading.value
                          ? CircularProgressIndicator()
                          : CoinCard(
                              name: _controller.list[index].name,
                              symbol: _controller.list[index].image,
                              current_price:
                                  _controller.list[index].currentPrice,
                              marketCapChangePercentage24h: _controller
                                  .list[index].marketCapChangePercentage24h,
                              imageUrl: _controller.list[index].image,
                              dusuk24Saat: _controller.list[index].low24h,
                              yuksek24Saat: _controller.list[index].high24h,
                              tumZamanEnDusuk: _controller.list[index].atl,
                              tumZamanEnYuksek: _controller.list[index].ath,
                              islemHacim: _controller.list[index].totalVolume,
                              piyasaDeger: _controller.list[index].marketCap,
                              rank: _controller.list[index].marketCapRank,
                              grfikVeri: _controller.listGrafikSevis[index],
                              index: index,
                            ));
                    }, childCount: kriptoList.length),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        height: 4.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          //  color: const Color.fromARGB(255, 13, 2, 31)
                        ),
                      );
                    }, childCount: 1),
                  ),
                ],
              ),
            )
          : CupertinoAlertDialog(
              title: const Text('Bağlantı bulunamadı'),
              content: const Text('lütfen internet bağlantınızı kontrol edin'),
              actions: [
                TextButton(
                    onPressed: () {
                      if (Platform.isAndroid) {
                        Restart.restartApp();
                      }
                    },
                    child: Text('Ok'))
              ],
            )),
    );
  }

  Widget _page(index) {
    if (_haberController.controllerHaberList.length == 0) {
      return Center(child: CircularProgressIndicator(backgroundColor: Colors.white,));
    } else {
      return Obx(() => _haberController.isLoading.value
          ? CircularProgressIndicator()
          : Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(_haberController
                        .controllerHaberList[index].haberResim
                        .toString()),
                    fit: BoxFit.cover),
              ),
              child: Stack(
                children: [
                  Positioned(
                    bottom: 0,
                    child: Container(
                      height: 6.h,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.black38,
                      child: Text(
                        _haberController.controllerHaberList[index].haberManset
                            .toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 11.sp,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ));
    }
  }

  methodDegisimKontrol(double deger) {
    if (deger < 0) {
      return Text(deger.toStringAsFixed(3),
          style: TextStyle(color: Colors.red, fontSize: 14.sp));
    } else {
      return Text(deger.toStringAsFixed(3),
          style: TextStyle(color: Colors.green, fontSize: 14.sp));
    }
  }

  void sayfaGecis(int index) {
    _pageController.animateToPage(index,
        duration: Duration(milliseconds: 1), curve: Curves.ease);
  }
}
