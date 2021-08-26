import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:taxi/sidebar.dart';

import 'code.dart';

void main() {
  runApp(new MaterialApp(
    home: new ReservationPage(),
  ));
}

class ReservationPage extends StatelessWidget {
  const ReservationPage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ReservationPageWidget();
  }
}

class ReservationPageWidget extends StatefulWidget {
  const ReservationPageWidget({Key key}) : super(key: key);

  @override
  _ReservationPageWidgetState createState() => _ReservationPageWidgetState();
}

class _ReservationPageWidgetState extends State<ReservationPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SidebarPage(),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.yellow,
        title: Text("Rezervasyonlar",style: TextStyle(color: Colors.black),),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
              child: SizedBox(
                width: 350,
                child: Card(
                  elevation: 4.0,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Icon(Icons.account_circle_rounded),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Adı:",
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Text("Duygu", style: TextStyle(fontSize: 15))
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Icon(Icons.account_circle_rounded),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Soyadı:",
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Text("Durukan", style: TextStyle(fontSize: 15))
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Icon(Icons.add_location_outlined),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Mevcut Konum:",
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Text("Tepecik Mahallesi",
                              style: TextStyle(fontSize: 15))
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Icon(Icons.subdirectory_arrow_right),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Varış Noktası:",
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Text("Tabaklar Mahallesi.",
                              style: TextStyle(fontSize: 15))
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Icon(Icons.phone),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Telefon Numarası:",
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Text("0538 841 74 55", style: TextStyle(fontSize: 15))
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Icon(Icons.calendar_today),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Tarih-Saat:",
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Text("07.10.2021-10.30",
                              style: TextStyle(fontSize: 15))
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
              child: SizedBox(
                width: 350,
                child: Card(
                  elevation: 4.0,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Icon(Icons.account_circle_rounded),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Adı:",
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Text("Duygu", style: TextStyle(fontSize: 15))
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Icon(Icons.account_circle_rounded),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Soyadı:",
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Text("Durukan", style: TextStyle(fontSize: 15))
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Icon(Icons.add_location_outlined),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Mevcut Konum:",
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Text("Tepecik Mahallesi",
                              style: TextStyle(fontSize: 15))
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Icon(Icons.subdirectory_arrow_right),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Varış Noktası:",
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Text("Tabaklar Mahallesi.",
                              style: TextStyle(fontSize: 15))
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Icon(Icons.phone),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Telefon Numarası:",
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Text("0538 841 74 55", style: TextStyle(fontSize: 15))
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Icon(Icons.calendar_today),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Tarih-Saat:",
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Text("07.10.2021-10.30",
                              style: TextStyle(fontSize: 15))
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
              child: SizedBox(
                width: 350,
                child: Card(
                  elevation: 4.0,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Icon(Icons.account_circle_rounded),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Adı:",
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Text("Duygu", style: TextStyle(fontSize: 15))
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Icon(Icons.account_circle_rounded),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Soyadı:",
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Text("Durukan", style: TextStyle(fontSize: 15))
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Icon(Icons.add_location_outlined),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Mevcut Konum:",
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Text("Tepecik Mahallesi",
                              style: TextStyle(fontSize: 15))
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Icon(Icons.subdirectory_arrow_right),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Varış Noktası:",
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Text("Tabaklar Mahallesi.",
                              style: TextStyle(fontSize: 15))
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Icon(Icons.phone),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Telefon Numarası:",
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Text("0538 841 74 55", style: TextStyle(fontSize: 15))
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Icon(Icons.calendar_today),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Tarih-Saat:",
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Text("07.10.2021-10.30",
                              style: TextStyle(fontSize: 15))
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
              child: SizedBox(
                width: 350,
                child: Card(
                  elevation: 4.0,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Icon(Icons.account_circle_rounded),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Adı:",
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Text("Duygu", style: TextStyle(fontSize: 15))
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Icon(Icons.account_circle_rounded),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Soyadı:",
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Text("Durukan", style: TextStyle(fontSize: 15))
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Icon(Icons.add_location_outlined),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Mevcut Konum:",
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Text("Tepecik Mahallesi",
                              style: TextStyle(fontSize: 15))
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Icon(Icons.subdirectory_arrow_right),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Varış Noktası:",
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Text("Tabaklar Mahallesi.",
                              style: TextStyle(fontSize: 15))
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Icon(Icons.phone),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Telefon Numarası:",
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Text("0538 841 74 55", style: TextStyle(fontSize: 15))
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Icon(Icons.calendar_today),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Tarih-Saat:",
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Text("07.10.2021-10.30",
                              style: TextStyle(fontSize: 15))
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
