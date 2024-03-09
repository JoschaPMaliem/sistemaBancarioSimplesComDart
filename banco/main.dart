import 'dart:ffi';
import 'dart:io';

import 'contaPrazo.dart';
import 'contaSalario.dart';

void main() {
  print('Bem vindo ao Sistema bancario');

  while (true) {
    print('Menu');
    print('1-Criar conta');
    print('2-Aceder conta');
    print('3-Sair');

    String? input = stdin.readLineSync();

    if (input != null) {
      switch (input) {
        case '1':
          print('Que tipo de conta deseja criar (conta salario/conta Prazo): ');

          String? subinput = stdin.readLineSync();

          if (subinput == 'conta salario') {
            menuContaSalario();
          } else if (subinput == 'conta Prazo') {}
          menuContaPrazo();
          break;

        case '2':
          print('Ainda a criar ideias');
          break;

        case '3':
          return;
        default:
          print('Erro');
      }
    }
  }

  /* print('Deseja criar que tipo de conta: \n1-Conta prazo. \n2-Conta salario.');

  ContaPrazo contaPrazo = new ContaPrazo('Joscha', '113425AB', 400,
      DateTime.now(), DateTime.now().add(Duration(days: 1825)), 'sim');

  contaPrazo.levantar(20);
  contaPrazo.imprimirDadosDaConta();

  ContaSalario contaSalario = new ContaSalario(
      'Maliem', '111004AZAZ', 4000, DateTime.now(), '50021344');
  contaSalario.depositar(200);
  contaSalario.levantar(400);
  contaSalario.imprimirDadosDaConta();

  */
}

void menuContaPrazo() {
  print('Nome: ');
  dynamic nome = stdin.readLineSync();
  String ne = nome[1] + nome[0] + '';
  String? numeroDaConta = '1123014$ne';

  double saldo = 0;

  print(
      'Deseja depositar algum valor(Considere que o valor minimo para a subscricao da conta prazo eh: 4000MTS)');

  String? resposta = stdin.readLineSync();
  if (resposta == 'sim') {
    print('Deposite: ');
    var saldoString = stdin.readLineSync();
    if (saldoString != null) {
      saldo = double.parse(saldoString);
    } else {
      print(
          'erro'); //Esta parte ainda nao funciona, o saldo nao adiciona quando invocamos o imprimirDadosDaConta
    }
  }

  ContaPrazo contaPrazo = new ContaPrazo(nome, numeroDaConta, saldo,
      DateTime.now(), DateTime.now().add(Duration(days: 365)), 'sim');

  print('Conta criada com sucesso:');
  contaPrazo.imprimirDadosDaConta();
}

void menuContaSalario() {
  print('Nome');
}
