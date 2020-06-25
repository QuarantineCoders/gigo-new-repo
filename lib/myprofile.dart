import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tutorjoes_app/main.dart';
import 'package:http/http.dart' as http;

import 'editprofile.dart';

class Myporfile extends StatefulWidget {
  final String id;

  const Myporfile({Key key, this.id}) : super(key: key);
  @override
  _MyporfileState createState() => _MyporfileState();
}

class _MyporfileState extends State<Myporfile> {
  Future<List> getprofile(String id) async {
    var url = "http://192.168.1.100/GIGOApp/profile.php";
    //var url = "https://flutterthanis.000webhostapp.com/getData.php";
    final response = await http.post(url, body: {"id": id});
    var dataRecevied = json.decode(response.body);
    return dataRecevied;
  }

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
          "MY Profile",
          style: TextStyle(
            color: Colors.teal[700],
            fontSize: 23.0,
          ),
        ),
      ),
      body: ListView(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new FutureBuilder<List>(
              future: getprofile(widget.id),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  print("Error is Loading " + snapshot.error.toString());
                }
                return snapshot.hasData
                    ? new profilelist(list: snapshot.data)
                    : new Center(
                        child: CircularProgressIndicator(),
                      );
              }),
        ],
      ),
    );
  }
}

class profilelist extends StatelessWidget {
  final List list;

  const profilelist({Key key, this.list}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: list == null ? 0 : list.length,
        itemBuilder: (context, i) {
          return Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                          Colors.tealAccent[400],
                          Colors.tealAccent[200],
                          Colors.tealAccent[100],
                        ])),
                    child: Container(
                      width: 392.0,
                      height: 200.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                width: 20.0,
                              ),
                              CircleAvatar(
                                maxRadius: 50,
                                backgroundColor: Colors.white,
                                child: Text(
                                  list[i]['Name']
                                      .toString()
                                      .substring(0, 1)
                                      .toUpperCase(),
                                  style: TextStyle(
                                      fontSize: 60.0,
                                      color: Colors.tealAccent[700]),
                                ),
                              ),
                              SizedBox(
                                width: 15.0,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    list[i]["Name"].toString().toUpperCase(),
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.teal[700]),
                                  ),
                                  Text(
                                    list[i]["email"],
                                    style: TextStyle(
                                        fontSize: 17.0, color: Colors.blueGrey),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(left: 45.0, right: 45.0),
                    child: Text(
                      "YOUR PHONE",
                      style: TextStyle(fontSize: 15.0, color: Colors.grey),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(left: 45.0, right: 45.0),
                    child: Text(
                      list[i]["contact_no"],
                      style: TextStyle(fontSize: 20.0, color: Colors.blueGrey),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: new Container(
                        margin: const EdgeInsets.only(left: 45.0, right: 45.0),
                        child: Divider(
                          color: Colors.blueGrey,
                          height: 36,
                        )),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(left: 45.0, right: 45.0),
                    child: Text(
                      "YOUR HOUSE NO",
                      style: TextStyle(fontSize: 15.0, color: Colors.grey),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(left: 45.0, right: 45.0),
                    child: Text(
                      list[i]["House_no"],
                      style: TextStyle(fontSize: 20.0, color: Colors.blueGrey),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: new Container(
                        margin: const EdgeInsets.only(left: 45.0, right: 45.0),
                        child: Divider(
                          color: Colors.blueGrey,
                          height: 36,
                        )),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(left: 45.0, right: 45.0),
                    child: Text(
                      "STREET",
                      style: TextStyle(fontSize: 15.0, color: Colors.grey),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(left: 45.0, right: 45.0),
                    child: Text(
                      list[i]["street"],
                      style: TextStyle(fontSize: 20.0, color: Colors.blueGrey),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: new Container(
                        margin: const EdgeInsets.only(left: 45.0, right: 45.0),
                        child: Divider(
                          color: Colors.blueGrey,
                          height: 36,
                        )),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(left: 45.0, right: 45.0),
                    child: Text(
                      "CITY",
                      style: TextStyle(fontSize: 15.0, color: Colors.grey),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(left: 45.0, right: 45.0),
                    child: Text(
                      list[i]["city"],
                      style: TextStyle(fontSize: 20.0, color: Colors.blueGrey),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: new Container(
                        margin: const EdgeInsets.only(left: 45.0, right: 45.0),
                        child: Divider(
                          color: Colors.blueGrey,
                          height: 36,
                        )),
                  ),
                ],
              ),
              SizedBox(
                height: 13.0,
              ),
              Container(
                margin: const EdgeInsets.only(left: 50.0, right: 50.0),
                child: ButtonTheme(
                  buttonColor: Colors.red,
                  height: 50.0,
                  minWidth: double.infinity,
                  child: RaisedButton(
                      shape: StadiumBorder(),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => editProfile(
                                      id: list[i]['cus_id'],
                                      name: list[i]['Name'],
                                      houseno: list[i]['House_no'],
                                      street: list[i]['street'],
                                      city: list[i]['city'],
                                      contactno: list[i]['contact_no'],
                                    )));
                      },
                      child: Text(
                        "EDIT MY PROFILE",
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      )),
                ),
              ),
            ],
          );
        });
  }
}
