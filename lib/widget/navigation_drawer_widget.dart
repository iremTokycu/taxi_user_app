import 'package:flutter/material.dart';

import '../address.dart';
import '../credit_cart.dart';
import '../konum.dart';
import '../login.dart';
import '../route.dart';
import '../travel_history.dart';


class NavigationDrawerWidget extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) {


    return Drawer(
      child: Material(
        color: Color.fromRGBO(255, 98, 0, 1.0),
        child: ListView(
          children: <Widget>[

            Container(
              padding: padding,
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  //  buildSearchField(),


                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Harita',
                    icon: Icons.map,
                    onClicked: () => selectedItem(context, 3),
                  ),



                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Geçmiş',
                    icon: Icons.notifications_active,
                    onClicked: () => selectedItem(context, 6),
                  ),

                  const SizedBox(height: 24),
                  Divider(color: Colors.white70),
                  const SizedBox(height: 24),
                  buildMenuItem(
                    text: 'Kredi kartlari',
                    icon: Icons.credit_card,
                    onClicked: () => selectedItem(context, 4),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Kredi karti ekleme',
                    icon: Icons.credit_card,
                    onClicked: () => selectedItem(context, 5),
                  ),

                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Geri bildirim',
                    icon: Icons.notifications_outlined,
                    onClicked: () => selectedItem(context, 7),
                  ),

                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Arıza bildirimi',
                    icon: Icons.priority_high,
                    onClicked: () => selectedItem(context, 8),
                  ),

                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'SSS',
                    icon: Icons.contact_support_rounded,
                    onClicked: () => selectedItem(context, 9),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHeader({
    String urlImage,
    String name,
    String email,
    VoidCallback onClicked,
  }) =>
      InkWell(
        onTap: onClicked,
        child: Container(
          padding: padding.add(EdgeInsets.symmetric(vertical: 40)),
          child: Row(
            children: [
              CircleAvatar(radius: 30, backgroundImage: NetworkImage(urlImage)),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    email,
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ],
              ),
              Spacer(),
              CircleAvatar(
                radius: 24,
                backgroundColor: Color.fromRGBO(255, 98, 0, 1.0),
                child: Icon(Icons.add_comment_outlined, color: Colors.white),
              )
            ],
          ),
        ),
      );



  Widget buildMenuItem({
    String text,
    IconData icon,
    VoidCallback onClicked,
  }) {
    final color = Colors.white;
    final hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();

    switch (index) {

      case 1:

        Route route = MaterialPageRoute(builder: (context){return CreditCardsPage();});
        Navigator.push(context, route);

        break;

      case 3:
        Route route = MaterialPageRoute(builder: (context){return AddressPageWidget();});
        Navigator.push(context, route);

        break;

      case 4:
        Route route = MaterialPageRoute(builder: (context){return TravelHistoryPage();});
        Navigator.push(context, route);

        break;

      case 5:
        Route route = MaterialPageRoute(builder: (context){return RouteScreen();});
        Navigator.push(context, route);

        break;

    }
  }
}
