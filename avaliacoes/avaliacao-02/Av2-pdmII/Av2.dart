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
  // 1. Criar objetos Dependente
  var dep1 = Dependente("Lucas");
  var dep2 = Dependente("Ana");
  var dep3 = Dependente("João");

  // 2. Criar objetos Funcionario
  var func1 = Funcionario("Carlos", [dep1]);
  var func2 = Funcionario("Mariana", [dep2, dep3]);

  // 3. Lista de funcionários
  var funcionarios = [func1, func2];

  // 4. Criar objeto EquipeProjeto
  var equipe = EquipeProjeto("AppFlutter", funcionarios);

  // 5. Printar em JSON
  var jsonEquipe = jsonEncode(equipe.toJson());
  print(jsonEquipe);
}