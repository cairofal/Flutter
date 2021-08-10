import 'package:flutter/material.dart';

class BotaoCalcularIMC extends StatelessWidget {
  BotaoCalcularIMC({this.onPressed});

  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 60,
      child: RaisedButton(
        onPressed: () => onPressed(),
        child: Text(
          'Calcular',
          style: TextStyle(color: Colors.white),
        ),
        color: Colors.purple,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
      ),
    );
  }
}
