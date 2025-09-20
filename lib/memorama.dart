import 'package:flutter/material.dart';
import 'constantes.dart' as cons;
import 'cuadro.dart';
import 'dataCuadros.dart';
import 'dart:math';

class Memorama extends StatefulWidget {
  const Memorama({super.key});

  @override
  State<Memorama> createState() => _MemoramaState();
}

class _MemoramaState extends State<Memorama> {
  final random = Random();

  late List<Datacuadros> dataCuadros;
  bool game = false;
  late int columns = 3 + (random.nextDouble() * 5).toInt();
  late int rows = 3 + (random.nextDouble() * 5).toInt();
  var flag = [true, true, true, true, true, true, true];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            children: [
              Container(
                color: Colors.black,
                child: const Center(
                  child: Text(
                    "José Andrés Silva Bravo",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    )
                  )
                )
              ),
              if(game)
                Container(
                  color: Colors.white,
                  child: const Center(
                      child: Text(
                          "Juego terminado, ¡Felicidades!",
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          )
                      )
                    )
                  ),
              Container(
                width: 500,
                height: 500,
                child:
                  GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: columns,
                      childAspectRatio: 1,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10
                    ),
                    itemCount: columns*rows,
                    itemBuilder: (BuildContext context, int index) {
                      return Cuadro(
                        color: cons.colors[0],
                      );
                    }
                  )
              )
            ]
        )
    );
  }
}