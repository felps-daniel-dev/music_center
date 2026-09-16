import 'package:music_center/models/instrumento.dart';

class InstrumentoDeCorda extends Instrumento {
  final int qtdCordas;

  InstrumentoDeCorda({
    required super.id,
    required super.nome,
    required super.valor,
    required super.marca,
    required super.imagem,
    required this.qtdCordas,
  });
}
