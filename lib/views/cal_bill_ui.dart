import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sau_mukratha_app/views/show_bill_ui.dart';

class CalBillUI extends StatefulWidget {
  const CalBillUI({super.key});

  @override
  State<CalBillUI> createState() => _CalBillUIState();
}

class _CalBillUIState extends State<CalBillUI> {
  //ตัวแปรเพื่อเก็บให้กับ เด็ก ผู้ใหญ่
  bool adultCheck = false;
  bool childCheck = false;

  //ตัวควบคุม TextFile
  TextEditingController adultCtrl = TextEditingController(text: "0");
  TextEditingController childCtrl = TextEditingController(text: "0");
  TextEditingController cokeCtrl = TextEditingController(text: "0");
  TextEditingController pureCtrl = TextEditingController(text: "0");

  //ตัวแปรเพื่อใช้กับน้ำดื่ม
  int waterCheck = 1;

  //ตัวแปรเก็บรูปที่ถ่าย
  File? imgFile;

  //สร้่าง method เปิดกล้อง
  Future<void> openCamera() async {
    final picker = await ImagePicker().pickImage(
      source: ImageSource.camera,
      imageQuality: 75,
    );
    //ตรวจสอบว่าได้ถ่ายหรือไม่
    if (picker == null) return;
    //กรณีถ่ายมา ก็ไปกำหนดให้ imgFile
    setState(() {
      imgFile = File(picker.path);
    });
  }

  List<String> memberType = [
    'ไม่เป็นสมาชิก',
    'สมาฃืกทั่วไปลด 5%',
    'สมาฃิก VIP 20%',
  ];
  //ตัวแปรเก็บส่วนลดที่เลือกจากประเภทสมาชิก
  double discount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 35.0,
            right: 35.0,
          ),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 50.0,
                ),
                InkWell(
                  onTap: () {
                    openCamera();
                  },
                  child: imgFile == null
                      ? Image.asset(
                          'assets/images/camera.jpg',
                          height: 120.0,
                        )
                      : Image.file(
                          imgFile!,
                          height: 120.0,
                        ),
                ),
                SizedBox(
                  height: 35.0,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'จำนวนคน',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Checkbox(
                      onChanged: (valueParam) {
                        setState(() {
                          adultCheck = valueParam!;
                          if (valueParam == false) {
                            adultCtrl.text = "0";
                          }
                        });
                      },
                      value: adultCheck,
                    ),
                    Text(
                      'ผู้ใหญ่ 299 บาท/คน จำนวน     ',
                    ),
                    Flexible(
                      child: TextField(
                        keyboardType: TextInputType.number,
                        enabled: adultCheck,
                        controller: adultCtrl,
                      ),
                    ),
                    Text(
                      ' คน',
                    ),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      onChanged: (valueParam) {
                        setState(() {
                          childCheck = valueParam!;
                          if (valueParam == false) {
                            childCtrl.text = "0";
                          }
                        });
                      },
                      value: childCheck,
                    ),
                    Text(
                      'เด็ก 69 บาท/คน จำนวน       ',
                    ),
                    Flexible(
                      child: TextField(
                        keyboardType: TextInputType.number,
                        enabled: childCheck,
                        controller: childCtrl,
                      ),
                    ),
                    Text(
                      ' คน',
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'บุฟเฟต์น้ำดื่ม',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Radio(
                      onChanged: (valueParam) {
                        setState(() {
                          waterCheck = valueParam!;
                          if (waterCheck == 1) {
                            cokeCtrl.text = '0';
                            pureCtrl.text = '0';
                          }
                        });
                      },
                      value: 1,
                      groupValue: waterCheck,
                    ),
                    Text(
                      'รับ 25 บาท/หัว',
                    ),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      onChanged: (valueParam) {
                        setState(() {
                          waterCheck = valueParam!;
                        });
                      },
                      value: 2,
                      groupValue: waterCheck,
                    ),
                    Text(
                      'ไม่รับ',
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      '         โค้ก 20 บาท/ขวด จำนวน     ',
                    ),
                    Flexible(
                      child: TextField(
                        keyboardType: TextInputType.number,
                        enabled: waterCheck == 1 ? false : true,
                        controller: cokeCtrl,
                      ),
                    ),
                    Text(
                      ' ขวด',
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      '         น้ำเปล่า 15 บาท/ขวด จำนวน     ',
                    ),
                    Flexible(
                      child: TextField(
                        keyboardType: TextInputType.number,
                        enabled: waterCheck == 1 ? false : true,
                        controller: pureCtrl,
                      ),
                    ),
                    Text(
                      ' ขวด',
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'ประเภทสมาชิก',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                DropdownButton(
                  value: discount,
                  isExpanded: true,
                  items: memberType
                      .map(
                        (e) => DropdownMenuItem(
                          child: Text(e),
                          value: memberType.indexOf(e).toDouble(),
                        ),
                      )
                      .toList(),
                  onChanged: (valueParam) {
                    setState(() {
                      switch (valueParam) {
                        case 0:
                          discount = 0;
                          break;
                        case 1:
                          discount = 0.05;
                          break;
                        case 2:
                          discount = 0.2;
                          break;
                      }
                      discount = valueParam!;
                    });
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          if (imgFile == null) {
                            //แจ้งเตือน
                          } else if (adultCheck == true &&
                                  adultCtrl.text == '0' ||
                              adultCtrl.text.length == 0) {
                            //แจ้งเตือน
                          } else if (childCheck == true &&
                                  childCtrl.text == '0' ||
                              childCtrl.text.length == 0) {
                            //แจ้งเตือน
                          } else {
                            //คำนวณ
                            int adult = int.parse(adultCtrl.text);
                            int child = int.parse(childCtrl.text);
                            int coke = int.parse(cokeCtrl.text);
                            int pure = int.parse(pureCtrl.text);
                            double payWaterBuffet =
                                waterCheck == 1 ? 25.0 * (adult + child) : 0;
                            double payTotal = (299.0 * (adult) +
                                (69.0 * child) +
                                (20.0 * coke) +
                                (15.0 * pure) +
                                payWaterBuffet);
                            //คิดส่วนลด
                            payTotal = payTotal - (payTotal * discount);
                            //นำผลลัพธ์ที่ได้ไปส่งในหน้า show_bill_ui
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ShowBillUI(
                                  payTotal: payTotal,
                                  imgFile: imgFile,
                                ),
                              ),
                            );
                          }
                        },
                        icon: Icon(
                          Icons.calculate,
                          color: Colors.white,
                        ),
                        label: Text(
                          'คํานวณเงิน',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(
                            double.infinity,
                            50.0,
                          ),
                          backgroundColor: Colors.deepOrange,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Expanded(
                      flex: 2,
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          Icons.cancel,
                          color: Colors.white,
                        ),
                        label: Text(
                          'ยกเลิก',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(
                            double.infinity,
                            50.0,
                          ),
                          backgroundColor: Colors.grey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
