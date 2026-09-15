import 'package:music_center/models/instrumentoDeCorda.dart';

class Exposicao{

  final List<InstrumentoDeCorda> _instrumentos = [];

  Exposicao();

  List<InstrumentoDeCorda> get getInstrumentos => _instrumentos;

  void adicionarInstrumento(InstrumentoDeCorda instrumento){
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