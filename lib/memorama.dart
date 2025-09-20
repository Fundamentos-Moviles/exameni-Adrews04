import 'package:flutter/material.dart';
import 'constantes.dart' as cons;

class Memorama extends StatefulWidget {
  const Memorama({super.key});

  @override
  State<Memorama> createState() => _MemoramaState();
}

class _MemoramaState extends State<Memorama> {
  @override
  bool game = false;
  final int columns = 2;
  final int rows = 2;
  var flag = [true, true, true, true, true, true, true];
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
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
            ]
        )
    );
  }
}