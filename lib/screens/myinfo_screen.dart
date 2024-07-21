import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:daliy_routine/screens/myinfo_update_screen.dart';

class MyInfoScreen extends StatefulWidget {
  const MyInfoScreen({super.key});

  @override
  State<MyInfoScreen> createState() => _MyInfoScreenState();
}

class _MyInfoScreenState extends State<MyInfoScreen> {
  bool _isPushNotificationsEnabled = false;
  bool _isProfilePublic = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('내 정보'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.transparent,
                          child: SvgPicture.asset(
                            'assets/images/default_profile.svg',
                            width: 100,
                            height: 100,
                          ),
                        ),
                        const SizedBox(width: 20),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('닉네임', style: TextStyle(fontSize: 20)),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Text('팔로워'),
                                    Text('0'),
                                  ],
                                ),
                                SizedBox(width: 10),
                                Column(
                                  children: [
                                    Text('팔로잉'),
                                    Text('0'),
                                  ],
                                ),
                                SizedBox(width: 10),
                                Column(
                                  children: [
                                    Text('루틴'),
                                    Text('0'),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(width: 20),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MyInfoUpdateScreen(),
                              ),
                            );
                          },
                          child: const Text('>'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    SwitchListTile(
                      title: const Text('푸시 알람'),
                      value: _isPushNotificationsEnabled,
                      onChanged: (bool value) {
                        setState(() {
                          _isPushNotificationsEnabled = value;
                        });
                      },
                    ),
                    SwitchListTile(
                      title: const Text('프로필 공개'),
                      value: _isProfilePublic,
                      onChanged: (bool value) {
                        setState(() {
                          _isProfilePublic = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 20.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, "/login");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                ),
                child: const Text(
                  '로그아웃',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
