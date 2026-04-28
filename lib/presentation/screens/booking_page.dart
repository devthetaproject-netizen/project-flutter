import 'package:flutter/material.dart';

class BookingPage extends StatelessWidget {
  const BookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("BookingPages"),
      ),
      body: const Center(child: Text("Ini Halaman BookingPages")),
    );
  }
}
