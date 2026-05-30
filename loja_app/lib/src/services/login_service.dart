import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../models/login_response.dart';

class LoginService {
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  Future<LoginResponse> login({
    required String username,
    required String password,
  }) async {
    await Future.delayed(const Duration(seconds: 1));

    if (username == 'admin' && password == '123456') {
      const token = 'token_fake_checkpoint';

      await storage.write(
        key: 'auth_token',
        value: token,
      );

      return LoginResponse(token: token);
    }

    throw Exception('Usuário ou senha inválidos.');
  }

  Future<String?> obterToken() async {
    return await storage.read(key: 'auth_token');
  }

  Future<void> logout() async {
    await storage.delete(key: 'auth_token');
  }
}