import 'instrumento.dart';

class Instrumentodecorda extends Instrumento {

  int? qtdCordas;

  Instrumentodecorda(
    int id,
    String nome,
    double valor,
    String marca,
    this.qtdCordas,
  ) : super(id, nome, valor, marca);

}
