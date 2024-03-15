import 'package:Dozer/data/network/network_info.dart';
import 'package:Dozer/utils%20-%20Copy/logger.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Logger.init(kReleaseMode ? LogMode.live : LogMode.debug);
    final connectivity = Connectivity();
    Get.put(NetworkInfo(connectivity));
  }
}
