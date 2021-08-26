import 'package:flutter/material.dart';
import 'package:foldable_sidebar/foldable_sidebar.dart';
import 'package:taxi/reservations.dart';
import 'package:taxi/travel_history.dart';

import 'address.dart';
import 'credit_cart.dart';
import 'konum.dart';
import 'login.dart';

void main() {
  runApp(SidebarPage());
}

class SidebarPage extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 25);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Colors.yellow[400],
        child: ListView(
          padding: padding,
          children: <Widget>[
            const SizedBox(
              height: 50,
            ),
            Row(
              children: [
                CircleAvatar(
                  radius: 28,
                  child: Icon(Icons.people),
                ),
                SizedBox(
                  width: 18,
                ),
                Column(
                  children: [
                    Text(
                      'Hesabım',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text("0538 841 7455")
                  ],
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            RaisedButton(
              color: Colors.green,
              highlightColor: Colors.red,
              elevation: 10,
              child: Text(
                "Taksi Çağır",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Maps()),
                );
              },
            ),
            SizedBox(
              height: 24,
            ),
            buildMenuItem(
                text: 'Kredi Kartlarım',
                icon: Icons.credit_card,
                onClicked: () => selectedItem(context, 0)),
            SizedBox(
              height: 16,
            ),
            buildMenuItem(
                text: 'Rezervasyonlarım',
                icon: Icons.schedule,
                onClicked: () => selectedItem(context, 1)),
            SizedBox(
              height: 16,
            ),
            buildMenuItem(
                text: 'Favori Adreslerim',
                icon: Icons.star_border,
                onClicked: () => selectedItem(context, 2)),
            SizedBox(
              height: 16,
            ),
            buildMenuItem(
                text: 'Yolculuk Geçmişi',
                icon: Icons.calendar_today,
                onClicked: () => selectedItem(context, 3)),
            const SizedBox(
              height: 24,
            ),
            Divider(
              color: Colors.black,
            ),
            const SizedBox(
              height: 24,
            ),
            buildMenuItem(
                text: 'Çıkış Yap',
                icon: Icons.logout,
                onClicked: () => selectedItem(context, 4)),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem({
    String text,
    IconData icon,
    VoidCallback onClicked,
  }) {
    final color = Colors.black;
    final hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(
        icon,
        color: color,
      ),
      title: Text(
        text,
        style: TextStyle(color: color),
      ),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();
    switch (index) {
      case 0:
        Route route = MaterialPageRoute(builder: (context) {
          return CreditCardsPage();
        });
        Navigator.push(context, route);
        break;
      case 1:
        Route route = MaterialPageRoute(builder: (context) {
          return ReservationPage();
        });
        Navigator.push(context, route);
        break;
      case 2:
        Route route = MaterialPageRoute(builder: (context) {
          return AddressPage();
        });
        Navigator.push(context, route);
        break;
      case 3:
        Route route = MaterialPageRoute(builder: (context) {
          return TravelHistoryPage();
        });
        Navigator.push(context, route);

        break;
      case 4:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => LoginPage(),
        ));

        break;
    }
  }
}
