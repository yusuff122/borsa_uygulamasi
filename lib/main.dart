import 'dart:io';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:doviz_projeler/getx_servis/bindigs/controller_bindigs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:sizer/sizer.dart';
import 'widgets.dart/advenced_drawer.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  WidgetsFlutterBinding.ensureInitialized();

  ByteData data =
      await PlatformAssetBundle().load('assets/ca/lets-encrypt-r3.pem');
  SecurityContext.defaultContext
      .setTrustedCertificatesBytes(data.buffer.asUint8List());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static bool karanlikMod = false;

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark().copyWith(
          appBarTheme: AppBarTheme(
            color: Color.fromARGB(255, 8, 1, 18),
          ),
          scaffoldBackgroundColor: Color.fromARGB(255, 8, 1, 18),
        ),
        themeMode: ThemeMode.light,
        initialBinding: ControllerBindings(),
        title: 'Material App',
        home: BaslangicEkran(),
      );
    });
  }
}

class BaslangicEkran extends StatelessWidget {
  const BaslangicEkran({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        children: [
          Image.asset(
            'assets/images/bitcoin.png',
            height: 15.h,
            width: 17.h,
          ),
          Text(
            'Bull time',
            style: TextStyle(
                color: Colors.white, fontSize: 40.sp, fontWeight: FontWeight.w400),
          )
        ],
      ),
      backgroundColor: Color.fromARGB(255, 20, 8, 41),
      nextScreen: AdvanceDarwer(),
      splashIconSize: 250,
      duration: 5000,
      splashTransition: SplashTransition.fadeTransition,
      animationDuration: Duration(seconds: 2),
    );
  }
}
