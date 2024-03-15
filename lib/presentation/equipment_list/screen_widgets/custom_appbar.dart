import 'package:Dozer/presentation/announcement_screen/announcement_screen.dart';
import 'package:Dozer/presentation/profile_screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              // Open the drawer
              Scaffold.of(context).openDrawer();
            },
            icon: SvgPicture.asset(
              'assets/icons/menu.svg',
            ),
          ),
          SizedBox(width: 140),
          Stack(
            children: [
              IconButton(
                onPressed: () {
                  // Handle notification icon press
                  // Navigate to the announcement page
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        // Replace 'AnnouncementScreen' with your actual announcement screen widget
                        return AnnouncementScreen();
                      },
                    ),
                  );
                },
                icon: SvgPicture.asset(
                  'assets/icons/notification.svg',
                ),
              ),
              Positioned(
                right: 0,
                top: 0,
                child: Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                  child: Text(
                    '1', // Replace with your notification count
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              // Navigate to the profile screen
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    // Replace 'ProfileScreen' with your actual profile screen widget
                    return ProfileScreen();
                  },
                ),
              );
            },
            child: CircleAvatar(
              foregroundColor: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50);
}
