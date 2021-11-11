import 'package:flutter/material.dart';
import 'package:payments_app/screens/main_screen/home_screen.dart';
import 'package:payments_app/screens/main_screen/settings_screen.dart';
import 'package:payments_app/screens/main_screen/transactions_screen.dart';
import 'package:payments_app/screens/main_screen/scanner_screen.dart';

class MainFrame extends StatefulWidget {
  const MainFrame({Key? key}) : super(key: key);

  @override
  State<MainFrame> createState() => _MainFrameState();
}

class _MainFrameState extends State<MainFrame> {
  int _selectedIndex = 0;

  static const List screensOptions = [
    HomeScreen(),
    ScannerScreen(),
    TransactionScreen(),
    SettingScreen(),
  ];

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(child: screensOptions[_selectedIndex],),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "HOME",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.qr_code_scanner),
              label: "Scan & Pay",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: "HISTORY",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "SETTINGS",
            ),
          ],
          currentIndex: _selectedIndex,
          unselectedItemColor: Colors.white,
          elevation: 5,
          selectedItemColor: Theme.of(context).primaryColorDark,
          onTap: _onItemTapped,
        ),
    );
  }
}
