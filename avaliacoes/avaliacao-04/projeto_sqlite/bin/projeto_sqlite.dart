import 'dart:io';
import 'package:sqlite3/sqlite3.dart';

void main() {
  // Abre (ou cria) o banco de dados local
  final db = sqlite3.open('alunos.db');

  // Cria a tabela se não existir
  db.execute('''
    CREATE TABLE IF NOT EXISTS TB_ALUNO (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      nome TEXT NOT NULL
    );
  ''');

  while (true) {
    print('\n===== MENU =====');
    print('1 - Inserir aluno');
    print('2 - Listar alunos');
    print('3 - Sair');
    stdout.write('Escolha uma opção: ');
    final opcao = stdin.readLineSync();

    if (opcao == '1') {
      stdout.write('Digite o nome do aluno: ');
      final nome = stdin.readLineSync();

      if (nome != null && nome.trim().isNotEmpty) {
        db.execute('INSERT INTO TB_ALUNO (nome) VALUES (?)', [nome.trim()]);
        print('✅ Aluno "$nome" inserido com sucesso!');
      } else {
        print('❌ Nome inválido!');
      }
    } else if (opcao == '2') {
      final result = db.select('SELECT * FROM TB_ALUNO');
      print('\n--- Lista de Alunos ---');
      for (final row in result) {
        print('ID: ${row['id']} | Nome: ${row['nome']}');
      }
    } else if (opcao == '3') {
      print('👋 Encerrando...');
      db.dispose();
      break;
    } else {
      print('❌ Opção inválida! Tente novamente.');
    }
  }
}
