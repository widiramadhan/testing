import 'package:flutter/material.dart';
import 'package:flutter_application_1/homepage/home_list_cubit.dart';
import 'package:flutter_application_1/homepage/home_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeListPage extends StatelessWidget {
  const HomeListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomePageListCubit()..fetchData(),
      child: const HomeView(),
    );
  }
}
