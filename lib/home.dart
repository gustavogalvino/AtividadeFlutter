import 'package:ac03/7maravilhas/maravilhas.dart';
import 'package:ac03/timer/timer.dart';
import 'package:ac03/devs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Atvidade Contínua 03"),
      ),

      body: Center(
        child: Container(
          padding: EdgeInsets.all(150),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              OutlinedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Maravilhas()),
                  );
                },
                icon: Icon(Icons.account_balance),
                label: Text('7 Maravilhas'),
              ),
              OutlinedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CountdownPage()),
                  );
                },
                icon: Icon(Icons.timer),
                label: Text('Cronômetro'),
              ),
              OutlinedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Devs()),
                  );
                },
                icon: Icon(Icons.supervisor_account),
                label: Text('Desenvolvedores'),
              )
            ],
          ),
        ),
      ),
    );
  }
}