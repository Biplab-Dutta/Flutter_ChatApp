import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton({this.colour, this.onPressing, this.stringValue});
  final colour, onPressing, stringValue;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        color: colour,
        borderRadius: BorderRadius.circular(30.0),
        elevation: 5.0,
        child: MaterialButton(
          onPressed: onPressing,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            stringValue,
          ),
        ),
      ),
    );
  }
}
