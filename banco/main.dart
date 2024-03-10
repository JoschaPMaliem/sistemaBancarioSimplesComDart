import 'dart:ffi';
import 'dart:io';

import 'conta.dart';
import 'contaOperacoes.dart';
import 'contaPrazo.dart';
import 'contaSalario.dart';

void main() {
  ContaOperacoes contaOperacoes = ContaOperacoes();

  contaOperacoes.adicionarConta(
      ContaSalario('joscha', '123456oj', 1000, DateTime.now(), 'NUIT123'));

  contaOperacoes.adicionarConta(ContaPrazo('eren', '654321re', 5000,
      DateTime.now(), DateTime.now().add(Duration(days: 365)), 'sim'));

  contaOperacoes.adicionarConta(ContaPrazo('mikasa', '654321im', 5000,
      DateTime.now(), DateTime.now().add(Duration(days: 365)), 'sim'));

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
            Conta contaSalario = menuContaSalario();
            contaOperacoes.adicionarConta(contaSalario);
            print('Conta criada com sucesso');
            contaSalario.imprimirDadosDaConta();
          } else if (subinput == 'conta prazo') {
            Conta contaPrazo = menuContaPrazo();
            contaOperacoes.adicionarConta(contaPrazo);
            print('Conta criada com sucesso');
            contaPrazo.imprimirDadosDaConta();
          }
          break;

        case '2':
          //print('Ainda a criar ideias');

          print('Digite o número da conta: ');
          String? numeroDaConta = stdin.readLineSync();

          if (numeroDaConta != null) {
            Conta? contaAcessada = contaOperacoes.procurarConta(numeroDaConta);

            if (contaAcessada != null) {
              print('Conta encontrada. Acessando...');
              acessarConta(contaAcessada, contaOperacoes);
            } else {
              print('Conta não encontrada.');
            }
          }
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

Conta menuContaPrazo() {
  print('Nome: ');
  dynamic nome = stdin.readLineSync();
  String ne = nome[1] + nome[0] + '';
  String? numeroDaConta = '123456$ne';

  print(
      'Deposite algum valor(Considere que o valor minimo para a subscricao da conta prazo eh: 4000MTS)');

  String? saldoString = stdin.readLineSync();

  if (saldoString != null) {
    double saldoN = double.parse(saldoString);

    return ContaPrazo(nome, numeroDaConta, saldoN, DateTime.now(),
        DateTime.now().add(Duration(days: 365)), 'sim');

    //print('Conta criada com sucesso:');
    //contaPrazo.imprimirDadosDaConta();
  } else {
    print('Erro no deposito');
    return ContaPrazo(nome, numeroDaConta, 0, DateTime.now(),
        DateTime.now().add(Duration(days: 365)), '-');
  }
}

Conta menuContaSalario() {
  print('Nome: ');
  String? nome = stdin.readLineSync();

  if (nome == null) {
    print('Erro no nome');
    return ContaSalario('', '', 0, DateTime.now(), '');
  }

  print('Numero de nuit: ');
  String? nuit = stdin.readLineSync();

  String ne = nome[1] + nome[0];
  String numeroDaConta = '654321$ne';

  print('Deseja depositar algum valor (sim/nao): ');
  String? resposta = stdin.readLineSync();

  if (resposta != null && resposta == 'sim') {
    print('Deposite: ');

    String? saldoString = stdin.readLineSync();

    if (saldoString != null) {
      double saldo = double.parse(saldoString);

      return ContaSalario(nome, numeroDaConta, saldo, DateTime.now(), nuit);
    }
  }

  return ContaSalario(nome, numeroDaConta, 0, DateTime.now(), nuit);
}

void acessarConta(Conta conta, ContaOperacoes contaOperacoes) {
  while (true) {
    print('\nAcesso à Conta');
    print('1- Transferir dinheiro');
    print('2- Renovar conta (se aplicável)');
    print('3- Imprimir dados da conta');
    print('4-Levantar');
    print('5- Voltar ao menu principal');

    String? opcao = stdin.readLineSync();

    switch (opcao) {
      case '1':
        transferirDinheiro(conta, contaOperacoes);
        break;

      case '2':
        print("Ainda em desenvolvimento");
        break;

      case '3':
        conta.imprimirDadosDaConta();
        break;

      case '4':
        levantarDinheiro(conta);
        break;

      case '5':
        print('Saindo do acesso à conta.');
        return;

      default:
        print('Opção inválida. Tente novamente.');
    }
  }
}

void transferirDinheiro(Conta origem, ContaOperacoes contaOperacoes) {
  print('Digite o número da conta de destino:');
  String? numeroContaDestino = stdin.readLineSync();

  if (numeroContaDestino != null) {
    Conta? destino = contaOperacoes.procurarConta(numeroContaDestino);

    if (destino != null) {
      print('Digite o valor a ser transferido:');
      String? valorTransferencia = stdin.readLineSync();

      if (valorTransferencia != null) {
        double valor = double.tryParse(valorTransferencia) ?? 0;

        origem.transferir(valor, destino);
      } else {
        print('Valor inválido.');
      }
    } else {
      print('Conta de destino não encontrada.');
    }
  }
}

void levantarDinheiro(Conta conta) {
  print('Digite o valor a ser levantado:');
  String? valorLevantamento = stdin.readLineSync();

  if (valorLevantamento != null) {
    double valor = double.tryParse(valorLevantamento) ?? 0;

    conta.levantar(valor);
  } else {
    print('Valor inválido.');
  }
}
