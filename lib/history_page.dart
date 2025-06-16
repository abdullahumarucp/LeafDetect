import 'package:flutter/material.dart';
import 'bottom_bar.dart';
import 'main.dart';
import 'search_page.dart';
import 'custom_appbar.dart';
import 'gradient_background.dart';
import 'custom_end_drawer.dart';

class HistoryPage extends StatefulWidget {
  final int currentIndex;

  const HistoryPage({super.key, required this.currentIndex});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.currentIndex;
  }

  void onTabTapped(int index) {
    if (index != currentIndex) {
      setState(() {
        currentIndex = index;
      });

      // Navigate to the correct page based on index
      if (index == 0) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const Firstpage(cameras: [],),
          ),
        );
      } else if (index == 1) {
        // Placeholder for Search Page (Create a new page if needed)
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>
                SearchPage(currentIndex: index), // Create SearchPage
          ),
        );
      } else if (index == 2) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HistoryPage(currentIndex: index),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: const Color.fromARGB(255, 153, 232, 156),
      appBar: CustomAppBar(),
      endDrawer: CustomEndDrawer(),
      body: GradientBackground(
        child: Center(child: Text("This is the history page.")),
      ),
      //body: Center(child: Text("This is the history page.")),
      bottomNavigationBar: Bottompart(
        currentIndex: currentIndex,
        onTap: onTabTapped,
      ),
    );
  }
}