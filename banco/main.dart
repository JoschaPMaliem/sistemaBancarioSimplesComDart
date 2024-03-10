import 'dart:ffi';
import 'dart:io';

import 'contaOperacoes.dart';
import 'contaPrazo.dart';
import 'contaSalario.dart';

void main() {
  ContaOperacoes contaOperacoes = ContaOperacoes();

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
          print('Que tipo de conta deseja criar (conta salario/conta prazo): ');

          String? subinput = stdin.readLineSync();

          if (subinput == 'conta salario') {
            menuContaSalario();
            //contaOperacoes.adicionarConta(menuContaSalario());
          } else if (subinput == 'conta prazo') {
            menuContaPrazo();
          }

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
  String? numeroDaConta = '123456$ne';

  print(
      'Deposite algum valor(Considere que o valor minimo para a subscricao da conta prazo eh: 4000MTS)');

  String? saldoString = stdin.readLineSync();

  if (saldoString != null) {
    double saldoN = double.parse(saldoString);

    ContaPrazo contaPrazo = new ContaPrazo(nome, numeroDaConta, saldoN,
        DateTime.now(), DateTime.now().add(Duration(days: 365)), 'sim');

    print('Conta criada com sucesso:');
    contaPrazo.imprimirDadosDaConta();
  }
}

void menuContaSalario() {
  print('Nome');
  dynamic nome = stdin.readLineSync();

  print('Numero de nuit');
  dynamic nuit = stdin.readLineSync();

  String ne = nome[1] + nome[0] + '';

  String numeroDaConta = '654321$ne';

  print('Deseja depositar algum valor(sim/nao)');
  String? resposta = stdin.readLineSync();

  if (resposta != null && resposta == 'sim') {
    print('Deposite: ');

    String? saldoString = stdin.readLineSync();

    if (saldoString != null) {
      double saldo = double.parse(saldoString);

      ContaSalario contaSalario =
          new ContaSalario(nome, numeroDaConta, saldo, DateTime.now(), nuit);

      print('Conta criada com successo');
      contaSalario.imprimirDadosDaConta();
    }
  } else if (resposta != null && resposta == 'nao') {
    ContaSalario contaSalario =
        new ContaSalario(nome, numeroDaConta, 0, DateTime.now(), nuit);

    print('Conta criada com successo');
    contaSalario.imprimirDadosDaConta();
  }
}
