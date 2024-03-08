import 'conta.dart';

class ContaPrazo extends Conta {
  DateTime _dataMaturidade;
  String? _flag;

  ContaPrazo(String nome, String numeroDaConta, double saldo,
      DateTime dataDeCriacao, this._dataMaturidade, this._flag)
      : super(nome, numeroDaConta, saldo, dataDeCriacao);

  void imprimirDadosDaConta() {
    super.imprimirDadosDaConta();
    print(
        'Tipo De Conta: Conta-Prazo. \nData Maturidade: $_dataMaturidade. \nAuto-Renovavel: -');
  }


  void levantar(double montante) {
    super.levantar(montante + 100);
  }
}
