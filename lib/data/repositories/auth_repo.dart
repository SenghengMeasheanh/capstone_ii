import 'package:capstone_ii/data/data_export.dart';

class AuthRepo {
  Future<AuthResponse> requestSignUp({
    required SignUpRequest signUpRequest,
  }) async {
    return await ApiService().requestSignUp(signUpRequest: signUpRequest);
  }

  Future<AuthResponse> requestSignIn({
    required SignInRequest signInRequest,
  }) async {
    return await ApiService().requestSignIn(signInRequest: signInRequest);
  }

  Future<AuthResponse> requestRefreshToken() async {
    return await ApiServiceSecure().requestRefreshToken();
  }
}
