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
  bool game = false;
  late int columns = (2 + (random.nextDouble() * 2).toInt()) * 2;
  late int rows = 2 + (random.nextDouble() * 5).toInt();
  var turn = false;
  late List<Color> colors;
  late List<Datacuadros> cuadros;
  late int remainingPairs = (columns * rows / 2).toInt();
  int? firstSquare;
  int? secondSquare;

  void startGame() {
    late int columns = (2 + (random.nextDouble() * 2).toInt()) * 2;
    late int rows = 2 + (random.nextDouble() * 5).toInt();

    game = false;
    turn = false;
    remainingPairs = (columns * rows / 2).toInt();
    firstSquare = null;
    secondSquare = null;

    colors.clear();
    for (int i = 0; i < columns * rows / 2; i++) {
      colors.add(cons.colors[i]);
      colors.add(cons.colors[i]);
    }
    colors.shuffle();

    cuadros = List.generate(columns * rows, (index) {
      return Datacuadros(
        color: colors[index],
        index: index ~/ 2,
      );
    });

    setState(() {});
  }

  void resetearTurno() {
    firstSquare = null;
    secondSquare = null;
    turn = false;

    if (remainingPairs == 0) {
      setState(() {
        game = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    colors = [];

    for (int i = 0; i < columns * rows / 2; i++) {
      colors.add(cons.colors[i]);
      colors.add(cons.colors[i]);
    }

    colors.shuffle();

    cuadros = List.generate(columns * rows, (index) {
      return Datacuadros(
        color: colors[index],
        index: index ~/ 2,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final double squareSize = 500 / columns;
    final double childAspectRatio = squareSize / squareSize;
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
                ),
              ),
            ),
          ),
          if (game)
            Container(
              color: Colors.white,
              child: const Center(
                child: Text(
                  "Juego terminado, ¡Felicidades!",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final gridWidth = constraints.maxWidth;
                  final gridHeight = constraints.maxHeight;
                  final squareSize = (gridWidth - (columns - 1) * 10) / columns;
                  final childAspectRatio = squareSize / ((gridHeight - (rows - 1) * 10) / rows);

                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: columns,
                      childAspectRatio: childAspectRatio,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: columns * rows,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Cuadro(
                        datacuadro: cuadros[index],
                        onTap: () {
                          setState(() {
                            if (turn == true || cuadros[index].paired || cuadros[index].active) {
                              return;
                            }

                            if (firstSquare == null) {
                              firstSquare = index;
                              cuadros[index].active = true;
                            } else {
                              secondSquare = index;
                              cuadros[index].active = true;
                              turn = true;
                            }

                            if (firstSquare != null && secondSquare != null) {
                              if (cuadros[firstSquare!].color == cuadros[secondSquare!].color) {
                                remainingPairs--;
                                cuadros[firstSquare!].paired = true;
                                cuadros[secondSquare!].paired = true;
                                resetearTurno();
                              } else {
                                Future.delayed(
                                  const Duration(milliseconds: 500),
                                      () {
                                    setState(() {
                                      cuadros[firstSquare!].active = false;
                                      cuadros[secondSquare!].active = false;
                                    });
                                    resetearTurno();
                                  },
                                );
                              }
                            }
                          });
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: ElevatedButton(onPressed: (){startGame();},
              child: const Text('Reiniciar Juego'),
            )
          )
        ],
      ),
    );
  }
}