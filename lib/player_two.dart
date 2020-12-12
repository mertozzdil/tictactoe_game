import 'package:flutter/material.dart';
import 'package:tictactoe_game/custom_dialog.dart';
import 'package:tictactoe_game/game_button.dart';

class PlayerTwo extends StatefulWidget{
  @override
  _PlayerTwoState createState() => new _PlayerTwoState();
}

class _PlayerTwoState extends State<PlayerTwo>{
  List<GameButton> buttonList ;
  var player1;
  var player2;
  var activePlayer;

  @override
  void initState() {
    super.initState();
    buttonList = doInit();
  }

  List<GameButton> doInit(){
    player1 = new List();
    player2 = new List();
    activePlayer = 1;

    List<GameButton> gameButtons = [
      new GameButton(id: 1),
      new GameButton(id: 2),
      new GameButton(id: 3),
      new GameButton(id: 4),
      new GameButton(id: 5),
      new GameButton(id: 6),
      new GameButton(id: 7),
      new GameButton(id: 8),
      new GameButton(id: 9),
    ];
    return gameButtons;
  }

  void playGame(GameButton gameButton){
    setState(() {
      if(activePlayer == 1){
        gameButton.text = "X";
        gameButton.backGround = Colors.red;
        activePlayer = 2;
        player1.add(gameButton.id);
      }else {
        gameButton.text = "0";
        gameButton.backGround = Colors.black;
        activePlayer = 1;
        player2.add(gameButton.id);
      }
      gameButton.enabled = false;    //Butona tekrar tıklanmasının önüne geçer.
      checkWinner();
    });
  }

  void checkWinner(){
    var winner = -1;
    // row 1
    if(player1.contains(1) && player1.contains(1) && player1.contains(3)) {
      winner = 1;
    }if(player2.contains(1) && player2.contains(1) && player2.contains(3)) {
      winner = 2;
    }
    // row 2
    if(player1.contains(4) && player1.contains(5) && player1.contains(6)) {
      winner = 1;
    }if(player2.contains(4) && player2.contains(5) && player2.contains(6)) {
      winner = 2;
    }
    // row 3
    if(player1.contains(7) && player1.contains(8) && player1.contains(9)) {
      winner = 1;
    }if(player2.contains(7) && player2.contains(8) && player2.contains(9)) {
      winner = 2;
    }
    // col 1
    if(player1.contains(1) && player1.contains(4) && player1.contains(7)) {
      winner = 1;
    }if(player2.contains(1) && player2.contains(4) && player2.contains(7)) {
      winner = 2;
    }
    // col 2
    if(player1.contains(2) && player1.contains(5) && player1.contains(8)) {
      winner = 1;
    }if(player2.contains(2) && player2.contains(5) && player2.contains(8)) {
      winner = 2;
    }
    // col 3
    if(player1.contains(3) && player1.contains(6) && player1.contains(9)) {
      winner = 1;
    }if(player2.contains(3) && player2.contains(6) && player2.contains(9)) {
      winner = 2;
    }
    // diagonal
    if(player1.contains(1) && player1.contains(5) && player1.contains(9)) {
      winner = 1;
    }if(player2.contains(1) && player2.contains(5) && player2.contains(9)) {
      winner = 2;
    }
    if(player1.contains(3) && player1.contains(5) && player1.contains(7)) {
      winner = 1;
    }if(player2.contains(3) && player2.contains(5) && player2.contains(7)) {
      winner = 2;
    }

    if(winner != -1){
      if(winner == 1){
        showDialog(
            context: context,
            builder: (_) => CustomDialog("Player 1 Won", "Press the reset button to start again", resetGame)
        );
      }else{
        showDialog(
            context: context,
            builder: (_) => CustomDialog("Player 2 Won", "Press the reset button to start again", resetGame)
        );
      }
    }else if(winner == -1){
      if(buttonList.every((element) => element.text != "")){
        showDialog(
            context: context,
            builder: (_) => new CustomDialog("Game Tied", "Press the reset button to start again", resetGame)
        );
      }
    }
  }

  void resetGame(){
    if(Navigator.canPop(context)) Navigator.pop(context);   //if böyle de çalışıyormuş.
    setState(() {
      buttonList = doInit();
    });
  }

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(title: new Text("Tic Tac Toe"), centerTitle: true),
      body: new Column(
         children: <Widget>[
           new Expanded(
             child: new GridView.builder(
               gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                   crossAxisCount: 3,
                   childAspectRatio: 1.0,
                   crossAxisSpacing: 9.0,
                   mainAxisSpacing: 9.0
               ),
               padding: const EdgeInsets.all(10.0),
               itemCount: buttonList.length,
               itemBuilder: (context, index) => new SizedBox(
                 width: 100.0,
                 height: 100.0,
                 child: new RaisedButton(
                   padding: const EdgeInsets.all(8.0),
                   onPressed: buttonList[index].enabled?() => playGame(buttonList[index]) : null,
                   child: new Text(buttonList[index].text, style: new TextStyle(color: Colors.white, fontSize: 20.0),),
                   color: buttonList[index].backGround,
                   disabledColor: buttonList[index].backGround,
                 ),
               ),
             ),
           ),
           new RaisedButton(
             child: new Text("Reset", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300, fontSize: 25.0),),
             color: Colors.red,
             onPressed: resetGame,
           )
         ],
      ),
    );
  }
}