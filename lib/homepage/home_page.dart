import 'package:flutter/material.dart';
import 'package:flutter_application_1/homepage/home_cubit.dart';
import 'package:flutter_application_1/homepage/home_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomePageCubit(),
      child: const HomeView(),
    );
  }
}
