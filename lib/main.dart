import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tutorjoes_app/Contactinfo.dart';
import 'package:tutorjoes_app/about.dart';
import 'package:tutorjoes_app/login.dart';
import 'package:tutorjoes_app/myprofile.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:http/http.dart' as http;

import 'note.dart';

void main() {
  runApp(new MaterialApp(
    home: new MyAPP(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyAPP extends StatefulWidget {
  final String id;

  const MyAPP({Key key, this.id}) : super(key: key);
  @override
  _MyAPPState createState() => _MyAPPState();
}

class _MyAPPState extends State<MyAPP> {
  List<Note> _notes = List<Note>();
  Future<List<Note>> getData(String id) async {
    var url = "http://192.168.1.100/GIGOApp/index.php";
    //var url = "https://flutterthanis.000webhostapp.com/getData.php";
    final response = await http.post(url, body: {"id": id});

    var notes = List<Note>();
    if (response.statusCode == 200) {
      var notesJson = json.decode(response.body);
      for (var noteJson in notesJson) {
        notes.add(Note.fromJson(noteJson));
      }
    }

    return notes;
  }

  @override
  // ignore: must_call_super
  void initState() {
    getData(widget.id).then((value) {
      setState(() {
        _notes.addAll(value);
      });
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    Widget imageSlidercarousel = Container(
      height: 200.0,
      child: Carousel(
        boxFit: BoxFit.fill,
        images: [
          AssetImage("assets/img5.jpg"),
          AssetImage("assets/img6.png"),
          AssetImage("assets/img1.png"),
          AssetImage("assets/img2.jpg"),
          AssetImage("assets/img3.jpg"),
          AssetImage("assets/img4.jpg"),
        ],
        autoplay: true,
        indicatorBgPadding: 2.0,
        dotBgColor: Colors.tealAccent,
      ),
    );
    return MaterialApp(
      theme: new ThemeData(
        primaryColor: Colors.tealAccent,
        accentColor: Colors.white,
        // buttonColor: Colors.white,
        // textTheme: TextTheme(body1: TextStyle(color: Colors.lightGreenAccent)),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      home: Scaffold(
        appBar: new AppBar(
          /*leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              print("Icon Button Click");
            },
          ),*/
          title: new Text(
            "GIGO",
            style: TextStyle(
              color: Colors.teal[700],
              fontSize: 23.0,
            ),
          ),
          /*flexibleSpace: SafeArea(
            child: Icon(
              Icons.camera,
              color: Colors.white,
              size: 55.0,
            ),
          ),
          bottom: PreferredSize(
            child: Container(
              color: Colors.lightGreenAccent,
              height: 75.0,
              width: double.infinity,
              child: Center(
                child: Text(
                  "Urban Council",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35.0,
                  ),
                ),
              ),
            ),
            preferredSize: Size.fromHeight(75.0),
          ),*/
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              imageSlidercarousel,
              Row(
                children: <Widget>[
                  Container(
                    width: 250.0,
                    height: 50.0,
                    child: Text(
                      "Lastest update:",
                      style: TextStyle(
                        fontSize: 28.0,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    width: 60.0,
                    height: 50.0,
                    /* child: Text(
                      style: TextStyle(
                        fontSize: 28.0,
                        fontStyle: FontStyle.italic,
                        color: Colors.lightGreen,
                      ),*/
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                    width: 300.0,
                    height: 50.0,
                    child: Text(
                      "Total Garbage ",
                      style: TextStyle(
                        fontSize: 28.0,
                        fontStyle: FontStyle.italic,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                  Container(
                    width: 80.0,
                    height: 50.0,
                    child: Text(
                      _notes[0].total + "kg",
                      style: TextStyle(
                        fontSize: 28.0,
                        fontStyle: FontStyle.italic,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                    width: 300.0,
                    height: 50.0,
                    child: Text(
                      "Decomposable",
                      style: TextStyle(
                        fontSize: 28.0,
                        fontStyle: FontStyle.italic,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                  Container(
                    width: 80.0,
                    height: 50.0,
                    child: Text(
                      _notes[0].decomposable + "kg",
                      style: TextStyle(
                        fontSize: 28.0,
                        fontStyle: FontStyle.italic,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                    width: 300.0,
                    height: 50.0,
                    child: Text(
                      "Non-decomposable ",
                      style: TextStyle(
                        fontSize: 28.0,
                        fontStyle: FontStyle.italic,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                  Container(
                    width: 80.0,
                    height: 50.0,
                    child: Text(
                      _notes[0].nondecomposable + "kg",
                      style: TextStyle(
                        fontSize: 28.0,
                        fontStyle: FontStyle.italic,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                    width: 300.0,
                    height: 50.0,
                    child: Text(
                      "Capable compost",
                      style: TextStyle(
                        fontSize: 28.0,
                        fontStyle: FontStyle.italic,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                  Container(
                    width: 80.0,
                    height: 50.0,
                    child: Text(
                      _notes[0].capablecompost + "kg",
                      style: TextStyle(
                        fontSize: 28.0,
                        fontStyle: FontStyle.italic,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                    width: 300.0,
                    height: 50.0,
                    child: Text(
                      "Eco bricks",
                      style: TextStyle(
                        fontSize: 28.0,
                        fontStyle: FontStyle.italic,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                  Container(
                    width: 80.0,
                    height: 50.0,
                    child: Text(
                      _notes[0].ecobrick,
                      style: TextStyle(
                        fontSize: 28.0,
                        fontStyle: FontStyle.italic,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                    width: 300.0,
                    height: 50.0,
                    child: Text(
                      "Payable Amount",
                      style: TextStyle(
                        fontSize: 28.0,
                        fontStyle: FontStyle.italic,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                  Container(
                    width: 90.0,
                    height: 50.0,
                    child: Text(
                      "Rs." + _notes[0].amount,
                      style: TextStyle(
                        fontSize: 28.0,
                        fontStyle: FontStyle.italic,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: ButtonTheme(
                      buttonColor: Colors.red,
                      height: 50.0,
                      minWidth: 165.0,
                      child: RaisedButton(
                          shape: StadiumBorder(),
                          onPressed: () {},
                          child: Text(
                            "GET CASH",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20.0),
                          )),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 15.0, right: 10.0),
                    child: ButtonTheme(
                      buttonColor: Colors.red,
                      height: 50.0,
                      minWidth: 100.0,
                      child: RaisedButton(
                          shape: StadiumBorder(),
                          onPressed: () {},
                          child: Text(
                            "GET FERTILIZER",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20.0),
                          )),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        /* floatingActionButton: FloatingActionButton(
          elevation: 15.0,
          backgroundColor: Colors.lightGreen,
          child: Icon(
            Icons.add,
            color: Colors.white70,
          ),
          onPressed: () {},
        ),*/
        //floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

        drawer: Drawer(
          elevation: 17.0,
          child: Column(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text("Patrick Thanistas"),
                accountEmail: Text("thanithanis171198@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.tealAccent,
                  child: Icon(
                    Icons.account_circle,
                    size: 80.0,
                    color: Colors.white,
                  ),
                ),
                /*otherAccountsPictures: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.lightGreenAccent,
                    child: Center(
                      child: Icon(
                        Icons.account_circle,
                        size: 50.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],*/
              ),
              ListTile(
                onTap: () {
                  //setCurrentIndex(1);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyAPP(
                                id: _notes[0].id,
                              )));
                },
                title: Text(
                  "Home",
                  style: TextStyle(fontSize: 17.0),
                ),
                leading: Icon(Icons.home),
              ),
              Divider(
                height: 3.0,
              ),
              ListTile(
                onTap: () {
                  // setCurrentIndex(2);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Myporfile(
                                id: _notes[0].id,
                              )));
                },
                title: Text("My profile", style: TextStyle(fontSize: 17.0)),
                leading: Icon(Icons.contacts),
              ),
              Divider(
                height: 3.5,
              ),
              ListTile(
                onTap: () {
                  //setCurrentIndex(5);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => About(
                                id: _notes[0].id,
                              )));
                },
                title: Text("About", style: TextStyle(fontSize: 17.0)),
                leading: Icon(Icons.info),
              ),
              Divider(
                height: 3.5,
              ),
              ListTile(
                onTap: () {
                  //setCurrentIndex(5);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ContactInfo(
                                id: _notes[0].id,
                              )));
                },
                title: Text("Contact Info", style: TextStyle(fontSize: 17.0)),
                leading: Icon(Icons.contacts),
              ),
              Divider(
                height: 3.5,
              ),
              ListTile(
                onTap: () {
                  //setCurrentIndex(5);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Login()));
                },
                title: Text("Log Out", style: TextStyle(fontSize: 17.0)),
                leading: Icon(Icons.lock),
              ),
              Divider(
                height: 3.5,
              ),
            ],
          ),
        ),

        /* persistentFooterButtons: <Widget>[
          Text(
            "Contact us",
            style: TextStyle(color: Colors.redAccent, fontSize: 30.0),
          ),
          RaisedButton(
            elevation: 20.0,
            onPressed: () {},
            padding: EdgeInsets.all(0.0),
            //color: Colors.redAccent,

            child: Container(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "Call Now",
                style: TextStyle(color: Colors.white, fontSize: 30.0),
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: <Color>[
                  Colors.red,
                  Colors.redAccent,
                  Colors.deepOrangeAccent,
                ]),
              ),
            ),
            //Icon(Icons.call),
          ),
        ],
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                title: Text("Locate us",
                    style: TextStyle(
                        color: Colors.lightBlueAccent, fontSize: 20.0)),
                icon: Icon(
                  Icons.location_on,
                  color: Colors.redAccent,
                )),
            BottomNavigationBarItem(
                title: Text(
                  "Pick",
                  style:
                      TextStyle(color: Colors.lightBlueAccent, fontSize: 20.0),
                ),
                icon: Icon(
                  Icons.restore_from_trash,
                  color: Colors.green,
                )),
          ],
          onTap: (int index) {},
        ),*/
        //backgroundColor: Colors.blue,
      ),
    );
  }
}
