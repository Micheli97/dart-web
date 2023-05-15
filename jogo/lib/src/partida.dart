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
