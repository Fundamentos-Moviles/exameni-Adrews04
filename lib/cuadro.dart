import 'package:flutter/material.dart';
import 'dataCuadros.dart';

class Cuadro extends StatelessWidget {
  final Datacuadros datacuadro;
  final VoidCallback onTap;


  const Cuadro({Key? key, required this.datacuadro, required this.onTap}) : super(key : key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: datacuadro.active || datacuadro.paired? datacuadro.color : Colors.grey,
          borderRadius: BorderRadius.circular(8),
        )
      )
    );
  }
}

