import 'package:flutter/material.dart';
import 'package:tutorjoes_app/login.dart';
import 'main.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: new SignUp(),
  ));
}

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  String _valueStreet;
  String _valueCity;

  final txtfirstname = new TextEditingController();
  final txtlastname = new TextEditingController();
  final txtpassword = new TextEditingController();
  final txthouseno = new TextEditingController();
  final txtEmail = new TextEditingController();
  final txtcontactno = new TextEditingController();

  Future _saveDetails(
      String firstname,
      String lastname,
      String password,
      String houseno,
      String street,
      String city,
      String email,
      String contactno) async {
    var url = "http://192.168.1.100/GIGOApp/signin.php";
    //var url = "https://flutterthanis.000webhostapp.com/addData.php";
    final response = await http.post(url, body: {
      'firstname': firstname,
      'lastname': lastname,
      'street': street,
      'city': city,
      'house_no': houseno,
      'password': password,
      "email": email,
      'contact_no': contactno,
    });
    var res = response.body;
    if (res == 'truetruetrue') {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
    } else {
      print("Error new" + res);
    }
  }

  @override
  void dispose() {
    txtfirstname.dispose();
    txtEmail.dispose();
    txtlastname.dispose();
    txtpassword.dispose();
    txthouseno.dispose();
    txtcontactno.dispose();

    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: new Container(
        padding: EdgeInsets.all(40.0),
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.1, 0.4, 0.9],
            colors: [
              Colors.tealAccent[700],
              Colors.tealAccent[400],
              Colors.tealAccent[200],
            ],
          ),
        ),
        child: new ListView(
          shrinkWrap: true,
          children: <Widget>[
            Image.asset(
              "assets/gigo_logo2.png",
              height: 80.0,
              color: Colors.white,
            ),
            SizedBox(
              height: 50.0,
            ),
            Form(
              key: formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    style: TextStyle(color: Colors.blueGrey, fontSize: 20.0),
                    // ignore: missing_return
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Please enter Firstname";
                      }
                    },
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.account_circle,
                        color: Colors.white,
                      ),
                      hintText: "Firstname",
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                    controller: txtfirstname,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    style: TextStyle(color: Colors.blueGrey, fontSize: 20.0),
                    // ignore: missing_return
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Please enter LastName";
                      }
                    },
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.account_circle,
                        color: Colors.white,
                      ),
                      hintText: "Lastname",
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                    controller: txtlastname,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    style: TextStyle(color: Colors.blueGrey, fontSize: 20.0),
                    // ignore: missing_return
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Please enter Email";
                      }
                    },
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.email,
                        color: Colors.white,
                      ),
                      hintText: "Email",
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                    controller: txtEmail,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    style: TextStyle(color: Colors.blueGrey, fontSize: 20.0),
                    // ignore: missing_return
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Please enter House no";
                      }
                    },
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.home,
                        color: Colors.white,
                      ),
                      hintText: "House No",
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                    controller: txthouseno,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        width: 10.0,
                      ),
                      DropdownButton<String>(
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
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        width: 10.0,
                      ),
                      DropdownButton<String>(
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
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    style: TextStyle(color: Colors.blueGrey, fontSize: 20.0),
                    // ignore: missing_return
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Please enter Contact No";
                      }
                    },
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.email,
                        color: Colors.white,
                      ),
                      hintText: "Contact No",
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                    controller: txtcontactno,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    obscureText: true,
                    style: TextStyle(color: Colors.blueGrey, fontSize: 20.0),
                    // ignore: missing_return
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Please enter Password";
                      }
                    },
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.lock,
                        color: Colors.white,
                      ),
                      hintText: "Password",
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                    controller: txtpassword,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 40.0, right: 40.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.1, 0.4, 0.7, 0.9],
                  colors: [
                    Colors.tealAccent[700],
                    Colors.tealAccent[400],
                    Colors.tealAccent[200],
                    Colors.tealAccent[200],
                  ],
                ),
              ),
              child: ButtonTheme(
                buttonColor: Colors.white10,
                height: 50.0,
                minWidth: double.infinity,
                child: RaisedButton(
                    onPressed: () {
                      if (formKey.currentState.validate()) {
                        setState(() {
                          _saveDetails(
                              txtfirstname.text,
                              txtlastname.text,
                              txtpassword.text,
                              txthouseno.text,
                              _valueStreet,
                              _valueCity,
                              txtEmail.text,
                              txtcontactno.text);
                        });
                      } else {
                        scaffoldKey.currentState.showSnackBar(SnackBar(
                          content: Text("Error in form"),
                        ));
                      }
                      /* Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MyAPP()));*/
                    },
                    child: Text(
                      "SIGN UP",
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    )),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              "By continuing, you agree to GIGO's",
              style: TextStyle(color: Colors.white, fontSize: 17.0),
            ),
            Text(
              "Terms of Service, Privacy Policy.",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold),
            ),
            Divider(
              height: 3.0,
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              children: <Widget>[
                Container(
                  child: Text(
                    "Already on GIGO ? ",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 19.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  child: FlatButton(
                    //color: Colors.lightBlue,
                    padding: EdgeInsets.all(15.0),
                    textColor: Colors.white,
                    child: Text(
                      "Log in",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 19.0,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          decorationThickness: 2.0),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Login()));
                    },
                    //splashColor: Colors.blue,
                    disabledColor: Colors.lightBlue,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
