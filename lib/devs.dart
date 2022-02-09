import 'package:flutter/material.dart';


class Devs extends StatefulWidget {
  @override
  _DevsState createState() => _DevsState();
}

class _DevsState extends State<Devs> {

  final icon = Icon(Icons.person);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Desenvolvedores"),
      ),

      body: Center(
        child: Container(
          padding: EdgeInsets.all(80),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TextButton.icon(
                label: Text("Caio de Sá - RA: 1902935"),
                icon: icon,
                onPressed: () {},
              ),
              TextButton.icon(
                label: Text("Felix dos Santos - RA: 1902906"),
                icon: icon,
                onPressed: () {},
              ),
              TextButton.icon(
                label: Text("Gustavo Souza Galvino - RA: 1904026"),
                icon: icon,
                onPressed: () {},
              ),
              TextButton.icon(
                label: Text("Jordan Marques de Souza - RA: 1904016"),
                icon: icon,
                onPressed: () {},
              ),
              TextButton.icon(
                label: Text("Nicholas Miranda Bastos - RA: 1904018"),
                icon: icon,
                onPressed: () {},
              ),
              TextButton.icon(
                label: Text("Richard de Oliveira Lopes - RA: 1902936"),
                icon: icon,
                onPressed: () {},
              ),
              new Container(
                padding: EdgeInsets.only(top: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    OutlinedButton.icon(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back),
                      label: Text('Voltar'),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}