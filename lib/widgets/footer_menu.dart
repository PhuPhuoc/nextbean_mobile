import 'package:flutter/material.dart';

class FooterMenu extends StatelessWidget {
  final int currentIndex;
  final Function(int) onItemTapped;

  const FooterMenu({required this.currentIndex, required this.onItemTapped});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today),
          label: 'Calendar',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.folder),
          label: 'Project',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.info),
          label: 'Information',
        ),
      ],
      currentIndex: currentIndex,
      unselectedItemColor: Colors.grey[400],
      selectedItemColor: const Color(0xFF0f5e80),
      unselectedLabelStyle: TextStyle(color: Colors.grey[400]),
      selectedLabelStyle: const TextStyle(color: Color(0xFF0f5e80)),
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      onTap: onItemTapped,
    );
  }
}
