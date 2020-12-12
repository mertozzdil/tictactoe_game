import 'package:flutter/material.dart';
import 'package:tictactoe_game/player_one.dart';
import 'package:tictactoe_game/player_two.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Tic Tac Toe"), centerTitle: true),

      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new RaisedButton(
                color: Colors.red,
                child: new Text("Single", style: new TextStyle(color: Colors.white),),
                onPressed: () => Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context) => PlayerOne()))),
            new RaisedButton(
                color: Colors.red,
                child: new Text("Double", style: new TextStyle(color: Colors.white)),
                onPressed: () => Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context) => PlayerTwo())))
          ],
        ),
      ),
    );
  }
}
