import 'package:flutter/material.dart';

class FutureBuilderPage extends StatefulWidget {
  const FutureBuilderPage({super.key});

  @override
  State<FutureBuilderPage> createState() => _FutureBuilderPageState();
}

class _FutureBuilderPageState extends State<FutureBuilderPage> {
  // Simulasi pengambilan data dari API
  Future<List<String>> fetchData() async {
    await Future.delayed(const Duration(seconds: 2)); // Simulasi loading
    return ['Item 1', 'Item 2', 'Item 3', 'Item 4'];
    // return [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('FutureBuilder Example'),
        ),
        body: FutureBuilder(
          future: fetchData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(
                  'Error: ${snapshot.error}',
                ),
              );
            } else if (snapshot.hasData) {
              // Tampilkan data
              final items = snapshot.data!;
              if (items.isNotEmpty) {
                return ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        items[index],
                      ),
                    );
                  },
                );
              } else {
                return const Center(child: Text('Tidak ada data.'));
              }
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        )

        // FutureBuilder<List<String>>(
        //   future: fetchData(),
        //   builder: (context, snapshot) {
        //     // Cek status Future
        //     if (snapshot.connectionState == ConnectionState.waiting) {
        //       return const Center(child: CircularProgressIndicator());
        //     } else if (snapshot.hasError) {
        //       return Center(child: Text('Error: ${snapshot.error}'));
        //     } else if (snapshot.hasData) {
        //       // Tampilkan data
        //       final items = snapshot.data!;
        //       return ListView.builder(
        //         itemCount: items.length,
        //         itemBuilder: (context, index) {
        //           return ListTile(
        //             title: Text(items[index]),
        //           );
        //         },
        //       );
        //     } else {
        //       return const Center(child: Text('Tidak ada data.'));
        //     }
        //   },
        // ),
        );
  }
}
