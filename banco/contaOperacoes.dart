import 'conta.dart';

class ContaOperacoes {
  List<Conta> contas = [];

  void adicionarConta(Conta novaConta) {
    contas.add(novaConta);
  }

  Conta? procurarConta(String numeroDaConta) {
    return contas.firstWhere((conta) => conta.numeroDaConta == numeroDaConta,
        orElse: null);
  }

  void transferir(String contaOrigem, String contaDestino, double valor) {
    Conta? origem = procurarConta(contaOrigem);

    Conta? destino = procurarConta(contaDestino);

    if (origem != null && destino != null) {
      origem.transferir(valor, destino);

    } else {
      print('conta não encontrada');
    }
  }
}
