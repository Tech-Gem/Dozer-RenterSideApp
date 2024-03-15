
import 'package:Dozer/utils%20-%20Copy/get_storage_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SwitchCard extends StatefulWidget {
  const SwitchCard({super.key});

  @override
  State<SwitchCard> createState() => _SwitchCardState();
}

class _SwitchCardState extends State<SwitchCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.0.w,
      height: 20.0.h,
      child: Card(
        color: Colors.white,
        elevation: 0.5,
        child: Padding(
          padding: EdgeInsets.all(1.0.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              
            ],
          ),
        ),
      ),
    );
  }
}
