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

  // ▼ アイコンの表示
  bool isIconMenuEast = true;
  void switchIconMenuDisplay() {
    setState(() {
      isIconMenuEast = !isIconMenuEast;
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

  // ▼ カラーの切り替え

  static List<Color> timaerTextColor = [
    const Color(0xFF3873BA),
    const Color(0xFF797979),
    const Color(0xFF395345),
    const Color(0xFFFFF0DF)
  ];
  static List<Color> timerBackgroundColor = [
    const Color(0xFFE8F1FC),
    const Color(0xFF2D2D2D),
    const Color(0xFF629F80),
    const Color(0xFFD26900)
  ];

  static int timerColorNumber = 0;
  var _timerTextColor = timaerTextColor[timerColorNumber];
  var _timerBackgroundColor = timerBackgroundColor[timerColorNumber];

  void _changeTimerColor(value) {
    setState(() {
      _timerTextColor = timaerTextColor[value];
      _timerBackgroundColor = timerBackgroundColor[value];
    });
  }

  // ▼ フォントの変更

  static List fontNameList = ['Roboto Mono', 'Signika', 'Caveat'];
  static int selectFontName = 0;
  var _timerFont = fontNameList[selectFontName];

  void _changetimerFont(value) {
    setState(() {
      _timerFont = fontNameList[value];
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toggleMenu, // 画面をタップしたらメニューを切り替える
      child: Scaffold(
        backgroundColor: _timerBackgroundColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                nowTime,
                style: GoogleFonts.getFont(_timerFont).copyWith(
                    fontSize: 120,
                    fontWeight: FontWeight.bold,
                    color: _timerTextColor),
              )
            ],
          ),
        ),
        floatingActionButton: AnimatedOpacity(
          opacity: isMenuVisible ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 200),
          child: Column(
            children: [
              // 左右の表示切り替え
              IconButton(
                  onPressed: switchIconMenuDisplay,
                  icon: isIconMenuEast
                      ? Icon(
                          Icons.east,
                          color: _timerTextColor,
                        )
                      : Icon(Icons.west, color: _timerTextColor)),
              // 時間の表示切り替え
              PopupMenuButton(
                offset: const Offset(50, 50),
                icon: Icon(Icons.schedule, color: _timerTextColor),
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
              // カラーの切り替え
              PopupMenuButton(
                // color: Colors.white,
                offset: const Offset(50, 50),
                icon: Icon(Icons.palette, color: _timerTextColor),
                itemBuilder: (context) => [
                  PopupMenuItem(
                      value: 0,
                      child: Container(
                          width: double.infinity,
                          color: timerBackgroundColor[0],
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              "12:34",
                              style: TextStyle(
                                  color: timaerTextColor[0],
                                  fontWeight: FontWeight.bold),
                            ),
                          ))),
                  PopupMenuItem(
                      value: 1,
                      child: Container(
                          width: double.infinity,
                          color: timerBackgroundColor[1],
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              "12:34",
                              style: TextStyle(
                                  color: timaerTextColor[1],
                                  fontWeight: FontWeight.bold),
                            ),
                          ))),
                  PopupMenuItem(
                      value: 2,
                      child: Container(
                          width: double.infinity,
                          color: timerBackgroundColor[2],
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              "12:34",
                              style: TextStyle(
                                  color: timaerTextColor[2],
                                  fontWeight: FontWeight.bold),
                            ),
                          ))),
                  PopupMenuItem(
                      value: 3,
                      child: Container(
                          width: double.infinity,
                          color: timerBackgroundColor[3],
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              "12:34",
                              style: TextStyle(
                                  color: timaerTextColor[3],
                                  fontWeight: FontWeight.bold),
                            ),
                          ))),
                ],
                onSelected: (value) {
                  // メニューアイテムが選択された場合の処理
                  _changeTimerColor(value);
                },
              ),
              // フォントの切り替え
              PopupMenuButton(
                offset: const Offset(50, 50),
                icon: Icon(Icons.onetwothree, color: _timerTextColor),
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: 0,
                    child: Text(
                      "Roboto Mono",
                      style: GoogleFonts.getFont(fontNameList[0]).copyWith(),
                    ),
                  ),
                  PopupMenuItem(
                    value: 1,
                    child: Text(
                      "Signika",
                      style: GoogleFonts.getFont(fontNameList[1]).copyWith(),
                    ),
                  ),
                  PopupMenuItem(
                    value: 2,
                    child: Text(
                      "Caveat",
                      style: GoogleFonts.getFont(fontNameList[2]).copyWith(),
                    ),
                  ),
                ],
                onSelected: (value) {
                  // メニューアイテムが選択された場合の処理
                  _changetimerFont(value);
                },
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: isIconMenuEast
            ? FloatingActionButtonLocation.startTop
            : FloatingActionButtonLocation.endTop,
      ),

      //  Container(
      //   decoration: const BoxDecoration(
      //       gradient: RadialGradient(
      //           center: Alignment.center,
      //           radius: 1.8,
      //           colors: [
      //         Color.fromARGB(255, 250, 205, 182),
      //         Color.fromARGB(255, 150, 117, 50)
      //       ])),
      //   child:
      // ),
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
