import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'discover.dart';
import 'following.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int notificationCount = 3;
  int _selectedIndex = 0;
  int _selectedTabIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _selectedIndex == 0 ? _buildHomeScreen() : _buildOtherScreen(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildHomeScreen() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.center,
          colors: [
            Color(0xFF54E1D9),
            Color(0xFFE0F7FA),
            Colors.white,
          ],
          stops: [0.0, 0.3, 1.0],
        ),
      ),
      child: Column(
        children: [
          //Appbar
          AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.notifications, size: 25, color: Colors.black),
                      SizedBox(width: 5),
                      Text(
                        '$notificationCount',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 20),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Icon(Icons.messenger_outline_outlined,
                      size: 25, color: Colors.black),
                ),
              ],
            ),
            actions: [
              CircleAvatar(
                backgroundImage: AssetImage("assets/profile.jpg"),
                radius: 18,
              ),
              SizedBox(width: 15),
            ],
          ),

          // Discover & Following Tabs
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedTabIndex = 0;
                      _tabController.animateTo(0);
                    });
                  },
                  child: Text(
                    "Discover",
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color:
                          _selectedTabIndex == 0 ? Colors.black : Colors.grey,
                    ),
                  ),
                ),
                SizedBox(width: 20),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedTabIndex = 1;
                      _tabController.animateTo(1);
                    });
                  },
                  child: Text(
                    "Following",
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color:
                          _selectedTabIndex == 1 ? Colors.black : Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 10),

          // Tab Content
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                DiscoverTab(),
                FollowingTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOtherScreen() {
    List<String> titles = ["Search", "Videos", "Friends"];
    return Center(
      child: Text(
        titles[_selectedIndex - 1],
        style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(70),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 10,
            spreadRadius: 6,
            offset: Offset(0, -4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildNavItem(Icons.home, 0),
          _buildNavItem(Icons.search, 1),
          _buildNavItem(Icons.video_camera_front, 2),
          _buildNavItem(Icons.person_add, 3),
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF54E1D9),
              ),
              child: Icon(Icons.add, size: 30, color: Color(0xFF02355C)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, int index) {
    bool isActive = _selectedIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Icon(
              icon,
              color: isActive ? Color(0xFF010C0C) : Colors.grey,
              size: 28,
            ),
          ),
          if (isActive)
            Container(
              width: 6,
              height: 6,
              margin: EdgeInsets.only(top: 4),
              decoration: BoxDecoration(
                color: Color(0xFF54E1D9),
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
    );
  }
}
