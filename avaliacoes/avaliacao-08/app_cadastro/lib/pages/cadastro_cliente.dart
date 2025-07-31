import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_data.dart';
import '../models/cliente.dart';

class CadastroCliente extends StatefulWidget {
  @override
  _CadastroClienteState createState() => _CadastroClienteState();
}

class _CadastroClienteState extends State<CadastroCliente> {
  final nomeCtrl = TextEditingController();
  final emailCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var appData = Provider.of<AppData>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Cadastro de Clientes')),
      body: PageView(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                TextField(controller: nomeCtrl, decoration: InputDecoration(labelText: 'Nome')),
                TextField(controller: emailCtrl, decoration: InputDecoration(labelText: 'Email')),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    appData.addCliente(Cliente(nome: nomeCtrl.text, email: emailCtrl.text));
                    nomeCtrl.clear();
                    emailCtrl.clear();
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Cliente adicionado')));
                  },
                  child: Text('Adicionar'),
                ),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Voltar ao Menu'),
                )
              ],
            ),
          ),
          ListView.builder(
            itemCount: appData.clientes.length,
            itemBuilder: (ctx, i) {
              var c = appData.clientes[i];
              return ListTile(title: Text(c.nome), subtitle: Text(c.email));
            },
          ),
        ],
      ),
    );
  }
}
