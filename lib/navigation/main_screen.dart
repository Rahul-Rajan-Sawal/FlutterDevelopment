import 'package:flutter/material.dart';
import 'package:flutter_bottom_nav/Activities/login_activity.dart';
import 'package:flutter_bottom_nav/common/common_popup.dart';
import 'package:flutter_bottom_nav/fragments/calendar_screen.dart';
import 'package:flutter_bottom_nav/fragments/create_lead_screen.dart';
import 'package:flutter_bottom_nav/fragments/dashboard_screen.dart';
import 'package:flutter_bottom_nav/fragments/search_lead_screen.dart';
import 'package:flutter_bottom_nav/fragments/setting_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 2;
  final List<Widget> _pages = const [
    SearchFragment(),
    CalendarScreen(),
    DashboardScreen(),
    CreateLeadScreen(),
    SettingScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    //double screenWidth = MediaQuery.of(context).size.width;

    return WillPopScope(
      onWillPop: () async {
        popUp();
        return false;
      },
      child: Scaffold(
        extendBody: true,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: const Icon(Icons.menu, size: 25),
          centerTitle: true,
          title: Column(
            children: [
              Image.asset(
                'assets/indusind_logo.png',
                height: screenHeight * 0.07,
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: IndexedStack(index: _selectedIndex, children: _pages),
            ),
          ],
        ),

        bottomNavigationBar: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              bottom: 45, // controls overlap height
              left: 0,
              right: 0,
              child: Image.asset(
                'assets/page_footer.png',
                height: 40,
                fit: BoxFit.fill,
              ),
            ),

            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                currentIndex: _selectedIndex,
                backgroundColor: Color(0xFF17479e),
                selectedItemColor: Colors.white,
                unselectedItemColor: Colors.white70,
                onTap: _onItemTapped,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.search),
                    label: 'Search Lead',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.calendar_month),
                    label: 'Calendar',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.dashboard),
                    label: 'Dashboard',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.add),
                    label: 'Create Lead',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                    label: 'Setting',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void popUp() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return CommonPopup(
          title: "Logout",
          message: "Are you sure you want to logout?",
          onNo: () {
            Navigator.of(dialogContext).pop(); // close dialog
          },
          onYes: () {
            Navigator.of(dialogContext).pop(); // close dialog
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => LoginActivity()),
            );
          },
        );
      },
    );
  }
}
