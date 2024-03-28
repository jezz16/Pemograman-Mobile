// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class UbahTim extends StatefulWidget {
  const UbahTim({super.key});

  @override
  _UbahTimState createState() => _UbahTimState();
}

class _UbahTimState extends State<UbahTim> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ubah Judul Tim'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Tambahkan logika untuk mengubah judul tim di sini
          },
          child: const Text('Simpan Perubahan'),
        ),
      ),
    );
  }
}
