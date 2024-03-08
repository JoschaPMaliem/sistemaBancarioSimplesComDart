import 'conta.dart';

class ContaSalario extends Conta {
  String? _numeroDeNuit;

  ContaSalario(
      String nome, String numeroDaConta, double saldo, DateTime dataDeCriacao, this._numeroDeNuit)
      : super(nome, numeroDaConta, saldo, dataDeCriacao);

      void imprimirDadosDaConta() {
    super.imprimirDadosDaConta();
    print('Tipo De Conta: Conta-Salario. \nNumero De Nuit: $_numeroDeNuit.');

  }

  void levantar(double montante) {
    super.levantar(montante + 15);
  }
}
