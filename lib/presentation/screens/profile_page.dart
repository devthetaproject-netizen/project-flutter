import 'package:flutter/material.dart';

class ProfilePages extends StatelessWidget {
  const ProfilePages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Profile"),
      ),
      body: const Center(child: Text("Ini Halaman Profile")),
    );
  }
}
