import 'package:music_center/models/instrumento.dart';

class Exposicao{

  final List<Instrumento> _instrumentos = [];

  Exposicao();

  List<Instrumento> get getInstrumentos => _instrumentos;

  void adicionarInstrumento(Instrumento instrumento){
    _instrumentos.add(instrumento);
  }

  double get valorTotalExposto{

    double total = 0.0;

    _instrumentos.forEach((i){
      total = total + i.valor;
    });

    return total;
  }
}