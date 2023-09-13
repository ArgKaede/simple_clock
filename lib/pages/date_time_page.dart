import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';

class DateTimePage extends StatefulWidget {
  const DateTimePage({super.key});

  @override
  State<DateTimePage> createState() => _DateTimePageState();
}

class _DateTimePageState extends State<DateTimePage> {
  // メニューの表示切り替え
  bool isMenuVisible = false;
  void toggleMenu() {
    setState(() {
      isMenuVisible = !isMenuVisible;
      print("Tapped the screen!");
    });
  }

  // タイマー表示
  String nowTime = DateFormat('kk:mm:ss').format(DateTime.now());
  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 1), _onTimer);
  }

  void _onTimer(Timer timer) {
    var newTime = DateFormat('kk:mm:ss').format(DateTime.now());
    setState(() {
      nowTime = newTime;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
            onTap: toggleMenu, // 画面をタップしたらメニューを切り替える
            child: Stack(children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(nowTime,
                        style: GoogleFonts.robotoMono(
                            textStyle: TextStyle(
                                fontSize: 120, fontWeight: FontWeight.bold)))
                  ],
                ),
              ),
              AnimatedOpacity(
                opacity: isMenuVisible ? 1.0 : 0.0,
                duration: Duration(milliseconds: 500),
                child: Container(
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        icon: Icon(Icons.settings),
                        onPressed: () {
                          // メニューアイテムが選択された場合の処理
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.alarm),
                        onPressed: () {
                          // メニューアイテムが選択された場合の処理
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ])));
  }
}
