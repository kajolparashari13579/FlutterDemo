import 'package:flutter/material.dart';

class Custombutton extends StatefulWidget {
  String label;
  VoidCallback onButtonPressed;
  Custombutton({super.key,required this.onButtonPressed, required this.label});

  @override
  State<Custombutton> createState() => _CustombuttonState();
}

class _CustombuttonState extends State<Custombutton> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Container(width: 150,
        padding: EdgeInsets.only(left: 10,bottom: 10,top: 10,right: 10),
        height: 60,
        decoration: const BoxDecoration(),
        child: ElevatedButton(onPressed: () {
          widget.onButtonPressed();
        },
          child: Text(widget.label),
        )));
  }
}
