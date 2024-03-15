
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    required this.iconPath,
    required this.labelText,
    super.key,
  });

  final String iconPath;
  final String labelText;

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
      child: Padding(
        padding: EdgeInsets.all(3.0.w), // Responsive padding
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // First Row

            // Inner Row
            Row(
              children: [
                // Icon from SVG
                SvgPicture.asset(
                  iconPath,
                  width: 3.w,
                  height: 3.h,
                  // ignore: deprecated_member_use
                  color: Colors.black, // Set your desired color
                ),
                SizedBox(width: 4.0.w), // Responsive spacing

                // Text
                Text(
                  labelText,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            // Icon from SVG

            SvgPicture.asset(
              'assets/icons/right_arrow.svg',
              // Replace with your SVG asset path
              width: 3.w,
              height: 3.h,
            ),
          ],
        ),
      ),
    );
  }
}
