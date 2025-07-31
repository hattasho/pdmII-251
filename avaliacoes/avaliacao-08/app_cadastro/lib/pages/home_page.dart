import 'package:flutter/material.dart';
import 'cadastro_cliente.dart';
import 'cadastro_produto.dart';
import 'cadastro_fornecedor.dart';
import 'cadastro_pedido.dart';

class HomePage extends StatelessWidget {
  final items = {
    'Clientes': CadastroCliente(),
    'Produtos': CadastroProduto(),
    'Fornecedores': CadastroFornecedor(),
    'Pedidos': CadastroPedido(),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Menu Principal')),
      body: ListView(
        children: items.entries.map((e) {
          return ListTile(
            title: Text(e.key),
            trailing: Icon(Icons.arrow_forward),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => e.value)),
          );
        }).toList(),
      ),
    );
  }
}
