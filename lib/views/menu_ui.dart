import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MenuUI extends StatefulWidget {
  const MenuUI({super.key});

  @override
  State<MenuUI> createState() => _MenuUIState();
}

class _MenuUIState extends State<MenuUI> {
  //ตัวแปรเก็บรูปที่จะแสดงที่ ListView
  List<String> menuShow = [
    'assets/images/img1.png',
    'assets/images/img2.png',
    'assets/images/img3.png',
    'assets/images/img4.png',
    'assets/images/img5.png',
    'assets/images/img6.png',
    'assets/images/img7.png',
  ];

  //ตัวแปรเก็บสาขาที่จะแสดงที่ ListView
  List<String> branchShop = [
    'assets/images/shop1.png',
    'assets/images/shop2.png',
    'assets/images/shop3.png',
    'assets/images/shop4.png',
    'assets/images/shop5.png',
  ];

  List<String> shopLocation = [
    'https://www.google.co.th/maps/@13.7048809,100.4124638,3018m',
    'https://www.google.co.th/maps/@13.7250028,100.5501583,3018m',
    'https://www.google.co.th/maps/@18.7943226,98.9152777,3018m',
    'https://www.google.co.th/maps/@7.8833484,98.371369,3018m',
    'https://www.google.co.th/maps/@9.1886611,99.3454664,3018m',
  ];
  //method เปิด brower
  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 24.0,
            ),
            Image.asset(
              'assets/images/logo.png',
              width: 180.0,
            ),
            SizedBox(
              height: 24.0,
            ),
            Text(
              'เมนูเด็ด',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 24.0,
            ),
            Container(
              height: 100.0,
              margin: EdgeInsets.only(
                left: 25.0,
                right: 25.0,
              ),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: menuShow.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: Image.asset(
                        menuShow[index],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 24.0,
            ),
            Text(
              'ร้านในเครือ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 24.0,
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: branchShop.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      left: 35.0,
                      right: 35.0,
                      bottom: 15.0,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: InkWell(
                        onTap: () {
                          _launchInBrowser(
                            Uri.parse(shopLocation[index]),
                          );
                        },
                        child: Image.asset(
                          branchShop[index],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
