import 'package:flutter/material.dart';

class CadastroUserPage extends StatefulWidget {
  @override
  _CadastroUserPageState createState() => _CadastroUserPageState();
}

class _CadastroUserPageState extends State<CadastroUserPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  void _register() {
    if (_formKey.currentState!.validate()) {
      String email = _emailController.text;
      String username = _usernameController.text;
      String password = _passwordController.text;

      // Aqui você pode adicionar a lógica para enviar os dados para o banco de dados
      // Exemplo de lógica para integração com um serviço de backend:

      // Future<void> _sendDataToServer() async {
      //   final response = await http.post(
      //     Uri.parse('https://example.com/register'),
      //     body: {
      //       'email': email,
      //       'username': username,
      //       'password': password,
      //     },
      //   );
      //   if (response.statusCode == 200) {
      //     // Sucesso
      //   } else {
      //     // Erro
      //   }
      // }

      // _sendDataToServer();

      // Exemplo de mensagem de sucesso:
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Usuário cadastrado com sucesso!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Usuário'),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Email',
                style: TextStyle(fontSize: 16, color: Colors.purple),
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: 'Digite seu e-mail',
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira seu e-mail';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              Text(
                'Nome de Usuário',
                style: TextStyle(fontSize: 16, color: Colors.purple),
              ),
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(
                  hintText: 'Digite seu nome de usuário',
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira seu nome de usuário';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              Text(
                'Senha',
                style: TextStyle(fontSize: 16, color: Colors.purple),
              ),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Digite sua senha',
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira sua senha';
                  }
                  return null;
                },
              ),
              SizedBox(height: 40, width: 20,),
              Center(
                child: ElevatedButton(
                  onPressed: _register,
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.purple, backgroundColor: Colors.yellow,
                  ),
                  child: Text('Cadastrar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

