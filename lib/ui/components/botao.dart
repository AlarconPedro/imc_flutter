import 'package:flutter/material.dart';

class Botao extends StatelessWidget {
  final VoidCallback? clique;
  final String texto;

  const Botao({this.clique, this.texto = 'Calcular', Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style:
          ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.amber)),
      onPressed: clique,
      child: Text(texto),
    );
  }
}
