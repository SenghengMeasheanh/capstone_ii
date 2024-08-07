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

  Future<MapBodySecureResponse<UserModels>> getProfile({
    required int id,
  }) async {
    return await ApiServiceSecure().getProfile(id: id);
  }

  Future<MapBodySecureResponse<UserModels>> requestUpdateProfile({
    required int id,
    required ProfileUpdateRequest profileUpdateRequest,
  }) async {
    return await ApiServiceSecure().requestUpdateProfile(
      id: id,
      profileUpdateRequest: profileUpdateRequest,
    );
  }
}
