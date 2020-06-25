import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tutorjoes_app/Signup.dart';
import 'package:tutorjoes_app/log.dart';
import 'package:tutorjoes_app/main.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(new MaterialApp(
    home: new Login(),
    debugShowCheckedModeBanner: false,
  ));
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  List<Log> _notes = List<Log>();

  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final txtPassword = new TextEditingController();
  final txtEmail = new TextEditingController();
  String msg = '';
  Future<List<Log>> _login(String password, String email) async {
    var url = "http://192.168.1.100/GIGOApp/login.php";
    // var url = "https://flutterthanis.000webhostapp.com/addData.php";
    final response =
        await http.post(url, body: {"password": password, "email": email});
    //final response1 = await http.get(url);
    var user = json.decode(response.body);
    var notes = List<Log>();
    if (response.statusCode == 200) {
      var notesJson = json.decode(response.body);
      for (var noteJson in notesJson) {
        notes.add(Log.fromJson(noteJson));
      }
    }
    // print(dataRecevied.total);

    if (user.length == 0) {
      setState(() {
        msg = "Login Fail";
      });
    } else {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MyAPP(
                    id: notes[0].id,
                  )));
      //  Navigator.push(context,
      // MaterialPageRoute(builder: (context) => MyAPP(id: user.cus_id)));
      return notes;
    }
  }

  @override
  /* void initState() {
    _login(txtPassword.text, txtEmail.text).then((value) {
      setState(() {
        _notes.addAll(value);
      });
    });
    super.initState();
  }*/

  void dispose() {
    txtPassword.dispose();
    txtEmail.dispose();
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
            SizedBox(
              height: 40.0,
            ),
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
                        return "Please enter Email Id";
                      }
                    },
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.account_circle,
                        color: Colors.white,
                      ),
                      hintText: "Email Id",
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                    controller: txtEmail,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    style: TextStyle(color: Colors.blueGrey, fontSize: 20.0),
                    obscureText: true,
                    // ignore: missing_return
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Please enter password";
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
                    controller: txtPassword,
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
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
                      } else {
                        scaffoldKey.currentState.showSnackBar(SnackBar(
                          content: Text("Error in form"),
                        ));
                      }
                      setState(() {
                        _login(txtPassword.text, txtEmail.text);
                      });
                      /* Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MyAPP()));*/
                    },
                    child: Text(
                      "LOGIN",
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
              height: 5.0,
            ),
            Row(
              children: <Widget>[
                Container(
                  child: Text(
                    "Not on GIGO yet? ",
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
                      "Sign up",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 19.0,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          decorationThickness: 2.0),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignUp()));
                    },
                    //splashColor: Colors.blue,
                    disabledColor: Colors.lightBlue,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 120.0,
            ),
          ],
        ),
      ),
    );
  }
}
