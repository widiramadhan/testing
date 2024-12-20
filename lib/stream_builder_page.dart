import 'package:flutter/material.dart';

class StreamBuilderPage extends StatelessWidget {
  const StreamBuilderPage({super.key});

  // Fungsi untuk menghasilkan stream angka secara berkala
  Stream<int> numberStream() async* {
    int counter = 0;
    while (true) {
      await Future.delayed(const Duration(seconds: 1)); // Delay 1 detik
      yield counter++; // Kirim nilai baru ke stream
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StreamBuilder Example'),
      ),
      body: Center(
        child: StreamBuilder<int>(
          stream: numberStream(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // Tampilkan indikator loading saat stream belum berjalan
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              // Tampilkan pesan error jika terjadi kesalahan
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData) {
              // Tampilkan data dari stream
              return Text(
                'Angka: ${snapshot.data}',
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              );
            } else {
              return const Text('Stream selesai.');
            }
          },
        ),
      ),
    );
  }
}
