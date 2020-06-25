import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'myprofile.dart';

class editProfile extends StatefulWidget {
  final String id;
  final String houseno;
  final String name;
  final String city;
  final String street;
  final String contactno;

  const editProfile(
      {Key key,
      this.id,
      this.houseno,
      this.name,
      this.city,
      this.street,
      this.contactno})
      : super(key: key);
  @override
  _editProfileState createState() => _editProfileState();
}

class _editProfileState extends State<editProfile> {
  String _valueStreet;
  String _valueCity;

  final txtname = new TextEditingController();
  final txthouseno = new TextEditingController();
  final txtcontactno = new TextEditingController();

  Future _updateDetails(String name, String houseno, String street, String city,
      String contactno) async {
    var url = "http://192.168.1.100/GIGOApp/editprofile.php";
    //var url = "https://flutterthanis.000webhostapp.com/updateData.php";
    final response = await http.post(url, body: {
      "name": name,
      "house_no": houseno,
      "street": street,
      "city": city,
      "contact_no": contactno,
      "id": widget.id
    });
    var res = response.body;
    if (res == "true") {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Myporfile(
                    id: widget.id,
                  )));
    } else {
      print("Error : new" + res);
    }
  }

  @override
  void dispose() {
    txtname.dispose();
    txthouseno.dispose();
    txtcontactno.dispose();
    super.dispose();
  }

  void initState() {
    txtname.text = widget.name;
    txthouseno.text = widget.houseno;
    _valueCity = widget.city;
    _valueStreet = widget.street;
    txtcontactno.text = widget.contactno;
    super.initState();
  }

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
                    builder: (context) => Myporfile(
                          id: widget.id,
                        )));
          },
        ),
        title: new Text(
          "Edit profile",
          style: TextStyle(
            color: Colors.teal[700],
            fontSize: 23.0,
          ),
        ),
      ),
      body: new ListView(
        shrinkWrap: true,
        children: <Widget>[
          new Column(
            children: <Widget>[
              SizedBox(
                height: 50.0,
              ),
              Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(left: 13.0, right: 45.0),
                      child: TextFormField(
                        style:
                            TextStyle(color: Colors.blueGrey, fontSize: 20.0),
                        decoration: InputDecoration(
                          labelText: 'NAME',
                          labelStyle: TextStyle(fontSize: 20.0),
                          icon: Icon(
                            Icons.account_circle,
                            color: Colors.blueGrey,
                          ),
                          hintText: "Full name",
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                        controller: txtname,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 13.0, right: 45.0),
                      child: TextFormField(
                        style:
                            TextStyle(color: Colors.blueGrey, fontSize: 20.0),
                        decoration: InputDecoration(
                          labelText: 'HOUSE NO',
                          labelStyle: TextStyle(fontSize: 20.0),
                          icon: Icon(
                            Icons.home,
                            color: Colors.blueGrey,
                          ),
                          hintText: "House No",
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                        controller: txthouseno,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 13.0, right: 45.0),
                      child: TextFormField(
                        style:
                            TextStyle(color: Colors.blueGrey, fontSize: 20.0),
                        decoration: InputDecoration(
                          labelText: 'CONTACT NO',
                          labelStyle: TextStyle(fontSize: 16.0),
                          icon: Icon(
                            Icons.phone,
                            color: Colors.blueGrey,
                          ),
                          hintText: "PHONE",
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                        controller: txtcontactno,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 50.0, right: 45.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "STREET",
                            style: TextStyle(
                                fontSize: 16.0, color: Colors.black54),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          DropdownButton<String>(
                            style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 20.0,
                            ),
                            items: [
                              DropdownMenuItem<String>(
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      'St. Josephvaz lane',
                                    ),
                                  ],
                                ),
                                value: 'St. Josephvaz lane',
                              ),
                              DropdownMenuItem<String>(
                                child: Row(
                                  children: <Widget>[
                                    Text('St. Mothertheresa lane'),
                                  ],
                                ),
                                value: 'St. Mothertheresa lane',
                              ),
                              DropdownMenuItem<String>(
                                child: Row(
                                  children: <Widget>[
                                    Text('Horowapothana Road'),
                                  ],
                                ),
                                value: 'Horowapothana Road',
                              ),
                              DropdownMenuItem<String>(
                                child: Row(
                                  children: <Widget>[
                                    Text('Rani mill Road'),
                                  ],
                                ),
                                value: 'Rani mill Road',
                              ),
                              DropdownMenuItem<String>(
                                child: Row(
                                  children: <Widget>[
                                    Text('Station Road'),
                                  ],
                                ),
                                value: 'Station Road',
                              ),
                              DropdownMenuItem<String>(
                                child: Row(
                                  children: <Widget>[
                                    Text('Mannar Road'),
                                  ],
                                ),
                                value: 'Mannar Road',
                              ),
                              DropdownMenuItem<String>(
                                child: Row(
                                  children: <Widget>[
                                    Text('Vairavar Kovil Road'),
                                  ],
                                ),
                                value: 'Vairavar Kovil Road',
                              ),
                              DropdownMenuItem<String>(
                                child: Row(
                                  children: <Widget>[
                                    Text('Mill Road'),
                                  ],
                                ),
                                value: 'Mill Road',
                              ),
                              DropdownMenuItem<String>(
                                child: Row(
                                  children: <Widget>[
                                    Text('Kanthasamy kovil Road'),
                                  ],
                                ),
                                value: 'Kanthasamy kovil Road',
                              ),
                              DropdownMenuItem<String>(
                                child: Row(
                                  children: <Widget>[
                                    Text('Kandy Road'),
                                  ],
                                ),
                                value: 'Kandy Road',
                              ),
                              DropdownMenuItem<String>(
                                child: Row(
                                  children: <Widget>[
                                    Text('Jaffna Road'),
                                  ],
                                ),
                                value: 'Jaffna Road',
                              ),
                              DropdownMenuItem<String>(
                                child: Row(
                                  children: <Widget>[
                                    Text('Park Road'),
                                  ],
                                ),
                                value: 'Park Road',
                              ),
                              DropdownMenuItem<String>(
                                child: Row(
                                  children: <Widget>[
                                    Text('Bazar street'),
                                  ],
                                ),
                                value: 'Bazar street',
                              ),
                              DropdownMenuItem<String>(
                                child: Row(
                                  children: <Widget>[
                                    Text('Goodshed'),
                                  ],
                                ),
                                value: 'Goodshed',
                              ),
                              DropdownMenuItem<String>(
                                child: Row(
                                  children: <Widget>[
                                    Text('Inner circular Road'),
                                  ],
                                ),
                                value: 'Inner circular Road',
                              ),
                              DropdownMenuItem<String>(
                                child: Row(
                                  children: <Widget>[
                                    Text('Outer circular Road'),
                                  ],
                                ),
                                value: 'Outer circular Road',
                              ),
                              DropdownMenuItem<String>(
                                child: Row(
                                  children: <Widget>[
                                    Text('Kurmankaadu junction'),
                                  ],
                                ),
                                value: 'Kurmankaadu junction',
                              ),
                              DropdownMenuItem<String>(
                                child: Row(
                                  children: <Widget>[
                                    Text('1st lane'),
                                  ],
                                ),
                                value: '1st lane',
                              ),
                              DropdownMenuItem<String>(
                                child: Row(
                                  children: <Widget>[
                                    Text('2nd lane'),
                                  ],
                                ),
                                value: '2nd lane',
                              ),
                            ],
                            isExpanded: false,
                            onChanged: (String value) {
                              setState(() {
                                _valueStreet = value;
                              });
                            },
                            hint: Text(
                              'Street',
                              style: TextStyle(color: Colors.white),
                            ),
                            value: _valueStreet,
                            underline: Container(
                              decoration: const BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                color: Colors.black38,
                              ))),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 50.0, right: 45.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text("CITY",
                              style: TextStyle(
                                  fontSize: 16.0, color: Colors.black54)),
                          SizedBox(
                            width: 30.0,
                          ),
                          DropdownButton<String>(
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.blueGrey,
                            ),
                            items: [
                              DropdownMenuItem<String>(
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      'Rambaikulam',
                                    ),
                                  ],
                                ),
                                value: 'Rambaikulam',
                              ),
                              DropdownMenuItem<String>(
                                child: Row(
                                  children: <Widget>[
                                    Text('Vairavapuliyankulam'),
                                  ],
                                ),
                                value: 'Vairavapuliyankulam',
                              ),
                              DropdownMenuItem<String>(
                                child: Row(
                                  children: <Widget>[
                                    Text('Vavuniya Town'),
                                  ],
                                ),
                                value: 'Vavuniya Town',
                              ),
                              DropdownMenuItem<String>(
                                child: Row(
                                  children: <Widget>[
                                    Text('Thonikal'),
                                  ],
                                ),
                                value: 'Thonikal',
                              ),
                              DropdownMenuItem<String>(
                                child: Row(
                                  children: <Widget>[
                                    Text('Kurmankaadu'),
                                  ],
                                ),
                                value: 'Kurmankaadu',
                              ),
                            ],
                            isExpanded: false,
                            onChanged: (String value) {
                              setState(() {
                                _valueCity = value;
                              });
                            },
                            hint: Text(
                              'City',
                              style: TextStyle(color: Colors.white),
                            ),
                            value: _valueCity,
                            underline: Container(
                              decoration: const BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                color: Colors.black38,
                              ))),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                  ],
                ),
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
                        setState(() {
                          _updateDetails(
                            txtname.text,
                            txthouseno.text,
                            _valueStreet,
                            _valueCity,
                            txtcontactno.text,
                          );
                        });
                      },
                      child: Text(
                        "UPDATE PROFILE",
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      )),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
