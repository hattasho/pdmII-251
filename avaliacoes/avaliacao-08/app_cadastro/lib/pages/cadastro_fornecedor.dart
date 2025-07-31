import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_data.dart';
import '../models/fornecedor.dart';

class CadastroFornecedor extends StatefulWidget {
  @override
  _CadastroFornecedorState createState() => _CadastroFornecedorState();
}

class _CadastroFornecedorState extends State<CadastroFornecedor> {
  final nomeCtrl = TextEditingController();
  final cnpjCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var appData = Provider.of<AppData>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Cadastro de Fornecedores')),
      body: PageView(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                TextField(controller: nomeCtrl, decoration: InputDecoration(labelText: 'Nome')),
                TextField(controller: cnpjCtrl, decoration: InputDecoration(labelText: 'CNPJ')),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    appData.addFornecedor(Fornecedor(nome: nomeCtrl.text, cnpj: cnpjCtrl.text));
                    nomeCtrl.clear();
                    cnpjCtrl.clear();
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Fornecedor adicionado')));
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
            itemCount: appData.fornecedores.length,
            itemBuilder: (ctx, i) {
              var f = appData.fornecedores[i];
              return ListTile(title: Text(f.nome), subtitle: Text(f.cnpj));
            },
          ),
        ],
      ),
    );
  }
}
