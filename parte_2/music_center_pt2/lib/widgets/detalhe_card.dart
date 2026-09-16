import 'package:flutter/material.dart';
import '../models/instrumento.dart';
import '../models/instrumentoDeCorda.dart';

class DetalhePage extends StatelessWidget {
  final Instrumento instrumento;

  const DetalhePage({super.key, required this.instrumento});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(instrumento.nome),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Imagem ampliada no topo
            Image.network(
              instrumento.imagem,
              height: 250,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 250,
                  color: Colors.grey[300],
                  child: const Icon(Icons.music_note, size: 80, color: Colors.grey),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    instrumento.nome,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Marca: ${instrumento.marca}',
                    style: const TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'R\$ ${instrumento.valor.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  const Divider(height: 30),
                  // Dado exclusivo que não está na lista principal: ID
                  Text('Código do Item (ID): ${instrumento.id}', style: const TextStyle(fontSize: 16)),
                  const SizedBox(height: 8),
                  
                  // Verificação polimórfica: se for InstrumentoDeCorda, exibe as cordas
                  if (instrumento is InstrumentoDeCorda)
                    Text(
                      'Quantidade de Cordas: ${(instrumento as InstrumentoDeCorda).qtdCordas}',
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}