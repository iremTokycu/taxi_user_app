import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:taxi/konum.dart';

void main() => runApp(new MaterialApp(
      home: new PinPutTest(),
    ));

class PinPutTest extends StatelessWidget {
  const PinPutTest({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PinPutWidget();
  }
}

class PinPutWidget extends StatefulWidget {
  const PinPutWidget({Key key}) : super(key: key);

  @override
  PinPutWidgetState createState() => PinPutWidgetState();
}

class PinPutWidgetState extends State<PinPutWidget> {
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: Colors.deepPurpleAccent),
      borderRadius: BorderRadius.circular(15.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.yellow,
        title: Text(
          'Doğrulama Kodu Ekranı',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          iconSize: 30,
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      backgroundColor: Colors.white,
      body: Builder(
        builder: (context) {
          return Center(
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Image.asset(
                      "assets/images/taksi_500x500_arkaseffaf.png",
                      width: 200,
                      height: 200,
                    ),
                    Container(
                      color: Colors.white,
                      margin: const EdgeInsets.only(right: 20.0, left: 20.0),
                      padding: const EdgeInsets.only(
                          right: 20.0, left: 20.0, bottom: 20),
                      child: PinPut(
                        fieldsCount: 6,
                        onSubmit: (String pin) => _showSnackBar(pin, context),
                        focusNode: _pinPutFocusNode,
                        controller: _pinPutController,
                        submittedFieldDecoration: _pinPutDecoration.copyWith(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        selectedFieldDecoration: _pinPutDecoration,
                        followingFieldDecoration: _pinPutDecoration.copyWith(
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(
                            color: Colors.deepPurpleAccent.withOpacity(.5),
                          ),
                        ),
                      ),
                    ),
                    RaisedButton(
                      color: Colors.green,
                      child: Text(
                        "Giriş Yap",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        Route route = MaterialPageRoute(builder: (context) {
                          return MapScreen();
                        });
                        Navigator.push(context, route);
                      },
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _showSnackBar(String pin, BuildContext context) {
    final snackBar = SnackBar(
      duration: const Duration(seconds: 3),
      content: Container(
        height: 80.0,
        child: Center(
          child: Text(
            'Pin Submitted. Value: $pin',
            style: const TextStyle(fontSize: 25.0),
          ),
        ),
      ),
      backgroundColor: Colors.deepPurpleAccent,
    );
    Scaffold.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
