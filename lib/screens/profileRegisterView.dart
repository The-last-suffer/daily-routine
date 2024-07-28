import 'package:daliy_routine/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileRegisterView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProfileRegisterViewState();
  }
}

class _ProfileRegisterViewState extends State<ProfileRegisterView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey[300],
            ),
            SizedBox(height: 20),
            Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Container(
                  width: 250, // Adjust the width as needed
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: '사용할 닉네임을 입력해주세요.',
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => MainHome(),
                  ),
                );
              },
              child: Text('시작하기'),
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.grey[300],
                  minimumSize: Size(300, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
          ],
        ),
      ),
    );
  }
}
