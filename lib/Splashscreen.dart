import 'package:flutter/material.dart';
import 'main.dart'; // Importing the main.dart file to access Firstpage

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to the main screen after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        // Check if the widget is still mounted
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const Firstpage()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(
          255, 13, 243, 86), // Changed to a flame-themed color

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/splash.png'),

            //const SizedBox(height: 10),
            // const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
