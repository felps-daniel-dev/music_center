import 'instrumento.dart';

class InstrumentoDeCorda extends Instrumento {
  final int qtdCordas;

  InstrumentoDeCorda({
    required id,
    required nome,
    required valor,
    required marca,
    required this.qtdCordas,
  }) : super(id: id, nome: nome, valor: valor, marca: marca);
}
