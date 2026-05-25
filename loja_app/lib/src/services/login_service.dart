import '../models/login_response.dart';

class LoginService {
  Future<LoginResponse> login({
    required String username,
    required String password,
  }) async {
    await Future.delayed(const Duration(seconds: 1));

    if (username == 'mor_2314' && password == '83r5^_') {
      return LoginResponse(token: 'token_fake_checkpoint');
    }

    throw Exception('Usuário ou senha inválidos.');
  }
}