import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'code.dart';

void main() {
  runApp(LoginPage());
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Taksi',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: LoginState(),
    );
  }
}

class LoginState extends StatefulWidget {
  const LoginState({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginState> {
  final phoneController = TextEditingController();

  bool _checkboxListTile1 = false;
  bool _checkboxListTile2 = false;
  bool _checkboxListTile3 = false;
  var defaultStyle = TextStyle(color: Colors.black);
  var linkStyle = TextStyle(color: Colors.blue);

  @override
  void initState() {
    super.initState();
    phoneController.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    Future<bool> showExitPopup() async {
      return await showDialog(
            //show confirm dialogue
            //the return value will be from "Yes" or "No" options
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Exit App'),
              content: Text('Do you want to exit an App?'),
              actions: [
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  //return false when click on "NO"
                  child: Text('No'),
                ),
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  //return true when click on "Yes"
                  child: Text('Yes'),
                ),
              ],
            ),
          ) ??
          false; //if showDialouge had returned null, then return false
    }

    return WillPopScope(
      onWillPop: showExitPopup,
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'GİRİŞ',
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/taksi_500x500_arkaseffaf.png',
              width: 200,
              height: 200,
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                controller: phoneController,
                decoration: InputDecoration(
                  hintText: '+90',
                  labelText: 'Telefon Numarası',
                  prefixIcon: Icon(
                    Icons.phone,
                    color: Colors.yellow,
                  ),
                  suffixIcon: phoneController.text.isEmpty
                      ? Container(
                          width: 0,
                        )
                      : IconButton(
                          icon: Icon(
                            Icons.close,
                            color: Colors.black,
                          ),
                          onPressed: () => phoneController.clear(),
                        ),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
              ),
            ),
            SizedBox(
              height: 10,
            ),

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
            SizedBox(
              height: 10,
            ),
            RaisedButton(
              color: Colors.green,
              highlightColor: Colors.red,
              elevation: 10,
              child: Text(
                "Kod Al",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CodePage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
