import 'package:flutter/material.dart';
import 'package:imc_project/ui/components/components.dart';
import 'package:imc_project/ui/pages/pages.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _pesoController = TextEditingController();
  final _alturaController = TextEditingController();

  String nomeApp = 'IMC';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(nomeApp),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Column(
        children: [
          CampoTexto(
            controlador: _pesoController,
            hinttext: 'Digite seu Peso:',
            labelText: 'Peso',
          ),
          CampoTexto(
              controlador: _alturaController,
              hinttext: 'Digite sua Altura:',
              labelText: 'Altura'),
          Botao(clique: _clique, texto: 'Calcular'),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.amber,
              ),
              child: Text('Contato'),
            ),
            ListTile(
              title: const Text('Contato'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ContatoPage()));
              },
            ),
            ListTile(
              title: Text(nomeApp),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomePage()));
              },
            ),
          ],
        ),
      ),
    );
  }

  void _clique() {
    double peso =
        double.tryParse(_pesoController.text.replaceAll(',', '.')) ?? 0;
    double altura =
        double.tryParse(_alturaController.text.replaceAll(',', '.')) ?? 0;

    showDialog(
        context: context,
        builder: (context) {
          return AlertPopUp(
            titulo: nomeApp,
            texto: 'o seu IMC é ${_calcularIMC(peso, altura)}',
          );
        });
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
} s
