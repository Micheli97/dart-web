import 'dart:html';
import 'package:jogo/src/partida.dart';

late DivElement divOpcoes;
late DivElement divResultado;
void main() {
  inicializarReferencias();
  configurarPartida();
  print(opcoes.length);

  for (final opcao in opcoes) {
    divOpcoes.append(ImageButtonInputElement()
      ..className = "opcao"
      ..src = 'images/$opcao.png'
      ..height = 120);
  }
}

void inicializarReferencias() {
  divOpcoes = querySelector("#opcoes") as DivElement;
  divResultado = querySelector("#resultado") as DivElement;
}
