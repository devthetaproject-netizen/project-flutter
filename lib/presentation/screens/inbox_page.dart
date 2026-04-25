import 'package:flutter/material.dart';

class InboxPages extends StatelessWidget {
  const InboxPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("InboxPages"),
      ),
      body: const Center(child: Text("Ini Halaman InboxPages")),
    );
  }
}
