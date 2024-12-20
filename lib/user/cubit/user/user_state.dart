part of 'user_cubit.dart';

sealed class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

final class UserInitial extends UserState {}

final class FetchUserLoading extends UserState {}

final class FetchUserSuccess extends UserState {
  final List<UserModel> data;

  const FetchUserSuccess(this.data);
}

final class FetchUserFailed extends UserState {
  final String message;

  const FetchUserFailed(this.message);
}
