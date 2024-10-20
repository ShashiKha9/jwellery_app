import 'package:jwellery_app/app/api%20provider/auth_provider.dart';
import 'package:jwellery_app/app/model/auth_response.dart';

class AuthRepository {

  final  AuthApiProvider authApiProvider;

  AuthRepository({required  this.authApiProvider});

  Future<AuthResponse?> SignUp(String name,String firmName, String mobileNo, String password) {
    return  authApiProvider.signUpApi(name, firmName, mobileNo, password);


  }

    Future<AuthResponse?> Login(String mobileNo, String password) {
    return  authApiProvider.loginApi(mobileNo, password);


  }

}