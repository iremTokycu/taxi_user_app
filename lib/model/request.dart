class Request {
  int id;
  int driverid;
  int userid;

  Request({this.id, this.driverid, this.userid});

  factory Request.fromJson(Map<String, dynamic> json) {
    return Request(
      id: json['id'],
      driverid: json['driverid'],
      userid: json['userid'],
    );
  }
}
