import 'package:flutter/material.dart';

class GameButton{
  final id;
  String text;
  Color backGround;
  bool enabled;

  GameButton(
      {this.id, this.text = "", this.backGround = Colors.grey, this.enabled = true}
  );
}