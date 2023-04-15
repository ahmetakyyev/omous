//@dart=2.9
import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:omous/presentation/screens/destinations_screen.dart';
import 'package:omous/presentation/screens/home_screen.dart';

import '../../main.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key key}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _currentIndex = 0;
  StreamSubscription subscription;
  bool isDeviceConnected = false;
  bool isAlertSet = false;
  PageController _pageController = PageController();

  List<IconData> iconList = [
    Icons.home,
    Icons.explore,
    Icons.contacts,
  ];
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    _pageController.animateToPage(index,
        curve: Curves.easeIn, duration: Duration(milliseconds: 250));
  }

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    subscription.cancel();
    super.dispose();
  }

  @override
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    DestinationScreen(),
    Container(),
  ];
  @override
  Future _onWillPop() async {
    if (_currentIndex != 0) {
      setState(() => _currentIndex = 0);
      _pageController.animateToPage(0,
          duration: Duration(milliseconds: 200), curve: Curves.easeIn);
    } else {
      await SystemChannels.platform
          .invokeMethod<void>('SystemNavigator.pop', true);
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  showDialogBox() => showCupertinoDialog<String>(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: const Text('No Connection'),
          content: const Text('Please check your internet connectivity'),
          actions: <Widget>[
            TextButton(
              onPressed: () async {},
              child: const Text('OK'),
            ),
          ],
        ),
      );
  BottomNavigationBar _bottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      onTap: (index) => _onItemTap(index),
      currentIndex: _selectedIndex,
      selectedItemColor: HexColor('#44785F'),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      //selectedLabelStyle: TextStyle(fontWeight: FontWeight.w500),
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(iconList[0]),
          label: '.',
        ),
        BottomNavigationBarItem(
          icon: Icon(iconList[1]),
          label: '.',
        ),
        BottomNavigationBarItem(
          icon: Icon(iconList[2]),
          label: '.',
        ),
      ],
    );
  }
}
