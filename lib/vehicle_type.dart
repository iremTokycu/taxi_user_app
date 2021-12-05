// Flutter code sample for Checkbox
//
// This example shows how you can override the default theme of
// of a [Checkbox] with a [MaterialStateProperty].
// In this example, the checkbox's color will be `Colors.blue` when the [Checkbox]
// is being pressed, hovered, or focused. Otherwise, the checkbox's color will
// be `Colors.red`.

import 'package:flutter/material.dart';
import 'package:taxi/sidebar.dart';

import 'konum.dart';

void main() => runApp(const VehicleType());

/// This is the main application widget.
class VehicleType extends StatelessWidget {
  const VehicleType({Key key}) : super(key: key);

  static const String _title = 'Araç Tipi';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        drawer: SidebarPage(),
        appBar: AppBar(
          title: const Text(
            _title,
          ),
        ),
        body: const Center(
          child: VehicleTypeWidget(),
        ),
      ),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class VehicleTypeWidget extends StatefulWidget {
  const VehicleTypeWidget({Key key}) : super(key: key);

  @override
  State<VehicleTypeWidget> createState() => _VehicleTypeWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _VehicleTypeWidgetState extends State<VehicleTypeWidget> {
  bool isChecked = false;
  bool isChecked2 = false;
  bool _checked = false;

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

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: CheckboxListTile(
                title: Text("4 Kişilik"),
                secondary: Icon(Icons.directions_car_outlined),
                controlAffinity: ListTileControlAffinity.platform,
                value: _checked,
                onChanged: (bool value) {
                  setState(() {
                    _checked = value;

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MapScreen()),
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
                title: Text("6 Kişilik"),
                secondary: Icon(Icons.directions_car),
                controlAffinity: ListTileControlAffinity.platform,
                value: _checked,
                onChanged: (bool value) {
                  setState(() {
                    _checked = value;

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MapScreen()),
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
                title: Text("12 Kişilik"),
                secondary: Icon(Icons.airport_shuttle_rounded),
                controlAffinity: ListTileControlAffinity.platform,
                value: _checked,
                onChanged: (bool value) {
                  setState(() {
                    _checked = value;

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MapScreen()),
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
    );
  }
}
