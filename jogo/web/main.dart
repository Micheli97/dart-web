import 'dart:html';
import 'package:jogo/src/partida.dart';
import 'package:jogo/src/resultado.dart';

late DivElement divOpcoes;
late DivElement divResultado;
bool jogando = true;
late Resultado resultado;
void main() {
  inicializarReferencias();
  final partida = configurarPartida();
  print(opcoes.length);

  for (final opcao in opcoes) {
    divOpcoes.append(ImageButtonInputElement()
      ..onClick.listen((MouseEvent event) {
        if (jogando) {
          resultado = partida.iniciar(humano: opcao);
          jogando = false;
          mostrarResultado(resultado);
        }
      })
      ..className = "opcao"
      ..src = 'images/$opcao.png'
      ..height = 120);
  }
}

void mostrarResultado(Resultado resultado) {
  String mensagem;
  String classeCss;

  switch (resultado.resultadoType) {
    case ResultadoType.empate:
      classeCss = "empatou";
      mensagem = "Empatou..";
      break;
    case ResultadoType.vitoria:
      classeCss = "venceu";
      mensagem = "Você ganhou :D";
      break;
    case ResultadoType.derrota:
      classeCss = "perdeu";
      mensagem = "Você perdeu :/";
      break;
  }

  divResultado.append(SpanElement()
    ..className = classeCss
    ..text = mensagem);

  adicionarEspaco();
  divResultado.append(SpanElement()..text = resultado.resumo);
  adicionarEspaco();

  divResultado.append(ButtonElement()
    ..text = "Jogar novamente"
    ..onClick.listen(jogarNovamente));
}

void adicionarEspaco() {
  divResultado.append(BRElement());
  divResultado.append(BRElement());
}

void jogarNovamente(MouseEvent event) {
  jogando = true;
  divResultado.children.clear();
}

void inicializarReferencias() {
  divOpcoes = querySelector("#opcoes") as DivElement;
  divResultado = querySelector("#resultado") as DivElement;
}
