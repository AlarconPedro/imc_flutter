import 'package:flutter/material.dart';
import 'package:imc_project/ui/components/components.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class ContatoPage extends StatefulWidget {
  const ContatoPage({Key? key}) : super(key: key);

  @override
  State<ContatoPage> createState() => _ContatoPageState();
}

class _ContatoPageState extends State<ContatoPage> {
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _assuntoController = TextEditingController();
  final _mensagemController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          CampoTexto(
            controlador: _nomeController,
            hinttext: "Digite seu nome",
            teclado: TextInputType.name,
            labelText: 'Nome',
          ),
          CampoTexto(
            controlador: _emailController,
            labelText: "E-mail",
            teclado: TextInputType.emailAddress,
            hinttext: "@ ",
          ),
          CampoTexto(
            controlador: _assuntoController,
            labelText: "Assunto do e-mail",
            teclado: TextInputType.name,
            hinttext: 'Assunto..',
          ),
          CampoTexto(
            controlador: _mensagemController,
            hinttext: "Mensagem do e-mail",
            labelText: 'Mensagem',
            teclado: TextInputType.multiline,
          ),
          Botao(texto: "Enviar", clique: enviarEmail),
        ],
      ),
    );
  }

  void enviarEmail() async {
    const usuario = "pedrohenriquealarcon@gmail.com";
    const senha = "pjcalarcon1";

    final smtpServer = gmail(usuario, senha);

    final mensagem = Message()
      ..from = const Address(usuario, "Contato")
      ..recipients.add(usuario)
      ..subject = _assuntoController.text
      ..text = """Nome: ${_nomeController.text},
          E-mail: ${_emailController.text},
          Mensagem: ${_mensagemController.text}""";

    await send(mensagem, smtpServer);

    setState(() {
      _nomeController.clear();
      _emailController.clear();
      _assuntoController.clear();
      _mensagemController.clear();
    });
  }
}
