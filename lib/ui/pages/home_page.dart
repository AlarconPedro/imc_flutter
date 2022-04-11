import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _pesoController = TextEditingController();
  final _alturaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IMC'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Column(
        children: [
          _criarCampoTexto(_pesoController, 'Peso', 'Digite seu Peso:'),
          _criarCampoTexto(_alturaController, 'Altura', 'Digite sua Altura:'),
          _criarBotao('Calcular', _clique),
        ],
      ),
    );
  }

  Widget _criarCampoTexto(
      TextEditingController controlador, String labelText, prefixTeste) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      child: TextField(
        controller: controlador,
        keyboardType: TextInputType.number,
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
          prefixText: prefixTeste,
          labelText: labelText,
          labelStyle: const TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _criarBotao(String texto, VoidCallback clique) {
    return ElevatedButton(
      style:
          ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.amber)),
      onPressed: clique,
      child: Text(texto),
    );
  }

  void _clique() {
    double peso =
        double.tryParse(_pesoController.text.replaceAll(',', '.')) ?? 0;
    double altura =
        double.tryParse(_alturaController.text.replaceAll(',', '.')) ?? 0;

    _mostrarMensagem('o seu IMC é ${_calcularIMC(peso, altura)}', 'IMC');
  }

  String _calcularIMC(double valorPeso, valorAltura) {
    double resultado = (valorPeso / (valorAltura * valorAltura));
    String imc = '';

    resultado <= 16.9
        ? imc = 'Muito abaixo do peso ideal !'
        : resultado <= 18.4
            ? imc = 'Abaixo do peso ideal !'
            : resultado <= 24.9
                ? imc = 'Peso normal !'
                : resultado <= 29.9
                    ? imc = 'Acima do peso !'
                    : resultado <= 34.9
                        ? imc = 'Obesidade grau I !'
                        : resultado <= 40.0
                            ? imc = 'Obesidade grau II !'
                            : resultado >= 40.0
                                ? imc = 'Obesidade grau III !'
                                : 'IMC Alienígena';

    return imc;
  }

  void _mostrarMensagem(String texto, titulo) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              titulo,
              style: const TextStyle(fontSize: 22),
            ),
            content: Text(
              texto,
              style: const TextStyle(fontSize: 20),
            ),
            actions: [
              _criarBotao('OK', () {
                Navigator.pop(context);
              }),
            ],
          );
        });
  }
}
