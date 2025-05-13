// Agregação e Composição
import 'dart:convert';

class Dependente {
  late String _nome;

  Dependente(String nome) {
    this._nome = nome;
  }

  Map<String, dynamic> toJson() => {
        'nome': _nome,
      };
}

class Funcionario {
  late String _nome;
  late List<Dependente> _dependentes;

  Funcionario(String nome, List<Dependente> dependentes) {
    this._nome = nome;
    this._dependentes = dependentes;
  }

  Map<String, dynamic> toJson() => {
        'nome': _nome,
        'dependentes': _dependentes.map((d) => d.toJson()).toList(),
      };
}

class EquipeProjeto {
  late String _nomeProjeto;
  late List<Funcionario> _funcionarios;

  EquipeProjeto(String nomeprojeto, List<Funcionario> funcionarios) {
    _nomeProjeto = nomeprojeto;
    _funcionarios = funcionarios;
  }

  Map<String, dynamic> toJson() => {
        'nomeProjeto': _nomeProjeto,
        'funcionarios': _funcionarios.map((f) => f.toJson()).toList(),
      };
}

void main() {
  // 1. OBJETOS DEPENDENTES
  var dep1 = Dependente('Beltrano');
  var dep2 = Dependente('Ciclano');
  var dep3 = Dependente('Fulano');
  var dep4 = Dependente('Molfano');
  var dep5 = Dependente('Froyano');
  var dep6 = Dependente('Jimbano');

  // 2. FUNCIONÁRIOS COM SEUS RESPECTIVOS DEPENDENTES
  var func1 = Funcionario('Cauã', [dep1, dep2]);
  var func2 = Funcionario('Arthur', [dep3, dep4]);
  var func3 = Funcionario('Bia', [dep5, dep6]);

  // 3. EQUIPE E SEUS INTEGRANTES
  var equipe = EquipeProjeto('projeto genérico', [func1, func2, func3]);

  // 4. EXIBIR JSON
  var json = jsonEncode(equipe.toJson());
  print(json);
}