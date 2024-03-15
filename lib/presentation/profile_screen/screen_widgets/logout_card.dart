
import 'package:Dozer/utils%20-%20Copy/get_storage_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LogoutCard extends StatelessWidget {
  const LogoutCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.5,
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(5), // Adjust the border-radius as needed
      ),
      color: Colors.white,
      margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 0.2.h),
      child: InkWell(
        onTap: () async {
          await GetStorageHelper.clearAll();
          // await Get.offAllNamed<void>(RoutesName.loginScreen);
        },
        child: Padding(
          padding: EdgeInsets.all(2.0.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/logout_icon.svg',
                    // Replace with your actual path to the logout icon
                    width: 3.w,
                    height: 3.h,
                  ),
                  SizedBox(width: 4.0.w), // Responsive spacing

                  Text(
                    'Log Out',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
