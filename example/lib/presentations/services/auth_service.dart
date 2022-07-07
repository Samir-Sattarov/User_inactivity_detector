import 'package:local_auth/local_auth.dart';

class AuthService {
  final String text;
  final AuthenticationOptions? options;
  final LocalAuthentication api = LocalAuthentication();

  AuthService({required this.text, this.options});

  Future getAvailable() async {
    final allAvailable = await api.getAvailableBiometrics();

    try {
      return allAvailable;
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  Future<bool> auth() async {
    final hasBiometric = await api.canCheckBiometrics;

    if (!hasBiometric) return hasBiometric;

    try {
      return await api.authenticate(
        localizedReason: text,
        options: options ??
            const AuthenticationOptions(
              stickyAuth: true,
              sensitiveTransaction: true,
              useErrorDialogs: true,
            ),
      );
    } catch (error) {
      throw Exception(error);
    }
  }
}
