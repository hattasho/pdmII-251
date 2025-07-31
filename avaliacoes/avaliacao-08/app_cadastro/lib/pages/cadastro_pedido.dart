import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_data.dart';
import '../models/pedido.dart';

class CadastroPedido extends StatefulWidget {
  @override
  _CadastroPedidoState createState() => _CadastroPedidoState();
}

class _CadastroPedidoState extends State<CadastroPedido> {
  final produtoCtrl = TextEditingController();
  final qtdCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var appData = Provider.of<AppData>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Cadastro de Pedidos')),
      body: PageView(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                TextField(controller: produtoCtrl, decoration: InputDecoration(labelText: 'Produto')),
                TextField(controller: qtdCtrl, decoration: InputDecoration(labelText: 'Quantidade')),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    int? qtd = int.tryParse(qtdCtrl.text);
                    if (qtd != null) {
                      appData.addPedido(Pedido(produto: produtoCtrl.text, quantidade: qtd));
                      produtoCtrl.clear();
                      qtdCtrl.clear();
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Pedido adicionado')));
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
            itemCount: appData.pedidos.length,
            itemBuilder: (ctx, i) {
              var p = appData.pedidos[i];
              return ListTile(title: Text(p.produto), subtitle: Text('Qtd: ${p.quantidade}'));
            },
          ),
        ],
      ),
    );
  }
}
