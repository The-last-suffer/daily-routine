import 'package:flutter/material.dart';
import 'screens/calendar_screen.dart';
import 'screens/routine_screen.dart';
import 'screens/myinfo_screen.dart';
import 'shared/navigation.dart';
import 'splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daily Routine',
      initialRoute: '/splash',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/splash': (context) => SplashScreen(),
        '/home': (context) => MainHome(),
      },
    );
  }
}

class MainHome extends StatefulWidget {
  @override
  _MainHomeState createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    CalendarScreen(),
    RoutineScreen(),
    MyInfoScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Navigation(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
