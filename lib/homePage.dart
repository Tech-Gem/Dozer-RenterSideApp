import 'package:Dozer/presentation/equipment_list/all_equipments_screen.dart';
import 'package:Dozer/presentation/equipment_list/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PageContainer(),
    );
  }
}

class PageContainer extends StatefulWidget {
  @override
  _PageContainerState createState() => _PageContainerState();
}

class _PageContainerState extends State<PageContainer> {
  int currentPageIndex = 0;
  List<String> pageTitles = [
    "Search or create Bid",
    "Book Your Machine",
    "Build with Relief",
    "Bridging the Gap, Building Together!",
  ];

  List<String> pageDescriptions = [
    "Use our Heavy Machinery listing or create a bid and choose the best that fits your need",
    "",
    "",
    "",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  
      body: Padding(
        padding: const EdgeInsets.only(bottom: 50.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(height: 20.0),
              Container(
                width: 189.0,
                height: 224.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/logo2.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(height: 70.0),
              Container(
                width: 356.97,
                height: 52,
                child: Text(
                  pageTitles[currentPageIndex],
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 25.0),
              Container(
                width: 300.0,
                child: Text(
                  pageDescriptions[currentPageIndex],
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18.0),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(height: 30.0),
              if (currentPageIndex < pageDescriptions.length - 1)
                Container(
                  width: 216.67,
                  height: 51.32,
                  child: Ink(
                    decoration: ShapeDecoration(
                      color: Color.fromRGBO(232, 144, 13, 1.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          currentPageIndex++;
                        });
                      },
                      child: Center(
                        child: Text(
                          'Next',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              else
                Column(
                  children: [
                    SizedBox(height: 20.0),
                    
                    SizedBox(height: 10.0),
                    Container(
                      width: 216.67,
                      height: 51.32,
                      child: Ink(
                        decoration: ShapeDecoration(
                          color: Color.fromRGBO(232, 144, 13, 1.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: InkWell(
                          onTap: () {
                            print("Login button pressed");
                            Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => HomeScreen(),)
);
                          },
                          child: Center(
                            child: Text(
                              'Home Screen',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      width: 216.67,
                      height: 51.32,
                      child: Ink(
                        decoration: ShapeDecoration(
                          color: Color.fromRGBO(232, 144, 13, 1.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: InkWell(
                          onTap: () {
                            print("Login button pressed");
                            Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => EquipmentListPage(),)
);
                          },
                          child: Center(
                            child: Text(
                              'Signup Screen',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
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
