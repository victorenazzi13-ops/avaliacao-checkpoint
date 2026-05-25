import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../services/login_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final usuarioController = TextEditingController();
  final senhaController = TextEditingController();

  final loginService = LoginService();

  bool carregando = false;

  @override
  void dispose() {
    usuarioController.dispose();
    senhaController.dispose();
    super.dispose();
  }

  Future<void> fazerLogin() async {
    final usuario = usuarioController.text.trim();
    final senha = senhaController.text.trim();

    if (usuario.isEmpty || senha.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Preencha usuário e senha.'),
        ),
      );
      return;
    }

    setState(() {
      carregando = true;
    });

    try {
      final response = await loginService.login(
        username: usuario,
        password: senha,
      );

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Login realizado! Token: ${response.token}'),
        ),
      );

      Navigator.pop(context);
    } catch (erro) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(erro.toString().replaceAll('Exception: ', '')),
        ),
      );
    } finally {
      if (mounted) {
        setState(() {
          carregando = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login',
          style: TextStyle(
            fontFamily: GoogleFonts.orbitron().fontFamily,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo_usedev.png',
              height: 70,
            ),
            const SizedBox(height: 35),
            TextField(
              controller: usuarioController,
              decoration: InputDecoration(
                labelText: 'Usuário',
                hintText: 'digite seu usuário',
                prefixIcon: const Icon(Icons.person_outline),
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(28),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 18),
            TextField(
              controller: senhaController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Senha',
                hintText: 'digite sua senha',
                prefixIcon: const Icon(Icons.lock_outline),
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(28),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 28),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: carregando ? null : fazerLogin,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF7800F7),
                  foregroundColor: Colors.white,
                ),
                child: carregando
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text('Entrar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}