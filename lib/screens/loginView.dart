import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'profileRegisterView.dart';

class LoginView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 96),
            child: AspectRatio(
                aspectRatio: 1, child: Image.asset('assets/images/logo.png')),
          ),
          const SizedBox(height: 96),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: CupertinoButton(
                  onPressed: () async {
                    // 카카오톡 실행 가능 여부 확인
                    // 카카오톡 실행이 가능하면 카카오톡으로 로그인, 아니면 카카오계정으로 로그인
                    if (await isKakaoTalkInstalled()) {
                      try {
                        OAuthToken token =
                            await UserApi.instance.loginWithKakaoAccount();
                        print('카카오톡으로 로그인 성공: ${token}');

                        try {
                          User user = await UserApi.instance.me();
                          print('사용자 정보 요청 성공'
                              '\n회원번호: ${user.id}'
                              '\n닉네임: ${user.kakaoAccount?.profile?.nickname}'
                              '\n이메일: ${user.kakaoAccount?.email}');
                        } catch (error) {
                          print('사용자 정보 요청 실패 $error');
                        }

                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ProfileRegisterView(),
                          ),
                        );
                      } catch (error) {
                        print('카카오톡으로 로그인 실패 $error');

                        // 사용자가 카카오톡 설치 후 디바이스 권한 요청 화면에서 로그인을 취소한 경우,
                        // 의도적인 로그인 취소로 보고 카카오계정으로 로그인 시도 없이 로그인 취소로 처리 (예: 뒤로 가기)
                        if (error is PlatformException &&
                            error.code == 'CANCELED') {
                          return;
                        }
                        // 카카오톡에 연결된 카카오계정이 없는 경우, 카카오계정으로 로그인
                        try {
                          OAuthToken token =
                              await UserApi.instance.loginWithKakaoAccount();
                          print('카카오톡으로 로그인 성공: ${token}');

                          try {
                            User user = await UserApi.instance.me();
                            print('사용자 정보 요청 성공'
                                '\n회원번호: ${user.id}'
                                '\n닉네임: ${user.kakaoAccount?.profile?.nickname}'
                                '\n이메일: ${user.kakaoAccount?.email}');
                          } catch (error) {
                            print('사용자 정보 요청 실패 $error');
                          }

                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ProfileRegisterView(),
                            ),
                          );
                        } catch (error) {
                          print('카카오계정으로 로그인 실패 $error');
                        }
                      }
                    } else {
                      try {
                        OAuthToken token =
                            await UserApi.instance.loginWithKakaoAccount();
                        print('카카오톡으로 로그인 성공: ${token}');

                        try {
                          User user = await UserApi.instance.me();
                          print('사용자 정보 요청 성공'
                              '\n회원: ${user}'
                              '\n회원번호: ${user.id}'
                              '\n닉네임: ${user.kakaoAccount?.profile?.nickname}'
                              '\n이메일: ${user.kakaoAccount?.email}');
                        } catch (error) {
                          print('사용자 정보 요청 실패 $error');
                        }

                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ProfileRegisterView(),
                          ),
                        );
                      } catch (error) {
                        print('카카오계정으로 로그인 실패 $error');
                      }
                    }
                  },
                  child: Image.asset('assets/images/kakaoLoginButton.png')))
        ],
      )),
    );
  }
}
