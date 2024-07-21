import 'package:flutter/material.dart';

class Navigation extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const Navigation({
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today),
          label: '캘린더',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.loop),
          label: '루틴 관리',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: '내 정보',
        ),
      ],
      currentIndex: currentIndex,
      selectedItemColor: Colors.blue,
      onTap: onTap,
    );
  }
}
