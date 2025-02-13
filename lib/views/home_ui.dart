import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sau_mukratha_app/views/about_ui.dart';
import 'package:sau_mukratha_app/views/cal_bill_ui.dart';
import 'package:sau_mukratha_app/views/menu_ui.dart';

class HomeUI extends StatefulWidget {
  const HomeUI({super.key});

  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  NotchBottomBarController _pageController = NotchBottomBarController(index: 1);

  //สร้างตัวแปรเก็บหน้าจอที่จะแสดง ที่ body
  List<Widget> viewInBody = [
    CalBillUI(),
    MenuUI(),
    AboutUI(),
  ];
  int indexshow = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text(
          'Tech SAU BUFFET',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: AnimatedNotchBottomBar(
        onTap: (valueParam) {
          setState(() {
            indexshow = valueParam;
          });
        },
        kIconSize: 24.0,
        kBottomRadius: 28.0,
        notchColor: Colors.deepOrange,
        color: Colors.deepOrange,
        notchBottomBarController: _pageController,
        bottomBarItems: [
          BottomBarItem(
            inActiveItem: Icon(
              FontAwesomeIcons.moneyBill1Wave,
              color: const Color.fromARGB(255, 191, 191, 191),
            ),
            activeItem: Icon(
              FontAwesomeIcons.moneyBill1Wave,
              color: Colors.white,
            ),
            itemLabel: 'คิดเงิน',
          ),
          BottomBarItem(
            inActiveItem: Icon(
              Icons.home,
              color: const Color.fromARGB(255, 191, 191, 191),
            ),
            activeItem: Icon(
              Icons.home,
              color: Colors.white,
            ),
            itemLabel: 'MENU',
          ),
          BottomBarItem(
            inActiveItem: Icon(
              Icons.star,
              color: const Color.fromARGB(255, 191, 191, 191),
            ),
            activeItem: Icon(
              Icons.star,
              color: Colors.white,
            ),
            itemLabel: 'เกี่ยวกับ',
          ),
        ],
      ),
      body: viewInBody[indexshow],
    );
  }
}
