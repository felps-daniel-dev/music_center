import 'package:flutter/material.dart';
import '../models/instrumentoDeCorda.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  // Controladores 
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _marcaController = TextEditingController();
  final TextEditingController _valorController = TextEditingController();
  final TextEditingController _cordasController = TextEditingController();
  final TextEditingController _imagemController = TextEditingController();

  @override
  void dispose() {
    _nomeController.dispose();
    _marcaController.dispose();
    _valorController.dispose();
    _cordasController.dispose();
    _imagemController.dispose();
    super.dispose();
  }

  void _salvar() {
    final String nome = _nomeController.text.trim();
    final String marca = _marcaController.text.trim();
    final double? valor = double.tryParse(_valorController.text.replaceAll(',', '.'));
    final int? qtdCordas = int.tryParse(_cordasController.text);
    final String imagemUrl = _imagemController.text.trim();

    // validacao de campos
    if (nome.isEmpty || marca.isEmpty || valor == null || qtdCordas == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Preencha os campos obrigatórios corretamente!'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    //  aplica uma imagem genérica padrão
    final String urlFinal = imagemUrl.isEmpty
        ? 'https://images.unsplash.com/photo-1511671782779-c97d3d27a1d4?w=300'
        : imagemUrl;

    // Instancia novo instrumento
    final novoInstrumento = InstrumentoDeCorda(
      id: DateTime.now().millisecondsSinceEpoch,
      nome: nome,
      marca: marca,
      valor: valor,
      qtdCordas: qtdCordas,
      imagem: urlFinal,
    );

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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: _nomeController,
              decoration: InputDecoration(
                labelText: 'Nome do Instrumento',
                prefixIcon: const Icon(Icons.music_note),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            const SizedBox(height: 12),

            TextFormField(
              controller: _marcaController,
              decoration: InputDecoration(
                labelText: 'Marca',
                prefixIcon: const Icon(Icons.branding_watermark),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            const SizedBox(height: 12),

            TextFormField(
              controller: _valorController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'Preço (R\$)',
                prefixIcon: const Icon(Icons.attach_money),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            const SizedBox(height: 12),

            TextFormField(
              controller: _cordasController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Quantidade de Cordas',
                prefixIcon: const Icon(Icons.linear_scale),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            const SizedBox(height: 12),

            TextFormField(
              controller: _imagemController,
              keyboardType: TextInputType.url,
              decoration: InputDecoration(
                labelText: 'URL da Imagem',
                prefixIcon: const Icon(Icons.image),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            const SizedBox(height: 20),

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