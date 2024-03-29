import 'contaPrazo.dart';
import 'contaSalario.dart';

class Conta {
  String? _nome;
  String _numeroDaConta;
  double _saldo = 0;
  DateTime _dataDeCriacao;

  Conta(this._nome, this._numeroDaConta, this._saldo, this._dataDeCriacao);

  String get numeroDaConta => _numeroDaConta;

  void depositar(double montante) {
    _saldo = montante + _saldo;

    print('Valor depositado com sucesso! Novo saldo: $_saldo');
  }

  void levantar(double montante) {
    _saldo = _saldo - montante;

    print('Sucesso! Novo saldo: $_saldo');
  }

  void imprimirSaldo() {
    print('O seu saldo: $_saldo');
  }

  void imprimirDadosDaConta() {
    print(
        'Numero Da Conta: $_numeroDaConta. \nNome: $_nome. \nData De Criacao: $_dataDeCriacao. \nSaldo: $_saldo');
  }

  void transferir(double valor, Conta destinoConta) {
    if (_saldo >= valor) {
      _saldo -= valor;
      destinoConta.depositar(valor);
      print('Transferência realizada com sucesso!');
      imprimirDadosDaConta();
    } else {
      print('Saldo insuficiente para a transferência.');
    }
  }
}
