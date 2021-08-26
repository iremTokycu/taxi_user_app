// Flutter code sample for Checkbox
//
// This example shows how you can override the default theme of
// of a [Checkbox] with a [MaterialStateProperty].
// In this example, the checkbox's color will be `Colors.blue` when the [Checkbox]
// is being pressed, hovered, or focused. Otherwise, the checkbox's color will
// be `Colors.red`.

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taxi/sidebar.dart';
import 'konum.dart';

void main() => runApp(new MaterialApp(
      home: new PaymentRate(),
    ));

/// This is the main application widget.
class PaymentRate extends StatelessWidget {
  const PaymentRate({Key key}) : super(key: key);

  static const String _title = 'Ödeme Yöntemi';

  @override
  Widget build(BuildContext context) {
    return PaymentRateWidget();
  }
}

/// This is the stateful widget that the main application instantiates.
class PaymentRateWidget extends StatefulWidget {
  const PaymentRateWidget({Key key}) : super(key: key);

  @override
  State<PaymentRateWidget> createState() => _PaymentRateWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _PaymentRateWidgetState extends State<PaymentRateWidget> {
  bool _checked1 = false;
  bool _checked = false;
  String paymentRate;

  Future<String> setPaymentRate(String value) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString("payment_rate", value);

    if (prefs.getString("payment_rate") != null) {
      return prefs.getString("payment_rate");
    }
  }

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.red;
    }

    return Scaffold(
      drawer: SidebarPage(),
      appBar: AppBar(
        title: Text("Ödeme Yöntemi"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: CheckboxListTile(
                  title: Text("Nakit"),
                  secondary: Icon(Icons.money_outlined),
                  controlAffinity: ListTileControlAffinity.platform,
                  value: _checked,
                  onChanged: (bool value) async {
                    paymentRate = await setPaymentRate("Nakit");

                    setState(() {
                      _checked = value;
                      _checked1 = false;
                      print(paymentRate);

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Maps()),
                      );
                    });
                  },
                  activeColor: Colors.green,
                  checkColor: Colors.black,
                ),
              ),
            ),
            SizedBox(
              height: 7,
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: CheckboxListTile(
                  title: Text("Kredi Kartı"),
                  secondary: Icon(Icons.payment),
                  controlAffinity: ListTileControlAffinity.platform,
                  value: _checked1,
                  onChanged: (bool value) async {
                    paymentRate = await setPaymentRate("Kredi Kartı");
                    setState(() {
                      print(paymentRate);
                      _checked1 = value;
                      _checked = false;

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Maps()),
                      );
                    });
                  },
                  activeColor: Colors.green,
                  checkColor: Colors.black,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
