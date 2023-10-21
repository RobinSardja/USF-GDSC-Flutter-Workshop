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

  static const List<Widget> routes = [ Home(), Settings() ];

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
      home: Scaffold(
        appBar: AppBar(
          title: const Text("My USF GDSC App"),
        ),
        body: routes[currentIndex],
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.thumb_up),
          onPressed: () => {
            
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "Settings",
            ),
          ],
          currentIndex: currentIndex,
          onTap: (index) => changeIndex(index),
        ),
      ),
    );
  }
}
