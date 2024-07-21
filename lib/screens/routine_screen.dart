import 'package:flutter/material.dart';

// 데이터 모델 클래스 정의
class Alarm {
  final String title;
  final String day;
  final String time;

  Alarm({required this.title, required this.day, required this.time});
}

class RoutineScreen extends StatefulWidget {
  const RoutineScreen({super.key});

  @override
  State<RoutineScreen> createState() => _RoutineScreenState();
}

class _RoutineScreenState extends State<RoutineScreen> {
  // 임의의 데이터를 포함하는 리스트 생성
  final List<Alarm> alarms = [
    Alarm(title: "8시 기상 후 이불정리", day: "월 화", time: "08:00"),
    Alarm(title: "3KM 런닝", day: "화요일", time: "08:00"),
    Alarm(title: "저녁 1시간 스터디", day: "수요일", time: "06:30"),
    // 원하는 만큼 알람 데이터 추가 가능
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('알람 목록'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: alarms.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2열로 표시
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 3 / 2, // 카드의 가로 세로 비율
        ),
        itemBuilder: (context, index) {
          return AlarmCard(alarm: alarms[index]);
        },
      ),
    );
  }
}

// 알람 카드 위젯 정의
class AlarmCard extends StatelessWidget {
  final Alarm alarm;

  const AlarmCard({Key? key, required this.alarm}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              alarm.title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text(alarm.day),
            Text(alarm.time),
          ],
        ),
      ),
    );
  }
}
