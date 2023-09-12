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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      children: [
        NavigationRail(
          destinations: const [
            NavigationRailDestination(
              icon: Icon(Icons.home),
              label: Text('Home'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.bookmark),
              label: Text('Bookmark'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.people),
              label: Text('Friends'),
            ),
          ],
          selectedIndex: _selectedIndex,
          onDestinationSelected: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
        MainContents(
          index: _selectedIndex,
          nowTime: nowTime,
        ),
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
      ],
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
