import 'package:flutter/material.dart';
import 'package:taxi/sidebar.dart';

import 'add_credit_cart.dart';

void main() => runApp(new MaterialApp(
      home: new CreditCardsPage(),
    ));

class CreditCardsPage extends StatelessWidget {
  const CreditCardsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CreditCardsPageWidget();
  }
}

class CreditCardsPageWidget extends StatefulWidget {
  const CreditCardsPageWidget({Key key}) : super(key: key);

  @override
  CreditCardsPageWidgetState createState() => CreditCardsPageWidgetState();
}

class CreditCardsPageWidgetState extends State<CreditCardsPageWidget> {
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
            "Kredi Kartlarım",
            style: TextStyle(color: Colors.black),
          )),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                children: [
                  Dismissible(
                    key: ValueKey(1),
                    direction: DismissDirection.startToEnd,
                    onDismissed: (direction) {},
                    confirmDismiss: (direction) {
                      return null;
                    },
                    background: Container(
                      //color: Colors.red,
                      padding: EdgeInsets.only(left: 16),
                      child: Align(
                        child: Icon(
                          Icons.delete,
                          color: Colors.black,
                        ),
                        alignment: Alignment.centerLeft,
                      ),
                    ),
                    child: _buildCreditCard(
                        color: Color(0xFF090943),
                        cardExpiration: "08/2022",
                        cardHolder: "HOUSSEM SELMI",
                        cardNumber: "3546 7532 XXXX 9742"),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              _buildCreditCard(
                  color: Color(0xFF000000),
                  cardExpiration: "05/2024",
                  cardHolder: "HOUSSEM SELMI",
                  cardNumber: "9874 4785 XXXX 6548"),
              SizedBox(
                height: 15,
              ),
              Center(
                child: Ink(
                  decoration: const ShapeDecoration(
                    color: Color(0xFF081603),
                    shape: CircleBorder(),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.add),
                    iconSize: 48,
                    color: Colors.white,
                    onPressed: () {
                      print('enter');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddCreditCart()),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Build the title section
  Column _buildTitleSection({@required title, @required subTitle}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 16.0),
          child: Text(
            '$title',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, bottom: 16.0),
          child: Text(
            '$subTitle',
            style: TextStyle(fontSize: 21, color: Colors.black45),
          ),
        )
      ],
    );
  }

  // Build the credit card widget
  Card _buildCreditCard(
      {@required Color color,
      @required String cardNumber,
      @required String cardHolder,
      @required String cardExpiration}) {
    return Card(
      elevation: 4.0,
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      child: Container(
        height: 200,
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 22.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _buildLogosBlock(),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(
                '$cardNumber',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 21,
                    fontFamily: 'CourrierPrime'),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _buildDetailsBlock(
                  label: 'CARDHOLDER',
                  value: cardHolder,
                ),
                _buildDetailsBlock(label: 'VALID THRU', value: cardExpiration),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Build the top row containing logos
  Row _buildLogosBlock() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Image.asset(
          "assets/images/contact_less.png",
          height: 20,
          width: 18,
        ),
        Image.asset(
          "assets/images/mastercard.png",
          height: 50,
          width: 50,
        ),
      ],
    );
  }

// Build Column containing the cardholder and expiration information
  Column _buildDetailsBlock({@required String label, @required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          '$label',
          style: TextStyle(
              color: Colors.grey, fontSize: 9, fontWeight: FontWeight.bold),
        ),
        Text(
          '$value',
          style: TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
        )
      ],
    );
  }

// Build the FloatingActionButton
  Container _buildAddCardButton({
    @required Icon icon,
    @required Color color,
  }) {
    return Container(
      margin: const EdgeInsets.only(top: 24.0),
      alignment: Alignment.center,
      child: FloatingActionButton(
        elevation: 2.0,
        onPressed: () {
          print("Add a credit card");
        },
        backgroundColor: color,
        mini: false,
        child: icon,
      ),
    );
  }
}
