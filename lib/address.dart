import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';
import 'package:taxi/sidebar.dart';

void main() {
  runApp(new MaterialApp(
    home: new AddressPage(),
  ));
}

class AddressPage extends StatelessWidget {
  const AddressPage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AddressPageWidget();
  }
}

class AddressPageWidget extends StatefulWidget {
  const AddressPageWidget({Key key}) : super(key: key);

  @override
  _AddressPageWidgetState createState() => _AddressPageWidgetState();
}

class _AddressPageWidgetState extends State<AddressPageWidget> {
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
          "Favori Adreslerim",
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
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(children: [
                      Row(
                        children: [
                          Icon(Icons.map_outlined),
                          SizedBox(
                            width: 7,
                          ),
                          Text(
                            "Adres:",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Bahçelievler Mahallesi. Çiğdem Sokak. Aykanat Apartmanı. No:13. Bolu/Merkez",
                        style: TextStyle(fontSize: 15),
                      ),
                    ]),
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
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(children: [
                      Row(
                        children: [
                          Icon(Icons.map_outlined),
                          SizedBox(
                            width: 7,
                          ),
                          Text(
                            "Adres:",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Bahçelievler Mahallesi. Çiğdem Sokak. Aykanat Apartmanı. No:13. Bolu/Merkez",
                        style: TextStyle(fontSize: 15),
                      ),
                    ]),
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
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(children: [
                      Row(
                        children: [
                          Icon(Icons.map_outlined),
                          SizedBox(
                            width: 7,
                          ),
                          Text(
                            "Adres:",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Bahçelievler Mahallesi. Çiğdem Sokak. Aykanat Apartmanı. No:13. Bolu/Merkez",
                        style: TextStyle(fontSize: 15),
                      ),
                    ]),
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
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(children: [
                      Row(
                        children: [
                          Icon(Icons.map_outlined),
                          SizedBox(
                            width: 7,
                          ),
                          Text(
                            "Adres:",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Bahçelievler Mahallesi. Çiğdem Sokak. Aykanat Apartmanı. No:13. Bolu/Merkez",
                        style: TextStyle(fontSize: 15),
                      ),
                    ]),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Ink(
              decoration: const ShapeDecoration(
                color: Color(0xFF081603),
                shape: CircleBorder(),
              ),
              child: IconButton(
                color: Colors.white,
                iconSize: 30,
                icon: Icon(Icons.add),
                onPressed: () async {
                  NAlertDialog(
                    dialogStyle: DialogStyle(titleDivider: true),
                    title: Text("Adres Ekle"),
                    content: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Adresinizi Giriniz'),
                    ),
                    actions: <Widget>[
                      TextButton(
                        child: Text("Tamam"),
                        onPressed: () {},
                      )
                    ],
                  ).show(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
