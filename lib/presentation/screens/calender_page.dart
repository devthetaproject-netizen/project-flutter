import 'package:flutter/material.dart';

class CalendarPages extends StatelessWidget {
  const CalendarPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("CalendarPages"),
      ),
      body: const Center(child: Text("Ini Halaman CalendarPages")),
    );
  }
}
