import 'package:Dozer/core/utils/colors.dart';
import 'package:Dozer/presentation/equipment_list/all_equipments_screen.dart';
import 'package:Dozer/presentation/equipment_list/screen_widgets/categories_widget.dart';
import 'package:Dozer/presentation/equipment_list/screen_widgets/custom_appbar.dart';
import 'package:Dozer/presentation/equipment_list/screen_widgets/recommended_house.dart';
import 'package:Dozer/presentation/equipment_list/screen_widgets/search_input.dart';
import 'package:Dozer/presentation/equipment_list/screen_widgets/welcome_text.dart';
// Import the new equipment list page
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: CustomAppBar(),
        body: IndexedStack(
          index: _currentIndex,
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  WelcomeText(),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0, right: 30),
                    child: SearchInput(),
                  ),
                  CategoriesWidget(),
                  RecommendedHouse(),
              
                ],
              ),
            ),
            // Add content for other tab indices if needed
            EquipmentListPage(),
          
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          selectedItemColor: primaryColor,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
              // Handle navigation to different tabs
              // You can use a switch statement or other logic here
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.gavel),
              label: 'All Equipment',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'Bookings',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.apps),
              label: 'Bid',
            ),
          ],
        ),
      ),
    );
  }
}
