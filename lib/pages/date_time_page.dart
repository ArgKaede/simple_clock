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
  // ▼ メニューの表示切り替え
  bool isMenuVisible = false;
  void toggleMenu() {
    setState(() {
      isMenuVisible = !isMenuVisible;
      // print("Tapped the screen!");
    });
  }

  // ▼ タイマー表示
  static List<String> timeDisplay = ["kk:mm", "kk:mm:ss", "ss"];

  static int timeDisplayNumber = 0;

  String nowTime =
      DateFormat(timeDisplay[timeDisplayNumber]).format(DateTime.now());

  void _onTimer(Timer timer) {
    var newTime =
        DateFormat(timeDisplay[timeDisplayNumber]).format(DateTime.now());
    setState(() {
      nowTime = newTime;
    });
  }

  // タイマー表示切り替え
  void _changeTimeDisplay(value) {
    setState(() {
      timeDisplayNumber = value;
    });
  }

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 1), _onTimer);
  }

  // ▼ アイコンの表示

  bool isIconMenuEast = true;
  void switchIconMenuDisplay() {
    setState(() {
      isIconMenuEast = !isIconMenuEast;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toggleMenu, // 画面をタップしたらメニューを切り替える
      child: Container(
        decoration: const BoxDecoration(
            gradient: RadialGradient(
                center: Alignment.center,
                radius: 1.8,
                colors: [
              Color.fromARGB(255, 250, 205, 182),
              Color.fromARGB(255, 150, 117, 50)
            ])),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(nowTime,
                    style: GoogleFonts.robotoMono(
                        textStyle: const TextStyle(
                            fontSize: 120, fontWeight: FontWeight.bold)))
              ],
            ),
          ),
          floatingActionButton: AnimatedOpacity(
            opacity: isMenuVisible ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 200),
            child: Column(
              children: [
                IconButton(
                    onPressed: switchIconMenuDisplay,
                    icon: isIconMenuEast
                        ? const Icon(Icons.east)
                        : const Icon(Icons.west)),
                PopupMenuButton(
                  icon: const Icon(Icons.schedule),
                  itemBuilder: (context) => [
                    const PopupMenuItem(
                      value: 0,
                      child: Text("kk:mm"),
                    ),
                    const PopupMenuItem(
                      value: 1,
                      child: Text("kk:mm:ss"),
                    ),
                    const PopupMenuItem(
                      value: 2,
                      child: Text("ss"),
                    ),
                  ],
                  onSelected: (value) {
                    // メニューアイテムが選択された場合の処理
                    _changeTimeDisplay(value);
                  },
                ),
                PopupMenuButton(
                  icon: const Icon(Icons.palette),
                  itemBuilder: (context) => [
                    const PopupMenuItem(
                      value: 1,
                      child: Text("kk:mm"),
                    ),
                    const PopupMenuItem(
                      value: 2,
                      child: Text("kk:mm:ss"),
                    ),
                    const PopupMenuItem(
                      value: 3,
                      child: Text("ss"),
                    ),
                  ],
                  onSelected: (value) {
                    // メニューアイテムが選択された場合の処理
                  },
                ),
              ],
            ),
          ),
          floatingActionButtonLocation: isIconMenuEast
              ? FloatingActionButtonLocation.startTop
              : FloatingActionButtonLocation.endTop,
        ),
      ),
    );
  }
}


          // ボタンタップでメニュー表示
          //  GestureDetector(
          //     onTap: toggleMenu, // 画面をタップしたらメニューを切り替える
          //     child: Stack(children: [
          //       Center(
          //         child: Column(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           children: [
          //             Text(nowTime,
          //                 style: GoogleFonts.robotoMono(
          //                     textStyle: TextStyle(
          //                         fontSize: 120, fontWeight: FontWeight.bold)))
          //           ],
          //         ),
          //       ),
          //       AnimatedOpacity(
          //         opacity: isMenuVisible ? 1.0 : 0.0,
          //         duration: Duration(milliseconds: 200),
          //         child: Container(
          //           color: Colors.white,
          //           child: Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceAround,
          //             children: [
          //               IconButton(
          //                 icon: Icon(Icons.settings),
          //                 onPressed: () {
          //                   // メニューアイテムが選択された場合の処理
          //                 },
          //               ),
          //               IconButton(
          //                 icon: Icon(Icons.alarm),
          //                 onPressed: () {
          //                   // メニューアイテムが選択された場合の処理
          //                 },
          //               ),
          //             ],
          //           ),
          //         ),
          //       ),
          //     ])),