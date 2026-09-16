import 'package:flutter/material.dart';
import '../models/instrumento.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  // Exercício 9: Três TextEditingControllers para os três campos da tela
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _marcaController = TextEditingController();
  final TextEditingController _valorController = TextEditingController();

  @override
  void dispose() {
    // Descarta os controladores para não vazar memória (requisito citado no trabalho)
    _nomeController.dispose();
    _marcaController.dispose();
    _valorController.dispose();
    super.dispose();
  }

  void _salvar() {
    final String nome = _nomeController.text;
    final String marca = _marcaController.text;
    final double? valor = double.tryParse(_valorController.text);

    // Validação simples
    if (nome.isEmpty || marca.isEmpty || valor == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Preencha todos os campos corretamente!')),
      );
      return;
    }

    // Instancia o novo instrumento usando valores padrão para os demais atributos
    final novoInstrumento = Instrumento(
      id: DateTime.now().millisecondsSinceEpoch, // Gera um ID dinâmico
      nome: nome,
      marca: marca,
      valor: valor,
      imagem: 'https://images.unsplash.com/photo-1511671782779-c97d3d27a1d4?w=300', // URL padrão
    );

    // Devolve o objeto novo para a HomePage via Navigator.pop
    Navigator.of(context).pop(novoInstrumento);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastrar Instrumento'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Campo 1: Nome
            TextFormField(
              controller: _nomeController,
              decoration: InputDecoration(
                labelText: 'Nome do Instrumento',
                prefixIcon: const Icon(Icons.music_note),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            const SizedBox(height: 12),
            
            // Campo 2: Marca
            TextFormField(
              controller: _marcaController,
              decoration: InputDecoration(
                labelText: 'Marca',
                prefixIcon: const Icon(Icons.branding_watermark),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            const SizedBox(height: 12),

            // Campo 3: Valor
            TextFormField(
              controller: _valorController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'Preço (R\$)',
                prefixIcon: const Icon(Icons.attach_money),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            const SizedBox(height: 20),

            // Botão de Confirmação
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _salvar,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text('Confirmar Cadastro', style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}