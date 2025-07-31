import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_data.dart';
import '../models/produto.dart';

class CadastroProduto extends StatefulWidget {
  @override
  _CadastroProdutoState createState() => _CadastroProdutoState();
}

class _CadastroProdutoState extends State<CadastroProduto> {
  final nomeCtrl = TextEditingController();
  final precoCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var appData = Provider.of<AppData>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Cadastro de Produtos')),
      body: PageView(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                TextField(controller: nomeCtrl, decoration: InputDecoration(labelText: 'Nome')),
                TextField(controller: precoCtrl, decoration: InputDecoration(labelText: 'Preço')),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    double? preco = double.tryParse(precoCtrl.text);
                    if (preco != null) {
                      appData.addProduto(Produto(nome: nomeCtrl.text, preco: preco));
                      nomeCtrl.clear();
                      precoCtrl.clear();
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Produto adicionado')));
                    }
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
            itemCount: appData.produtos.length,
            itemBuilder: (ctx, i) {
              var p = appData.produtos[i];
              return ListTile(title: Text(p.nome), subtitle: Text('R\$ ${p.preco.toStringAsFixed(2)}'));
            },
          ),
        ],
      ),
    );
  }
}
