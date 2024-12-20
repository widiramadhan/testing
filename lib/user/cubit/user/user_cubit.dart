import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/user/model/user_model.dart';
import 'package:flutter_application_1/user/repository/user_repository.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  UserRepository repository = UserRepository();

  void getUserList() async {
    // Loading State
    emit(
      FetchUserLoading(),
    );
    try {
      final result = await repository.fetchUsers();
      // Success State
      emit(
        FetchUserSuccess(
          result,
        ),
      );
    } catch (e, s) {
      // Failed State
      print(s);
      emit(
        FetchUserFailed(
          e.toString(),
        ),
      );
    }
  }
}
