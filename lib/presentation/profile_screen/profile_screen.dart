import 'package:Dozer/core/utils/colors.dart';
import 'package:Dozer/presentation/profile_screen/controller/profile_controller.dart';
import 'package:Dozer/presentation/profile_screen/screen_widgets/custom_card.dart';
import 'package:Dozer/presentation/profile_screen/screen_widgets/logout_card.dart';
import 'package:Dozer/presentation/profile_screen/screen_widgets/profile_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfileScreen extends GetView<ProfileController> {
  ProfileScreen({super.key});
  final controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
          backgroundColor: primaryColor,
        ),
        body: Obx(() {
          if (controller.status.value == Status.loading) {
            return Center(child: CircularProgressIndicator());
          } else if (controller.status.value == Status.error) {
            return Center(child: Text('Error loading profile. Please try again.'));
          } else if (controller.profile.value != null) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ProfileCard(profile: controller.profile.value!),
                  SizedBox(height: 2.5.h),
    
                  // Email and Phone Number Information
                  CustomCard(
                    iconPath: 'assets/icons/info.svg',
                    labelText: 'Account Information',
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 1.h),
                    padding: EdgeInsets.all(2.0.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
    
                        Text(
                          'Email: ${controller.profile.value!.email ?? "Not Available"}',
                          style: TextStyle(
                            fontSize: 14.0.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 1.0.h),
                        Text(
                          'Phone Number: ${controller.profile.value!.phoneNumber ?? "Not Verified"}',
                          style: TextStyle(
                            fontSize: 14.0.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
    
                  SizedBox(height: 2.5.h),
    
                  // Additional content in the profile screen
                  InkWell(
                    onTap: () {
                      // Add functionality to navigate to settings screen
                      print("Settings tapped");
                    },
                    child: CustomCard(
                      iconPath: 'assets/icons/settings.svg',
                      labelText: 'Settings',
                    ),
                  ),
    
                  InkWell(
                    onTap: () {
                      // Add functionality to report bugs/issues
                      print("Report Bugs/Issues tapped");
                    },
                    child: CustomCard(
                      iconPath: 'assets/icons/message-report.svg',
                      labelText: 'Report Bugs/Issues',
                    ),
                  ),
    
                  InkWell(
                    onTap: () {
                      // Add functionality to navigate to history screen
                      print("History tapped");
                    },
                    child: CustomCard(
                      iconPath: 'assets/icons/history.svg',
                      labelText: 'History',
                    ),
                  ),
    
                  SizedBox(height: 2.5.h),
    
                  // Logout Card
                  const LogoutCard(),
    
                  Container(
                    margin: EdgeInsets.only(left: 30.w, right: 2.w, top: 7.h),
                    child: Row(
                      children: [
                        Text('Rate us'),
                        Container(
                          width: 0.2.w,
                          height: 2.0.h,
                          color: primaryColor,
                          margin: EdgeInsets.symmetric(horizontal: 2.0.w),
                        ),
                        Text('Version: 1.0'),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Center(child: Text('No profile data available.'));
          }
        }),
      ),
    );
  }
}
