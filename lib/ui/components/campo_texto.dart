import 'package:flutter/material.dart';

class CampoTexto extends StatelessWidget {
  final TextEditingController? controlador;
  final String? hinttext, labelText;
  final TextInputType teclado;

  const CampoTexto(
      {this.controlador,
      this.hinttext,
      this.labelText,
      this.teclado = TextInputType.number,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      child: TextField(
        controller: controlador,
        keyboardType: teclado,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              borderSide: BorderSide(
                width: 1,
              )),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide(width: 1, color: Colors.amber),
          ),
          hintText: hinttext,
          labelText: labelText,
          labelStyle: const TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
