// login_response.dart

class AuthResponse {
  final String? message;
  final UserData? data;
  final int? code;
  final bool? success;

  AuthResponse({
     this.message,
     this.data,
     this.code,
     this.success,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      message: json['message'],
      data: UserData.fromJson(json['data']),
      code: json['code'],
      success: json['success'],
    );
  }
}

class UserData {
  final String id;
  final String authType;
  final String token;
  final String name;

  UserData({
    required this.id,
    required this.authType,
    required this.token,
    required this.name,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['_id'],
      authType: json['authType'],
      token: json['token'],
      name: json['name'],
    );
  }
}
