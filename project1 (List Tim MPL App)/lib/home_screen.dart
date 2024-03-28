import 'package:flutter/material.dart';
import 'package:project1_arfan/button_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/homescreen.jpg', // Lokasi gambar
            fit: BoxFit.cover, // Sesuaikan ukuran gambar
            width: double.infinity,
            height: double.infinity,
            color: Colors.white.withOpacity(0.6), // Opasitas gambar 0.5
            colorBlendMode:
                BlendMode.dstATop, // BlendMode untuk menurunkan opasitas gambar
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0), // Shape rounded
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(160, 51, 51, 51)
                            .withOpacity(0.7),
                        spreadRadius: 10,
                        blurRadius: 20,
                        offset: const Offset(0, 2), // Penyebaran bayangan
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'Selamat Datang di',
                        style: TextStyle(fontSize: 24.0, color: Colors.white),
                      ),
                      const Text(
                        'MPL Indonesia!',
                        style: TextStyle(
                          fontSize: 36.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      ButtonContainer(
                        onPressed: () {
                          Navigator.pushNamed(context, '/team_list');
                        },
                        child: const Text(
                          'Lihat Tim Favoritmu',
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255)),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
