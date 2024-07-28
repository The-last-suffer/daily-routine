import 'package:daliy_routine/screens/loginView.dart';
import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'screens/calendar_screen.dart';
import 'screens/routine_screen.dart';
import 'screens/myinfo_screen.dart';
import 'shared/navigation.dart';
import 'splash_screen.dart';

void main() {
  const kakaoNativeAppKey = "0dae63a7c9c38fec8b7025076280aabe";

  // runApp() 호출 전 Flutter SDK 초기화
  KakaoSdk.init(nativeAppKey: kakaoNativeAppKey);

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
        '/home': (context) => LoginView(),
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
