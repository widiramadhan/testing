import 'package:bloc/bloc.dart';

class HomePageListCubit extends Cubit<List<String>> {
  HomePageListCubit() : super([]);

  Future<void> fetchData() async {
    emit([]);
    await Future.delayed(const Duration(seconds: 2)); // Simulasi loading
    emit(['Item 1', 'Item 2', 'Item 3', 'Item 4']);
  }
}
