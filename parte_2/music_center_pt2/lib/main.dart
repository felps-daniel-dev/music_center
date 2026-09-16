import 'package:flutter/material.dart';
import 'package:music_center/models/exposicao.dart';
import 'package:music_center/widgets/card_instrumento.dart';
import 'models/instrumentoDeCorda.dart';

void main() {
  Exposicao exposicao = Exposicao();
  /*exposicao.getInstrumentos.forEach(
    (i) => print('Id: ${i.id} Nome: ${i.nome}'),
  );*/

  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final InstrumentoDeCorda inst = InstrumentoDeCorda(
    id: 1,
    nome: 'Violão',
    valor: 980.00,
    marca: 'Gianini',
    imagem:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1oNV73r35Yb6zyVq9CtC6wxy0gH_HZdYYorVQEXMzBQ&s',
    qtdCordas: 6,
  );
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors
            .grey[100], // Fundo levemente cinza para destacar o card branco
        appBar: AppBar(title: const Text('Teste do Card')),
        body: ListView(
          children: [
            CardInstrumento(instrumento: inst),
            CardInstrumento(instrumento: inst),
            CardInstrumento(instrumento: inst),
            CardInstrumento(instrumento: inst),
            CardInstrumento(instrumento: inst),
          ],
        ),
      ),
    );
  }
}
