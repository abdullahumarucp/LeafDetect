import 'package:flutter/material.dart';

class Bottompart extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const Bottompart(
      {super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: const Color.fromARGB(255, 46, 114, 48),
      items: [
        BottomNavigationBarItem(
          label: '',
          icon: Icon(
            Icons.home,
            color: const Color.fromARGB(255, 239, 244, 241),
            size: 28.0,
          ),
        ),
        BottomNavigationBarItem(
          label: '',
          icon: Icon(
            Icons.search,
            color: const Color.fromARGB(255, 239, 244, 241),
            size: 28.0,
          ),
        ),
        BottomNavigationBarItem(
          label: '',
          icon: Icon(
            Icons.history,
            color: const Color.fromARGB(255, 239, 244, 241),
            size: 28.0,
          ),
        ),
      ],
      currentIndex: currentIndex,
      onTap: onTap,
    );
  }
}