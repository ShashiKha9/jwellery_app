part of 'auth_bloc_bloc.dart';

abstract class AuthBlocEvent extends Equatable {
  const AuthBlocEvent();

  @override
  List<Object> get props => [];
}

class SignUpEvent extends AuthBlocEvent {
  final String name;
  final String firmName;

  final String mobileNo;
  final String password;

  const SignUpEvent(
      {required this.name,
      required this.firmName,
      required this.mobileNo,
      required this.password});
}

class LoginEvent extends AuthBlocEvent {
  final String mobileNo;
  final String password;

  const LoginEvent({required this.mobileNo, required this.password});
}

abstract class AuthBlocState extends Equatable {
  const AuthBlocState();

  @override
  List<Object> get props => [];
}

final class AuthBlocInitial extends AuthBlocState {}

final class AuthBlocLoading extends AuthBlocState {}

final class AuthBlocSuccess extends AuthBlocState {
  final AuthResponse? user;

  const AuthBlocSuccess({required this.user});
}

final class AuthBlocFailure extends AuthBlocState {
  final String message;

  const AuthBlocFailure({required this.message});
}

class AuthBloc extends Bloc<AuthBlocEvent, AuthBlocState> {
  final AuthRepository authRepository;
  AuthBloc({required this.authRepository}) : super(AuthBlocInitial()) {
    on<SignUpEvent>(_onSignup);
    on<LoginEvent>(_onLogin);
  }

  void _onSignup(SignUpEvent event, Emitter<AuthBlocState> emit) async {
    emit(AuthBlocLoading());

    try {
      final user = await authRepository.SignUp(
          event.name, event.firmName, event.mobileNo, event.password);
      emit(AuthBlocSuccess(user: user));
    } catch (e) {
      String message = e.toString();

      emit(AuthBlocFailure(message: message));
    }
  }

    void _onLogin(LoginEvent event, Emitter<AuthBlocState> emit) async {
    emit(AuthBlocLoading());

    try {
      final user = await authRepository.Login(
          event.mobileNo, event.password);
      emit(AuthBlocSuccess(user: user));
    } catch (e) {
      String message = e.toString();

      emit(AuthBlocFailure(message: message));
    }
  }
}
