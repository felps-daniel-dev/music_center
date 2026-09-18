import 'package:flutter/material.dart';
import 'models/instrumento.dart';
import 'models/instrumentoDeCorda.dart';
import 'models/exposicao.dart';
import 'widgets/card_instrumento.dart';
import 'widgets/detalhe_card.dart';
import 'widgets/cadastro.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Music Center',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Exposicao exposicao = Exposicao();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Exercício 5: Scaffold com AppBar
      appBar: AppBar(
        title: const Text('Music Center - Exposição'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      // Exercício 5: Column com alinhamentos definidos explicitamente
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Exercício 4 e 5: Total exibido no topo usando o getter calculado
          Container(
            padding: const EdgeInsets.all(16.0),
            color: Colors.indigo.shade50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Itens: ${exposicao.getInstrumentos.length}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Total: R\$ ${exposicao.valorTotalExpostos.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                  ),
                ),
              ],
            ),
          ),

          // Exercício 5 e 7: Expanded envolve a ListView para evitar o erro de altura ilimitada
          Expanded(
            child: ListView.builder(
              itemCount: exposicao.getInstrumentos.length,
              itemBuilder: (context, index) {
                final item = exposicao.getInstrumentos[index];

                // Exercício 8: Toque no item faz a navegação para a DetalhePage
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => DetalhePage(instrumento: item),
                      ),
                    );
                  },
                  child: CardInstrumento(instrumento: item),
                );
              },
            ),
          ),
        ],
      ),

      // Botão Flutuante para ir à Tela de Cadastro ex 9 e 10
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        onPressed: () async {
          final novoItem = await Navigator.of(context).push<Instrumento>(
            MaterialPageRoute(builder: (context) => const CadastroPage()),
          );

          if (novoItem != null && novoItem is InstrumentoDeCorda) {
            setState(() {
              exposicao.adicionarInstrumento(novoItem);
            });
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
