import 'package:flutter/material.dart';
import 'package:flutter_application_1/homepage/home_cubit.dart';
import 'package:flutter_application_1/homepage/home_list_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Homepage'),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Counter App Using Cubit'),
            const SizedBox(
              height: 24,
            ),
            BlocBuilder<HomePageCubit, int>(
              builder: (context, state) {
                return Text(
                  'COUNTER : $state',
                  style: const TextStyle(
                    fontSize: 32,
                    color: Colors.green,
                  ),
                );
              },
            ),
            const SizedBox(
              height: 24,
            ),
            BlocBuilder<HomePageCubit, int>(builder: (context, state) {
              return ElevatedButton(
                onPressed: () {
                  if (state == 10) {
                    print("Nilai sudah maksimal");
                  } else {
                    context.read<HomePageCubit>().increment();
                  }
                },
                child: const Text(
                  'Increment',
                ),
              );
            }),
            const SizedBox(
              height: 12,
            ),
            BlocBuilder<HomePageCubit, int>(
              builder: (context, state) {
                return ElevatedButton(
                  onPressed: () {
                    if (state == 0) {
                      print("nilai tidak boleh kurang dari 0");
                    } else {
                      context.read<HomePageCubit>().decrement();
                    }
                  },
                  child: const Text(
                    'Decrement',
                  ),
                );
              },
            ),
            SizedBox(
              height: 16,
            ),
            BlocBuilder<HomePageListCubit, List<String>>(
              builder: (context, state) {
                return ElevatedButton(
                  onPressed: () {
                    context.read<HomePageListCubit>().fetchData();
                  },
                  child: const Text(
                    'Get Data',
                  ),
                );
              },
            ),
            BlocBuilder<HomePageListCubit, List<String>>(
              builder: (context, state) {
                if (state.isEmpty) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ListView.builder(
                  itemCount: state.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(state[index]),
                    );
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
