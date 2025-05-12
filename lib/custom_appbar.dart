import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          Image.asset(
            'assets/file.png',
            height: 55,
          ),
          SizedBox(width: 1),
          Text(
            'Leaf Detect ProCare',
            style: TextStyle(
              color: Color.fromARGB(255, 46, 114, 48),
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 153, 232, 156),
      actions: [
        SizedBox(
          width: 100,
          height: 100,
          child: IconButton(
            icon: Icon(Icons.menu, size: 40),
            onPressed: () {
              Scaffold.of(context).openEndDrawer();
            },
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56.0);
}