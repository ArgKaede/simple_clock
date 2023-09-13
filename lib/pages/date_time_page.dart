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
  bool isMenuVisible = false;
  // メニューの表示切り替え
  void toggleMenu() {
    setState(() {
      isMenuVisible = !isMenuVisible;
      print("Tapped the screen!");
    });
  }

  // サイドバーのインデックス設定
  int _selectedIndex = 0;

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

  final _pages = <Widget>[
    Container(
      color: Colors.red,
      alignment: Alignment.center,
      child: const Text('Page 1'),
    ),
    Container(
      color: Colors.green,
      alignment: Alignment.center,
      child: const Text('Page 2'),
    ),
    Container(
      color: Colors.blue,
      alignment: Alignment.center,
      child: const Text('Page 3'),
    ),
    Container(
      color: Colors.yellow,
      alignment: Alignment.center,
      child: const Text('Page 4'),
    ),
    Container(
      color: Colors.orange,
      alignment: Alignment.center,
      child: const Text('Page 5'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // bottomNavigationBar: NavigationBar(
        //   onDestinationSelected: (int index) {
        //     setState(() {
        //       _selectedIndex = index;
        //     });
        //   },
        //   selectedIndex: _selectedIndex,
        //   animationDuration: const Duration(seconds: 10),
        //   elevation: 10,
        //   height: 100,
        //   labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        //   destinations: const <Widget>[
        //     NavigationDestination(
        //         icon: Icon(Icons.explore), label: 'ver A', tooltip: "tooltip1"),
        //     NavigationDestination(
        //         icon: Icon(Icons.commute), label: 'ver B', tooltip: "tooltip2"),
        //     NavigationDestination(
        //       icon: Icon(Icons.bookmark_border),
        //       label: 'ver C',
        //       tooltip: "tooltip3",
        //       selectedIcon: Icon(Icons.bookmark),
        //     ),
        //     NavigationDestination(
        //         icon: Icon(Icons.circle), label: 'ver D', tooltip: "tooltip4"),
        //     NavigationDestination(
        //         icon: Icon(Icons.train), label: 'ver E', tooltip: "tooltip5"),
        //   ],
        // ),
        body: GestureDetector(
            onTap: toggleMenu, // 画面をタップしたらメニューを切り替える
            child: Stack(children: [
              Center(
                child: Text(
                  'Clock',
                  style: TextStyle(fontSize: 40.0),
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
            ])
            //  Row(
            //   children: [
            //     MainContents(
            //       index: _selectedIndex,
            //       nowTime: nowTime,
            //     ),
            // NavigationRail(
            //   destinations: const [
            //     NavigationRailDestination(
            //       icon: Icon(Icons.home),
            //       label: Text('Home'),
            //     ),
            //     NavigationRailDestination(
            //       icon: Icon(Icons.bookmark),
            //       label: Text('Bookmark'),
            //     ),
            //     NavigationRailDestination(
            //       icon: Icon(Icons.people),
            //       label: Text('Friends'),
            //     ),
            //   ],
            //   selectedIndex: _selectedIndex,
            //   onDestinationSelected: (index) {
            //     setState(() {
            //       _selectedIndex = index;
            //     });
            //   },
            // ),
            // Center(
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Text(nowTime,
            //           style: GoogleFonts.robotoMono(
            //               textStyle: const TextStyle(
            //                   fontSize: 120, fontWeight: FontWeight.bold)))
            //     ],
            //   ),
            // ),
            //   ],
            // )
            ));
  }
}

// サイドバーに表示する画面サンプル
class MainContents extends StatelessWidget {
  const MainContents({super.key, required this.index, required this.nowTime});

  final int index;
  final String nowTime;

  @override
  Widget build(BuildContext context) {
    switch (index) {
      case 1:
        return Expanded(
          child: ColoredBox(
            color: Colors.red[200]!,
            child: const Center(
              child: Text('Home'),
            ),
          ),
        );
      case 2:
        return Expanded(
          child: ColoredBox(
            color: Colors.green[200]!,
            child: const Center(
              child: Text('Friends'),
            ),
          ),
        );
      default:
        return Expanded(
          child: Center(
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
        );
    }
  }
}
