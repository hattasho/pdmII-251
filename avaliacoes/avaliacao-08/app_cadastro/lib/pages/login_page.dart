import 'package:flutter/material.dart';
import 'home_page.dart';

class LoginPage extends StatelessWidget {
  final _userCtrl = TextEditingController();
  final _passCtrl = TextEditingController();

  void _login(BuildContext context) {
    if (_userCtrl.text == 'admin' && _passCtrl.text == '123') {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomePage()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login inválido')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(controller: _userCtrl, decoration: InputDecoration(labelText: 'Usuário')),
              TextField(controller: _passCtrl, obscureText: true, decoration: InputDecoration(labelText: 'Senha')),
              SizedBox(height: 20),
              ElevatedButton(onPressed: () => _login(context), child: Text('Entrar'))
            ],
          ),
        ),
      ),
    );
  }
}
