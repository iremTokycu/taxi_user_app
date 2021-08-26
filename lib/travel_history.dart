import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:taxi/sidebar.dart';

import 'code.dart';

void main() {
  runApp(TravelHistoryPage());
}

class TravelHistoryPage extends StatelessWidget {
  const TravelHistoryPage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TravelHistoryPageWidget();
  }
}

class TravelHistoryPageWidget extends StatefulWidget {
  const TravelHistoryPageWidget({Key key}) : super(key: key);

  @override
  _TravelHistoryPageWidgetState createState() =>
      _TravelHistoryPageWidgetState();
}

class _TravelHistoryPageWidgetState extends State<TravelHistoryPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SidebarPage(),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.yellow,
        title: Text(
          "Yolculuk Geçmişiniz",
          style: TextStyle(color: Colors.black),
        ),
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
                          Icon(Icons.account_circle_rounded),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Yolculuk Süresi:",
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Text("30 dakika", style: TextStyle(fontSize: 15))
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
                            "Ücret:",
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Text("100 TL", style: TextStyle(fontSize: 15))
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
