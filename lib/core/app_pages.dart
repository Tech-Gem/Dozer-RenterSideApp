
import 'package:Dozer/homePage.dart';
import 'package:Dozer/main.dart';
import 'package:Dozer/presentation/equipment_list/home_screen.dart';


import 'package:get/get.dart';

class AppPages {
  static const INITIAL = '/';
  static const BID = '/bid';
  static const ALL_MACHINES = '/all_machines';
  static const BOOKINGS = '/bookings';
  static const BOOKINGFORM = '/booking_form';
  static const BOOKINGINFO = '/booking_info';

  static final routes = [
    GetPage(
      name: INITIAL,
      page: () => SplashPage(),
      
    ),
    
  ];
}
