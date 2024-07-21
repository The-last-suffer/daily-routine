import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyInfoUpdateScreen extends StatefulWidget {
  const MyInfoUpdateScreen({super.key});

  @override
  State<MyInfoUpdateScreen> createState() => _MyInfoUpdateScreenState();
}

class _MyInfoUpdateScreenState extends State<MyInfoUpdateScreen> {
  String _nickname = '닉네임';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('프로필 수정', style: TextStyle(fontSize: 30)),
                      SizedBox(height: 30),
                      CircleAvatar(
                        radius: 100,
                        backgroundColor: Colors.transparent,
                        child: SvgPicture.asset(
                          'assets/images/default_profile.svg',
                          placeholderBuilder: (BuildContext context) => Container(
                            padding: const EdgeInsets.all(30.0),
                            child: const CircularProgressIndicator(),
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      TextField( // 닉네임 입력 필드 수정
                        decoration: InputDecoration(
                          labelText: '닉네임',
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) {
                          setState(() {
                            _nickname = value;
                          });
                        },
                      ),
                      SizedBox(height: 30),
                      SizedBox(
                        width: double.infinity, // 여기에 추가
                        child: ElevatedButton(
                          onPressed: () {
                            // 닉네임 변경 로직 구현
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                            ),
                          ),
                          child: Text('저장하기', style: TextStyle(color: Colors.white)),
                        ),
                      ),// 버튼과 입력 필드 사이의 간격 추가
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity, // Container의 너비를 화면 너비에 맞춥니다.
              child: ElevatedButton( // 탈퇴하기 버튼
                onPressed: () {
                  // 탈퇴 로직 구현
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('탈퇴 확인'),
                        content: Text('정말로 탈퇴하시겠습니까?'),
                        actions: <Widget>[
                          TextButton(
                            child: Text('취소'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          TextButton(
                            child: Text('탈퇴하기'),
                            onPressed: () {
                              // 여기에 실제 탈퇴 처리 로직 추가
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red, // 버튼 색상
                ),
                child: Text('탈퇴하기', style: TextStyle(color: Colors.white)),
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
