import 'package:flutter/material.dart';
import 'package:flutter_application_user/presentation/screens/home_page.dart';
import 'package:flutter_application_user/presentation/screens/booking_page.dart';
import 'package:flutter_application_user/presentation/screens/calender_page.dart';
import 'package:flutter_application_user/presentation/screens/inbox_page.dart';
import 'package:flutter_application_user/presentation/screens/profile_page.dart';

class MainPages extends StatefulWidget {
  const MainPages({super.key});

  @override
  State<MainPages> createState() => _MainPagesState();
}

class _MainPagesState extends State<MainPages> {
  int _selectedIndex = 0;
  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      HomePages(onProfileTap: _onProfileTap),
      BookingPages(),
      CalendarPages(),
      InboxPages(),
      ProfilePages(),
    ];
  }

  Future<bool> _onWillPop() async {
    if (_selectedIndex != 0) {
      setState(() {
        _selectedIndex = 0;
      });
      return false;
    }
    return true;
  }

  void _onProfileTap() {
    setState(() {
      _selectedIndex = 4;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) _onWillPop();
      },
      child: Scaffold(
        body: _pages[_selectedIndex],
        bottomNavigationBar: _buildBottomNavBar(),
      ),
    );
  }

  BottomNavigationBar _buildBottomNavBar() {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      selectedItemColor: const Color(0xFF007B7F),
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: "Booking"),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_month_outlined),
          label: "Calendar",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat_outlined),
          label: "Inbox",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: "Profile",
        ),
      ],
    );
  }
}
