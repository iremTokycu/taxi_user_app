class History {
  int id;
  String source;
  String destination;
  String price;
  int userid;

  History({this.id, this.source, this.userid, this.destination, this.price});

  factory History.fromJson(Map<String, dynamic> json) {
    return History(
      id: json['id'],
      source: json['source'],
      destination: json['destination'],
      userid: json['userid'],
      price: json['price'],
    );
  }
}
