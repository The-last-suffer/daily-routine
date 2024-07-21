import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  // double percent = records?.last.distance ?? 3 / 10;
  double percent = 1;

  String getProgressText(double percent) {
    if (percent <= 0.33) {
      return '시작이 반';
    } else if (percent < 1) {
      return '조금만 더';
    } else {
      return '달성 완료';
    }
  }
  // 체크박스 상태 변경
  List<bool> _isChecked = [false, true, false, false];
  void _handleCheckboxChange(int index, bool? value) {
    setState(() {
      _isChecked[index] = value ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        // alignment: Alignment.topLeft,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          // Column의 자식들을 왼쪽으로 정렬
          children: [
            const Stack(
              children: [
                SizedBox(
                  height: 50,
                  width: double.infinity,
                ),
                Positioned(
                  right: 10,
                  top: 10,
                  child: Icon(
                    Icons.notifications,
                    color: Colors.black,
                    size: 30,
                  ),
                ),
              ],
            ),
            TableCalendar(
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: _focusedDay,
              calendarFormat: _calendarFormat,
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay; // update `_focusedDay` here as well
                });
              },
              onFormatChanged: (format) {
                if (_calendarFormat != format) {
                  setState(() {
                    _calendarFormat = format;
                  });
                }
              },
              onPageChanged: (focusedDay) {
                _focusedDay = focusedDay;
              },
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15), // 왼쪽에 여백 추가
              child: Align(
                alignment: Alignment.centerLeft, // 텍스트를 왼쪽 정렬
                child: Text(
                  '오늘의 진행율',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            // 진행율을 나타내는 프로그레스 바
            Container(
              alignment: FractionalOffset(percent, 1 - percent),
              child: FractionallySizedBox(
                child: Image.asset('assets/images/shoes_icon.png',
                    width: 30, height: 30, fit: BoxFit.cover),
              ),
            ),
            Stack(
              alignment: Alignment.center, // 문구를 프로그래스 바 중앙에 배치
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15), // 프로그래스 바의 테두리를 둥글게 설정
                  child: LinearProgressIndicator(
                    value: percent,
                    backgroundColor: Colors.grey,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                    minHeight: 25, // 프로그래스 바 높이
                  ),
                ),
                Positioned(
                  // left: percent * MediaQuery.of(context).size.width - 50, // 문구를 현재 진행 상황에 맞게 위치 조정
                  child: Text(
                    getProgressText(percent),
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: Image.asset(
                      'assets/images/shoes_icon.png',
                      width: 50,
                      height: 50,
                    ),
                    title: Text('일정 1'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('설정한 시간: 2021-10-01 09:00'),
                        Text('완료 시간: 2021-10-01 18:00'),
                      ],
                    ),
                    trailing: Checkbox(
                      value: _isChecked[0],
                      onChanged: (bool? value) {
                        _handleCheckboxChange(0, value);
                      },
                    ),
                  ),
                  ListTile(
                    leading: Image.asset(
                      'assets/images/shoes_icon.png',
                      width: 50,
                      height: 50,
                    ),
                    title: Text('일정 2'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('설정한 시간: 2021-10-02 09:00'),
                        Text('완료 시간: 2021-10-02 18:00'),
                      ],
                    ),
                    trailing: Checkbox(
                      value: _isChecked[1],
                      onChanged: (bool? value) {
                        _handleCheckboxChange(1, value);
                      },
                    ),
                  ),
                  ListTile(
                    leading: Image.asset(
                      'assets/images/shoes_icon.png',
                      width: 50,
                      height: 50,
                    ),
                    title: Text('일정 3'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('설정한 시간: 2021-10-02 09:00'),
                        Text('완료 시간: 2021-10-02 18:00'),
                      ],
                    ),
                    trailing: Checkbox(
                      value: _isChecked[2],
                      onChanged: (bool? value) {
                        _handleCheckboxChange(2, value);
                      },
                    ),
                  ),
                  ListTile(
                    leading: Image.asset(
                      'assets/images/shoes_icon.png',
                      width: 50,
                      height: 50,
                    ),
                    title: Text('일정 4'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('설정한 시간: 2021-10-02 09:00'),
                        Text('완료 시간: 2021-10-02 18:00'),
                      ],
                    ),
                    trailing: Checkbox(
                      value: _isChecked[3],
                      onChanged: (bool? value) {
                        _handleCheckboxChange(3, value);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 루틴 등록 페이지 이동
        },
        child: Icon(Icons.add),
        tooltip: '페이지 추가',
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

void main() => runApp(const MaterialApp(
  home: CalendarScreen(),
));