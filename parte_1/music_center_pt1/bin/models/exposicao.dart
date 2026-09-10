import 'instrumento.dart';

class Exposicao {
  List<Instrumento> _instrumentos = [];

  Exposicao();
  List<Instrumento> get getInstrumentos => _instrumentos;

  //set setInstrumentos(instru) => this._instrumentos = instru;

  void adicionarInstrumento(Instrumento instrumento) {
    _instrumentos.add(instrumento);
  }

  double get valorTotalExpostos{

    double total = 0.0;

    _instrumentos.forEach((i){  // para cada instrumneto faz a conta
      total = total + i.valor;
    });
    return total;
  }
}
