import 'package:flutter/material.dart';
import 'home.dart';
import 'settings.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {

  bool lightOrDark = true;

  static const List<Widget> widgets = [ Home(), Settings() ];

  int currentIndex = 0;
  void changeIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightOrDark ? ThemeData.light() : ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('My USF GDSC App')),
        ),
        body: widgets[currentIndex],
        floatingActionButton: FloatingActionButton(
          child: const Icon(
            Icons.color_lens,
            size: 32,
          ),
          onPressed: () => {
            setState(() {
              lightOrDark = !lightOrDark;
            },)
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
          selectedFontSize: 0,
          iconSize: 32,
          currentIndex: currentIndex,
          onTap: (index) => changeIndex(index),
        ),
      ),
    );
  }
}