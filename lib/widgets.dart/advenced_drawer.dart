import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:doviz_projeler/widgets.dart/haberler.dart';
import 'package:doviz_projeler/main.dart';
import 'package:doviz_projeler/widgets.dart/my_flutter_app_icons.dart';
import 'package:doviz_projeler/widgets.dart/page1.dart';
import 'package:doviz_projeler/widgets.dart/page2.dart';
import 'package:doviz_projeler/widgets.dart/page3.dart';
import 'package:doviz_projeler/widgets.dart/page4.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'hesap_makinesi.dart';
import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:sizer/sizer.dart';

class AdvanceDarwer extends StatefulWidget {
  const AdvanceDarwer({Key? key}) : super(key: key);

  @override
  State<AdvanceDarwer> createState() => _AdvanceDarwerState();
}

class _AdvanceDarwerState extends State<AdvanceDarwer> {
  final _advanceController = AdvancedDrawerController();
  final _pageController = PageController();
  MyApp? myApp;
  int maxCount = 4;
  List<Widget> altSayfalar = [
    const Page1(),
    const Page2(),
    const Page3(),
    const Page4()
  ];

  @override
  void dispose() {
    _pageController.dispose(); //sayfa kapandığında ne olsun
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdropColor: Color.fromARGB(255, 62, 58, 172),
      controller: _advanceController,
      animationCurve: Curves.easeInOut,
      animateChildDecoration: true,
      childDecoration: const BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            blurRadius: 0.0,
          ),
        ],
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      ),
      drawer: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            /*Colors.cyan,
                Color.fromARGB(255, 2, 102, 148),
                Colors.deepPurple*/
            Color(0xff1f005c),
            Color.fromARGB(255, 62, 58, 172),
            // Color(0xff870160),
          ])),
          child: ListTileTheme(
            textColor: Colors.black,
            child: Column(
              children: [
                Container(
                  width: 17.h,
                  height: 15.h,
                  margin: EdgeInsets.only(top: 5.h, bottom: 10.h),
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                    color: Colors.cyan,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'assets/images/doviz.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AdvanceDarwer()));
                  },
                  leading: const CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.home,
                      //color: Colors.white,
                    ),
                  ),
                  title: const Text(
                    'Anasayfa',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AramaSAyfa()));
                  },
                  leading: const CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.calculate,
                      //color: Colors.white,
                    ),
                  ),
                  title: const Text(
                    'Hesap Makinesi',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Ayarlar()));
                  },
                  leading: const CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.newspaper,
                      //color: Colors.white,
                    ),
                  ),
                  title: const Text(
                    'Haberler',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const Spacer(),
                DefaultTextStyle(
                    style: TextStyle(fontSize: 10.sp, color: Colors.white),
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 16),
                      child: const Text('Güncel borsa ve kripto para verileri'),
                    )),
              ],
            ),
          ),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 13, 2, 31),
          elevation: 0,
          title: const Text(
            'Döviz',
            style: TextStyle(color: Colors.white),
          ),
          leading: IconButton(
            onPressed: menuButtonTiklanma,
            icon: ValueListenableBuilder<AdvancedDrawerValue>(
              valueListenable: _advanceController,
              builder: ((context, value, _) {
                return const AnimatedSwitcher(
                  duration: Duration(milliseconds: 200),
                  child: Icon(
                    MyFlutterApp.menu_outline,
                    color: Colors.white70,
                  ),
                );
              }),
            ),
          ),
        ),
        body: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children:
              List.generate(altSayfalar.length, (index) => altSayfalar[index]),
        ),
        extendBody: true,
        bottomNavigationBar: (altSayfalar.length <= maxCount)
            ? AnimatedNotchBottomBar(
              
                pageController: _pageController,
                color: Color.fromARGB(255, 74, 61, 93),
                showLabel: false,

                // ignore: prefer_const_literals_to_create_immutables
                bottomBarItems: [
                  BottomBarItems(
                      inActiveItem: Icon(
                        Icons.home,
                        size: 25.sp,
                        color: Colors.grey,
                      ),
                      activeItem: Icon(
                        Icons.home,
                        color: Colors.cyan,
                        size: 25.sp,
                      ),
                      itemLabel: 'Page 1'),
                  BottomBarItems(
                      inActiveItem: Icon(
                        MyFlutterApp.gold_bar,
                        color: Colors.grey,
                        size: 25,
                      ),
                      activeItem: Icon(
                        MyFlutterApp.gold_bar,
                        color: Colors.yellow,
                        size: 30,
                      ),
                      itemLabel: 'Page 2'),
                  BottomBarItems(
                    inActiveItem: Icon(
                      MyFlutterApp.dollar,
                      color: Colors.grey,
                      size: 25,
                    ),
                    activeItem: Icon(
                      MyFlutterApp.dollar,
                      color: Color.fromARGB(255, 35, 129, 7),
                      size: 25,
                    ),
                    itemLabel: 'Page 3',
                  ),
                  BottomBarItems(
                    inActiveItem: Icon(
                      Icons.autorenew,
                      color: Colors.grey,
                      size: 25,
                    ),
                    activeItem: Icon(
                      Icons.autorenew,
                      color: Colors.cyan,
                      size: 25,
                    ),
                    itemLabel: 'Page 4',
                  ),
                ],
                onTap: (index) {
                  _pageController.animateToPage(index,
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeIn);
                })
            : null,
      ),
    );
  }

  void menuButtonTiklanma() {
    _advanceController.showDrawer();
  }
}
