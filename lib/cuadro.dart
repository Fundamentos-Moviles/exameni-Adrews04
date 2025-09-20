import 'package:flutter/material.dart';

class Cuadro extends StatefulWidget {
  final Color color;

  Cuadro({Key? key, required this.color}) : super(key : key);

  @override
  _CuadroState createState() => _CuadroState();
}

class _CuadroState extends State<Cuadro> {

  bool active = false;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState((){
          active = !active;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: active ? widget.color : Colors.grey,
          borderRadius: BorderRadius.circular(8),
        )
      )
    );
  }
}
