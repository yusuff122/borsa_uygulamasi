import 'dart:async';
import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class InternetKontrol extends GetxController {
  var connectionStatus = 1.obs;
  late StreamSubscription subscription;

  @override
  void onInit() {
    super.onInit();
    baglantiAl();
  }

  baglantiAl() => subscription = Connectivity()
          .onConnectivityChanged
          .listen((ConnectivityResult baglantiSonuc) async {
        final baglantiKontrol = await Connectivity().checkConnectivity();
        if (baglantiKontrol == ConnectivityResult.none) {
          connectionStatus.value = 0;
        } else {
          connectionStatus.value = 1;
        }
      });
}
