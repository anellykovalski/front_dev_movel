import 'package:flutter/material.dart';
// ignore: unused_import
import 'cadastro_user.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();

    return Scaffold(
      body: Stack(
        children: [
          // Manchas roxas
          Positioned(
            top: -50,
            left: -50,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.purple,
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ),
          Positioned(
            bottom: -50,
            right: -50,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.purple,
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ),
          // Conteúdo principal
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/image.png',
                        height: 150, // ajuste o tamanho conforme necessário
                      ),
                      SizedBox(height: 32),
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.amber,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, insira seu email';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Senha',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.amber,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, insira sua senha';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity, // Botão com largura total
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // Lógica de login aqui
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Processando login')),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.amber, // Cor do botão
                            padding: EdgeInsets.symmetric(
                                vertical: 16.0), // Aumentar o tamanho do botão
                            textStyle: TextStyle(
                              fontSize: 18, // Tamanho do texto
                            ),
                          ),
                          child: Text('Entrar'),
                        ),
                      ),
                      SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity, // Botão com largura total
                        child: ElevatedButton(
                          onPressed: () {
                            if (true) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CadastroUserPage()),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.amber, // Cor do botão
                            padding: EdgeInsets.symmetric(
                                vertical: 16.0), // Aumentar o tamanho do botão
                            textStyle: TextStyle(
                              fontSize: 18, // Tamanho do texto
                            ),
                          ),
                          child: Text('Cadastrar-se'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
