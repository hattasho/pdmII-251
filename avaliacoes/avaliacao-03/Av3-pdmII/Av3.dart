import 'dart:io';
import 'dart:async';
import 'dart:isolate';

void main() async {
  print("print inicial: Saul Ramos magalhães");

  final receivePort = ReceivePort();

  await Isolate.spawn(doAsyncOperation, receivePort.sendPort);

  print('Iniciando outras tarefas...');
  await Future.delayed(Duration(seconds: 1));
  print('Continuando outras tarefas...');

  final result = await receivePort.first;
  print('Resultado: $result');
}

void doAsyncOperation(SendPort sendPort) async {
  final file = File('./03-programacao-assincron/arquivo.txt');

  String content = await file.readAsString();

  sendPort.send(content);
}