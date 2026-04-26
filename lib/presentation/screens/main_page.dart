import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../state_mgmt/main_provider.dart';
import '../screens/home_page.dart';
import '../screens/booking_page.dart';
import '../screens/calender_page.dart';
import '../screens/inbox_page.dart';
import '../screens/profile_page.dart';

class MainPage extends ConsumerWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(selectedIndexProvider);

    final pages = [
      HomePage(
        onProfileTap: () {
          ref.read(selectedIndexProvider.notifier).state = 4;
        },
      ),
      const BookingPages(),
      const CalendarPages(),
      const InboxPages(),
      const ProfilePages(),
    ];

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          if (selectedIndex != 0) {
            ref.read(selectedIndexProvider.notifier).state = 0;
          }
        }
      },
      child: Scaffold(
        body: pages[selectedIndex],
        bottomNavigationBar: _buildBottomNavBar(selectedIndex, ref),
      ),
    );
  }

  BottomNavigationBar _buildBottomNavBar(int selectedIndex, WidgetRef ref) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: (index) {
        ref.read(selectedIndexProvider.notifier).state = index;
      },
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
