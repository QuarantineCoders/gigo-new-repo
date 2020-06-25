import 'package:flutter/material.dart';

import 'main.dart';

class About extends StatefulWidget {
  final String id;

  const About({Key key, this.id}) : super(key: key);
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
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
          "About",
          style: TextStyle(
            color: Colors.teal[700],
            fontSize: 23.0,
          ),
        ),
      ),
      body: Text(
        "We are people, who usually  make domestic wastage in our day today life. Most of the people do not have  the opportunity or chance to do recycling the wastes as the subject is irrelevant to them. So people get decomposable wastes( food wastage, vegetable wastages etc) and non decomposable wastes (like plastic and polythenes) accumulated  with them.The respective Municipality is the potential authority  to remove the wastes which is mandatory to them."
        "     This is a plan if the people give organic wastes to the municipality in a systematic way , the municipality would give a  certain amount of organic fertilizer to them. For the non decomposable things, if people give the wastages as eco bricks "
        "The people can afford to get certain money instead of that.",
        style: TextStyle(fontSize: 23.0),
      ),
    );
  }
}
