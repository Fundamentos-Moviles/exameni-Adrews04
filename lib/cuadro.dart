import 'package:flutter/material.dart';
import 'dataCuadros.dart';

class Cuadro extends StatefulWidget {
  final Datacuadros datacuadro;
  final VoidCallback onTap;


  Cuadro({Key? key, required this.datacuadro, required this.onTap}) : super(key : key);

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
          color: active ? widget.datacuadro.color : Colors.grey,
          borderRadius: BorderRadius.circular(8),
        )
      )
    );
  }
}
