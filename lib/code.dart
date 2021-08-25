import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:taxi/konum.dart';

void main() => runApp(CodePage());

class CodePage extends StatefulWidget {
  @override
  CodePageState createState() => CodePageState();
}

class CodePageState extends State<CodePage> {
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.green,
        hintColor: Colors.green,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('Doğrulama Kodu Ekranı')),
        backgroundColor: Colors.white,
        body: Builder(
          builder: (context) {
            return Center(
              child: SingleChildScrollView(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Image.asset(
                            "assets/images/taksi_500x500_arkaseffaf.png"),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          color: Colors.white,
                          margin: const EdgeInsets.all(20.0),
                          padding: const EdgeInsets.all(20.0),
                          child: PinPut(
                            fieldsCount: 5,
                            onSubmit: (String pin) =>
                                _showSnackBar(pin, context),
                            focusNode: _pinPutFocusNode,
                            controller: _pinPutController,
                            submittedFieldDecoration:
                                _pinPutDecoration.copyWith(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            selectedFieldDecoration: _pinPutDecoration,
                            followingFieldDecoration:
                                _pinPutDecoration.copyWith(
                              borderRadius: BorderRadius.circular(5.0),
                              border: Border.all(
                                color: Colors.deepPurpleAccent.withOpacity(.5),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30.0),
                        RaisedButton(
                          color: Colors.green,
                          child: Text("Giriş Yap"),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Maps()),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
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
