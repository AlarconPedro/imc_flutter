import 'package:flutter/material.dart';
import 'package:imc_project/ui/components/components.dart';

class AlertPopUp extends StatelessWidget {
  final String? titulo, texto;

  const AlertPopUp({this.titulo, this.texto, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        titulo!,
        style: const TextStyle(fontSize: 22),
      ),
      content: Text(
        texto!,
        style: const TextStyle(fontSize: 20),
      ),
      actions: [
        Botao(
            clique: () {
              Navigator.pop(
                context,
              );
            },
            texto: 'OK'),
      ],
    );
  }
}
