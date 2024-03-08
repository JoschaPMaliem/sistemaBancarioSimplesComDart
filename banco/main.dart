import 'contaPrazo.dart';
import 'contaSalario.dart';

void main() {
  print('Bem vindo ao Sistema bancario');

  


  print('Deseja criar que tipo de conta: \n1-Conta prazo. \n2-Conta salario.');


  ContaPrazo contaPrazo = new ContaPrazo('Joscha', '113425AB', 400,
      DateTime.now(), DateTime.now().add(Duration(days: 1825)), 'sim');

  contaPrazo.levantar(20);
  contaPrazo.imprimirDadosDaConta();

  ContaSalario contaSalario = new ContaSalario(
      'Maliem', '111004AZAZ', 4000, DateTime.now(), '50021344');
  contaSalario.depositar(200);
  contaSalario.levantar(400);
  contaSalario.imprimirDadosDaConta();
}
