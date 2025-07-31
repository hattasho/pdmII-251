import 'package:flutter/material.dart';
import '../models/cliente.dart';
import '../models/produto.dart';
import '../models/fornecedor.dart';
import '../models/pedido.dart';

class AppData extends ChangeNotifier {
  List<Cliente> clientes = [];
  List<Produto> produtos = [];
  List<Fornecedor> fornecedores = [];
  List<Pedido> pedidos = [];

  void addCliente(Cliente c) {
    clientes.add(c);
    notifyListeners();
  }

  void addProduto(Produto p) {
    produtos.add(p);
    notifyListeners();
  }

  void addFornecedor(Fornecedor f) {
    fornecedores.add(f);
    notifyListeners();
  }

  void addPedido(Pedido p) {
    pedidos.add(p);
    notifyListeners();
  }

  

}