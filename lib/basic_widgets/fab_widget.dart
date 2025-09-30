import 'package:flutter/material.dart';

class FabWidget extends StatelessWidget {
  const FabWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // biar lebih clean
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Contoh FloatingActionButton"),
          centerTitle: true,
        ),
        body: const Center(
          child: Text("Tekan tombol FAB di kanan bawah"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Aksi ketika FAB ditekan
            debugPrint("FAB ditekan!");
          },
          backgroundColor: Colors.pink,
          child: const Icon(Icons.thumb_up),
        ),
      ),
    );
  }
}
