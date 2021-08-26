import 'package:flutter/material.dart';

import 'code.dart';

void main() {
  runApp(new MaterialApp(
    home: new LoginPage(),
  ));
}

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Login();
  }
}

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _checkboxListTile1 = false;
  bool _checkboxListTile2 = false;
  bool _checkboxListTile3 = false;
  bool _isButtonDisabled = true;
  final _textController = TextEditingController();
  var defaultStyle = TextStyle(color: Colors.black);
  var linkStyle = TextStyle(color: Colors.blue);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Text(
          'Giriş Ekranı',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.yellow,
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                "assets/images/taksi_500x500_arkaseffaf.png",
                width: 200,
                height: 200,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "Telefon Numarası",
                    hintText: "+09",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(7)),
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  //Tintin sozlesmesi
                  CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    title: RichText(
                        text: TextSpan(children: [
                      TextSpan(
                        style: linkStyle,
                        text: "Kullanıcı sözleşmesini ",
                      ),
                      TextSpan(
                        style: defaultStyle,
                        text: "okudum ve onaylıyorum",
                      )
                    ])),
                    value: _checkboxListTile1,
                    onChanged: (value) {
                      setState(() {
                        _checkboxListTile1 = !_checkboxListTile1;
                      });
                    },
                  ),
                  //Acik riza metni sozlesmesi
                  CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    title: RichText(
                        text: TextSpan(children: [
                      TextSpan(
                        style: linkStyle,
                        text: "Açık rıza metnini ",
                      ),
                      TextSpan(
                        style: defaultStyle,
                        text: "okudum ve onaylıyorum.",
                      )
                    ])),
                    value: _checkboxListTile2,
                    onChanged: (value) {
                      setState(() {
                        _checkboxListTile2 = !_checkboxListTile2;
                      });
                    },
                  ),
                  //Bilgilendirme metni sozlesmesi
                  CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    title: RichText(
                        text: TextSpan(children: [
                      TextSpan(
                        style: linkStyle,
                        text: "Bilgilendirme metnini ",
                      ),
                      TextSpan(
                        style: defaultStyle,
                        text: "okudum ve onaylıyorum.",
                      )
                    ])),
                    value: _checkboxListTile3,
                    onChanged: (value) {
                      setState(() {
                        _checkboxListTile3 = !_checkboxListTile3;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              RaisedButton(
                color: Colors.green,
                child: Text(
                  "Kod Al",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Route route = MaterialPageRoute(builder: (context) {
                    return PinPutTest();
                  });
                  Navigator.push(context, route);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
