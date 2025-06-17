import 'package:LeafDetect/gradient_background.dart';
import 'package:LeafDetect/main.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class SplashScreen extends StatefulWidget {
  final List<CameraDescription> cameras;

  const SplashScreen({super.key, required this.cameras});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  double _opacity = 0;
  double _scale = 0.8;

  @override
  void initState() {
    super.initState();

    // Start animations slightly after build
    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        _opacity = 1;
        _scale = 1.0;
      });
    });

    // Navigate after 3 seconds
    _navigateToHome();
  }

  Future<void> _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 3));
    if (!mounted) return;
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (BuildContext context) => Firstpage(cameras: widget.cameras),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: Center(
          child: AnimatedOpacity(
            opacity: _opacity,
            duration: const Duration(seconds: 2),
            curve: Curves.easeInOut,
            child: AnimatedScale(
              scale: _scale,
              duration: const Duration(seconds: 2),
              curve: Curves.easeOutBack,
              child: Image.asset(
                'assets/splash.png',
                width: 300,
                height: 300,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
