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
  late int columns = 3 + (random.nextDouble() * 5).toInt();
  late int rows = 3 + (random.nextDouble() * 5).toInt();
  var flag = [true, true, true, true, true, true, true];
  late List<Color> colors;
  late List<Datacuadros> cuadros;

  @override
  void initState(){
    super.initState();
      colors = [];

      for(int i = 0; i < columns*rows/2; i++){
        colors.add(cons.colors[i]);
        colors.add(cons.colors[i]);
      }

      colors.shuffle();

      cuadros = List.generate(columns*rows, (index){
        return Datacuadros(
          color: colors[index],
          index: index ~/2,
        );
      });
  }

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
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: columns,
                      childAspectRatio: 1,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10
                    ),
                    itemCount: columns*rows,
                    itemBuilder: (BuildContext context, int index) {
                      return Cuadro(
                        datacuadro: cuadros[index],
                        onTap: (){
                          setState((){
                            cuadros[index].active = !cuadros[index].active;
                          });
                        }
                      );
                    }
                  )
              )
            ]
        )
    );
  }
}