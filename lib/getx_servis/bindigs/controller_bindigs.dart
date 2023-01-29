import 'package:doviz_projeler/getx_servis/altin_servis.dart';
import 'package:doviz_projeler/getx_servis/coin_servis.dart';
import 'package:doviz_projeler/getx_servis/doviz_servis.dart';
import 'package:doviz_projeler/getx_servis/haber_servis.dart';
import 'package:doviz_projeler/getx_servis/internet_kontrol.dart';
import 'package:get/instance_manager.dart';

class ControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<InternetKontrol>(InternetKontrol());
    Get.put<Controller>(Controller());
    Get.put<ControllerHaber>(ControllerHaber());
    Get.put<AltinServis>(AltinServis());
    Get.put<DovizController>(DovizController());
    
  }
}
