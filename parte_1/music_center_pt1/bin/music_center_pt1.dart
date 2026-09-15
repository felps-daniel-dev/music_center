import 'models/instrumentoDeCorda.dart';
import 'models/instrumento.dart';
import 'models/exposicao.dart';

void main() {
  Exposicao exposicao = Exposicao();
  print('===== [1] ENTIDADE PRINCIPAL =====!');
  Instrumento instrumentoComum = Instrumento(
    id: 2,
    nome: 'Bumbo',
    valor: 120.00,
    marca: 'Eclipse',
  );
  print(
    'Id: ${instrumentoComum.id} Nome: ${instrumentoComum.nome} Valor: ${instrumentoComum.valor} Marca: ${instrumentoComum.marca}',
  );

  print(' ');

  print('===== [2] HERANÇA  =====');
  Instrumento instrumentoComum2 = Instrumento(
    id: 3,
    nome: 'Triangulo',
    valor: 80.00,
    marca: 'Made In China',
  );
  print('Instrumento comum');
  print(
    'Id: ${instrumentoComum2.id} Nome: ${instrumentoComum2.nome} Valor: ${instrumentoComum2.valor} Marca: ${instrumentoComum2.marca}',
  );
  print(' ');

  InstrumentoDeCorda violao = InstrumentoDeCorda(
    id: 1,
    nome: 'Violão',
    valor: 980.00,
    marca: 'Gianini',
    qtdCordas: 6,
  );
  print('Instrumento de corda');
  print(
    'Id: ${violao.id} | Nome: ${violao.nome} | Marca: ${violao.marca} |  Valor: ${violao.valor}  | Quantidade de cordas: ${violao.qtdCordas} |',
  );
  print(' ');

  InstrumentoDeCorda guitarra = InstrumentoDeCorda(
    id: 5,
    nome: 'Guitarra',
    valor: 5000.00,
    marca: 'Les Paul',
    qtdCordas: 6,
  );

  InstrumentoDeCorda viola = InstrumentoDeCorda(
    id: 6,
    nome: 'Viola',
    valor: 2500.00,
    marca: 'Les Paul',
    qtdCordas: 6,
  );

  InstrumentoDeCorda contraBaixo = InstrumentoDeCorda(
    id: 7,
    nome: 'Contra baixo',
    valor: 1890.00,
    marca: 'Yamaha',
    qtdCordas: 4,
  );

  InstrumentoDeCorda cavaquinho = InstrumentoDeCorda(
    id: 8,
    nome: 'Cavaquinho',
    valor: 550.00,
    marca: 'Rozin',
    qtdCordas: 4,
  );

  InstrumentoDeCorda violino = InstrumentoDeCorda(
    id: 9,
    nome: 'Violino',
    valor: 890.00,
    marca: 'Yamaha',
    qtdCordas: 4,
  );

  exposicao.adicionarInstrumento(violao);
  exposicao.adicionarInstrumento(guitarra);
  exposicao.adicionarInstrumento(viola);
  exposicao.adicionarInstrumento(contraBaixo);
  exposicao.adicionarInstrumento(cavaquinho);
  exposicao.adicionarInstrumento(violino);

  print('===== [3] COMPOSIÇÃO(instrumentos de corda)=====');
  exposicao.getInstrumentos.forEach(
    (i) => print('Id: ${i.id} | Nome: ${i.nome}'),
  );

  print('  ');
  print('===== [4] ENCAPSULAMENTO =====');
  double valor = exposicao.valorTotalExpostos;
  print('Valor antes de adicionar o Banjo');
  print('Valor: $valor');
  print(' ');
  print('Valor depois de adicionar o Banjo');
  InstrumentoDeCorda banjo = InstrumentoDeCorda(
    id: 10,
    nome: 'Banjo',
    valor: 400.00,
    marca: 'Gianini',
    qtdCordas: 5,
  );
  exposicao.adicionarInstrumento(banjo);
  valor = exposicao.valorTotalExpostos;
  print('Valor: $valor');
}
