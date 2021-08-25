import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi/main.dart';
import 'package:intl/intl.dart';
import 'package:taxi/payment_rate.dart';
import 'package:taxi/sidebar.dart';
import 'package:taxi/vehicle_type.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'code.dart';
import 'date_picker.dart';

void main() => runApp(Maps());

class Maps extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MapScreen();
  }
}

class MapScreen extends StatefulWidget {
  const MapScreen({Key key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  static const _initialCameraPosition = CameraPosition(
    target: LatLng(40.7358027, 31.5799509),
    zoom: 11.5,
  );
  GoogleMapController _googleMapController;
  final format = DateFormat("yyyy-MM-dd HH:mm");
  final initialValue = DateTime.now();
  AutovalidateMode autoValidateMode = AutovalidateMode.onUserInteraction;
  bool readOnly = true;
  bool showResetIcon = true;
  String paymentRate = "Seciniz";
  DateTime value = DateTime.now();
  int changedCount = 0;
  int savedCount = 0;
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    getPaymentRate();
    super.initState();
  }

  Future<void> getPaymentRate() async {
    final SharedPreferences prefs = await _prefs;

    setState(() {
      paymentRate = prefs.getString("payment_rate");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SidebarPage(),
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text(
          "Taksi Çağırma Ekranı",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Stack(
        children: [
          GoogleMap(
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            initialCameraPosition: _initialCameraPosition,
            onMapCreated: (controller) => _googleMapController = controller,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 180.0, right: 12),
            child: Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                backgroundColor: Colors.yellow,
                foregroundColor: Colors.black,
                onPressed: () => _googleMapController.animateCamera(
                  CameraUpdate.newCameraPosition(_initialCameraPosition),
                ),
                child: const Icon(
                  Icons.center_focus_strong,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PaymentRate()),
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    color: Colors.white,
                    width: 160,
                    height: 90,
                    child: Column(children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0, left: 10),
                            child: Text(
                              "ÖDEME ŞEKLİ",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.blueAccent,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Icon(
                              Icons.payment,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        height: 10,
                        thickness: 1,
                        indent: 10,
                        endIndent: 10,
                        color: Colors.grey,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 11.0, left: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              paymentRate ?? "Seciniz",
                              style: TextStyle(fontSize: 14),
                            ),
                            SizedBox(
                              width: 50,
                            ),
                            Icon(
                              Icons.unfold_more,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      )
                    ]),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 160.0,
                    height: 50.0,
                    child: RaisedButton(
                      child: Text(
                        "Taksi Çağır",
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.blueAccent,
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => VehicleType()),
                );
              },
              child: Align(
                alignment: Alignment.bottomRight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      color: Colors.white,
                      width: 160,
                      height: 90,
                      child: Column(children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 8.0, left: 10),
                              child: Text(
                                "ARAÇ TİPİ",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.blueAccent,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 45,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Icon(
                                Icons.airport_shuttle_outlined,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        Divider(
                          height: 10,
                          thickness: 1,
                          indent: 10,
                          endIndent: 10,
                          color: Colors.grey,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 11.0, left: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Sarı Taksi",
                                style: TextStyle(fontSize: 14),
                              ),
                              SizedBox(
                                width: 55,
                              ),
                              Icon(
                                Icons.unfold_more,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        ),
                      ]),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 160.0,
                      height: 50.0,
                      child: RaisedButton(
                        child: Text(
                          "Rezerve Et",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.blueAccent,
                        onPressed: () {
                          print('enter');
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DatePicker()),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Center(
              child: Column(
                children: [
                  Container(
                    color: Colors.white,
                    width: 250,
                    height: 40,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.near_me,
                          color: Colors.blueAccent,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text("Mevcut konum değişecek")
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    color: Colors.white,
                    width: 250,
                    height: 40,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.subdirectory_arrow_right,
                          color: Colors.blueAccent,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "İniş noktası ekle",
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
