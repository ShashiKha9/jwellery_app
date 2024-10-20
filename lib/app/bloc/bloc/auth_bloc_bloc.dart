import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jwellery_app/app/model/auth_response.dart';
import 'package:jwellery_app/app/repositories/auth_repositories.dart';

part 'auth_bloc_event.dart';
part 'auth_bloc_state.dart';

class AuthBlocBloc extends Bloc<AuthBlocEvent, AuthBlocState> {
  AuthBlocBloc() : super(AuthBlocInitial()) {
    on<AuthBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
