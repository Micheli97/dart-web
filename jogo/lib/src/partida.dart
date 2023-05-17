import 'dart:math';

import 'package:jogo/src/resultado.dart';

const pedra = "Pedra";
const papel = "Papel";
const tesoura = "Tesoura";
const lagarto = "Lagarto";
const spock = "Spock";

const opcoes = [pedra, papel, tesoura, lagarto, spock];

class Partida {
  final regras = <String, Map<String, String>>{};

  void criarRegra(
      {required String vencedor,
      required String acao,
      required String perdedor}) {
    if (!regras.containsKey(vencedor)) {
      regras[vencedor] = {};
    }
    regras[vencedor]![acao] = perdedor;
  }

  Resultado iniciar({required String humano}) {
    final pc = escolherPC();
    if (humano == pc) {
      return Resultado(ResultadoType.empate, "$humano empata com $pc");
    }
    if (regras[humano]!.containsValue(pc)) {
      final entry = regras[humano]!.entries.firstWhere((e) => e.value == pc);
      return Resultado(
          ResultadoType.vitoria, "$humano ${entry.key} ${entry.value}");
    }

    final entry = regras[pc]!.entries.firstWhere((e) => e.value == humano);
    return Resultado(ResultadoType.derrota, "$pc ${entry.key} ${entry.value}");
  }
}

Partida configurarPartida() {
  return Partida()
    ..criarRegra(vencedor: tesoura, acao: "corta", perdedor: papel)
    ..criarRegra(vencedor: tesoura, acao: "decapita", perdedor: lagarto)
    ..criarRegra(vencedor: papel, acao: "cobre", perdedor: pedra)
    ..criarRegra(vencedor: papel, acao: "refuta", perdedor: spock)
    ..criarRegra(vencedor: pedra, acao: "esmaga", perdedor: lagarto)
    ..criarRegra(vencedor: pedra, acao: "quebra", perdedor: tesoura)
    ..criarRegra(vencedor: lagarto, acao: "envenena", perdedor: spock)
    ..criarRegra(vencedor: lagarto, acao: "come", perdedor: papel)
    ..criarRegra(vencedor: spock, acao: "esmaga", perdedor: tesoura)
    ..criarRegra(vencedor: spock, acao: "vaporiza", perdedor: pedra);
}

String escolherPC() {
  final index = Random().nextInt(5);
  return opcoes[index];
}
