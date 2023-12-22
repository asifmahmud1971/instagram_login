import 'package:flutter/material.dart';
import 'package:insta_login/insta_login.dart';
import 'package:insta_login/insta_view.dart';
import 'package:instagram_auth/instagram_model.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Home());
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String token = '', userid = '', username = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Plugin example app')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (token != '' || userid != '' || username != '')
                Text(
                  'Access Token: $token\n\nUser Id: $userid\n\nUsername: $username',
                )
              else
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return InstaView(
                              instaAppId: '1082949826044789',
                              instaAppSecret:
                              'c8a8e7e4a5de68d4f6739c788abba0c0',
                              redirectUrl: 'https://www.asifmahmud.me/',
                              onComplete: (_token, _userid, _username) {
                                WidgetsBinding.instance.addPostFrameCallback(
                                      (timeStamp) {
                                    setState(() {
                                      token = _token;
                                      userid = _userid;
                                      username = _username;
                                    });

                                  },
                                );
                                InstagramModel().getUserProfile(userId: _userid,accessToken: _token);
                              },
                            );
                          },
                        ),
                      );
                    },
                    child: const Text('Connect to Instagram'),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}