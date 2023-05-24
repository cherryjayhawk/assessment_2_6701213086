
import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  SecondPage(this.data, {super.key});

  List<String> data = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Transaksi")
        ),
      body: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Nama Barang : " + data[0]),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Deskripsi : " + data[1]),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Harga : " + data[2]),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Dikerjakan Oleh : 6701213086 - Muhammad Bintang Ramadhan"),
              ),
            ],
          ),
        )
    );
  }
}

