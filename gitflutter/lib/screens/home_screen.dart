import 'dart:async';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Timer timer;
  DateTime dt = DateTime.now();

  @override
  void initState() {
    super.initState();
    // Update time every second
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      setState(() {
        dt = DateTime.now();
      });
    });
  }

  @override
  void dispose() {
    timer.cancel(); // Prevent memory leaks
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Flutter Timer")),
      body: Center(
        child: Text(
          "${dt.hour.toString().padLeft(2, '0')}:"
          "${dt.minute.toString().padLeft(2, '0')}:"
          "${dt.second.toString().padLeft(2, '0')}",
          style: const TextStyle(fontSize: 40),
        ),
      ),
    );
  }
}
