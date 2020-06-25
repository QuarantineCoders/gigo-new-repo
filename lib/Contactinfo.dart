import 'package:flutter/material.dart';

import 'main.dart';

class ContactInfo extends StatefulWidget {
  final String id;

  const ContactInfo({Key key, this.id}) : super(key: key);
  @override
  _ContactInfoState createState() => _ContactInfoState();
}

class _ContactInfoState extends State<ContactInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.tealAccent,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.blueGrey,
            size: 20.0,
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MyAPP(
                          id: widget.id,
                        )));
          },
        ),
        title: new Text(
          "Contact info",
          style: TextStyle(
            color: Colors.teal[700],
            fontSize: 23.0,
          ),
        ),
      ),
      body: ListView(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Text(
                  "Telephone No : 024-2222878",
                  style: TextStyle(fontSize: 25.0, color: Colors.blueGrey),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Text(
                  "Mobile  No      : 077-3736353",
                  style: TextStyle(fontSize: 25.0, color: Colors.blueGrey),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Text(
                  "Email: UrbancouncilVav@gamil.com",
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.blueGrey,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Text(
                  "Address : Urban Council ,\n                    Park road, \n                     Vavuniya.",
                  style: TextStyle(fontSize: 25.0, color: Colors.blueGrey),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
