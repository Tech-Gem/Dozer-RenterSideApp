import 'package:Dozer/presentation/profile_screen/models/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfileCard extends StatelessWidget {
  final Profile profile;

  const ProfileCard({Key? key, required this.profile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 0.5,
      child: SizedBox(
        width: 100.0.w,
        height: 15.0.h,
        child: Padding(
          padding: EdgeInsets.all(1.0.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 20.0.w,
                height: 50.0.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(profile.image ?? ''),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 4.0.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      profile.fullName ?? '',
                      style: TextStyle(
                        fontSize: 16.0.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Job Title :${profile.jobTitle}',
                      style: TextStyle(fontSize: 14.0.sp, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  // Handle edit icon tap
                  // You can use profile.id, profile.fullName, etc. as needed
                  print('Edit tapped for ${profile.fullName}');
                },
                child: SvgPicture.asset(
                  'assets/icons/edit_icon.svg',
                  width: 3.5.w,
                  height: 3.0.h,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
