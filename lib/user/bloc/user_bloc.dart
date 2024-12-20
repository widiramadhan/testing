import 'package:flutter_application_1/user/bloc/user_event.dart';
import 'package:flutter_application_1/user/bloc/user_state.dart';
import 'package:flutter_application_1/user/repository/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc(this.userRepository) : super(UserInitial()) {
    on<FetchUsers>((event, emit) async {
      emit(UserLoading());
      try {
        final users = await userRepository.fetchUsers();
        emit(UserLoaded(users));
      } catch (e) {
        emit(UserError("Failed to fetch users"));
      }
    });
  }
}
