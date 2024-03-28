// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'dart:math';
import 'gradient_container.dart';

class TeamListScreen extends StatelessWidget {
  const TeamListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'List Tim MPL Indonesia',
          style: TextStyle(fontSize: 18.0),
        ),
      ),
      body: const GradientContainer(
        colors: [
          Color.fromARGB(255, 255, 248, 248),
          Color.fromARGB(255, 248, 161, 161)
        ], // Sesuaikan dengan warna gradient yang Anda inginkan
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: TeamList(),
        ),
      ),
    );
  }
}

class TeamList extends StatelessWidget {
  const TeamList({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 15,
      crossAxisSpacing: 15,
      children: const [
        TeamItem(
          nama: 'RRQ Hoshi',
          gambarUrl:
              'https://mplid-storage.sgp1.digitaloceanspaces.com/data/teams/rrq-256.png?X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=DO009FUHAY8BZC8VR7EB%2F20240328%2Fsgp1%2Fs3%2Faws4_request&X-Amz-Date=20240328T051224Z&X-Amz-SignedHeaders=host&X-Amz-Expires=21600&X-Amz-Signature=46839163fbb4b130fffc8dabe139c25e876a4d861f975149bf0d6b8ad70cbe07',
        ),
        TeamItem(
          nama: 'ONIC Esport',
          gambarUrl:
              'https://mplid-storage.sgp1.digitaloceanspaces.com/data/teams/onic-b-256.png?X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=DO009FUHAY8BZC8VR7EB%2F20240328%2Fsgp1%2Fs3%2Faws4_request&X-Amz-Date=20240328T051224Z&X-Amz-SignedHeaders=host&X-Amz-Expires=21600&X-Amz-Signature=abd01df2eb55a0956b419640a51c45a1760f76d2fe21fa5d85c0878db441084f',
        ),
        TeamItem(
          nama: 'Alter Ego',
          gambarUrl:
              'https://mplid-storage.sgp1.digitaloceanspaces.com/data/teams/ae-256.png?X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=DO009FUHAY8BZC8VR7EB%2F20240328%2Fsgp1%2Fs3%2Faws4_request&X-Amz-Date=20240328T051224Z&X-Amz-SignedHeaders=host&X-Amz-Expires=21600&X-Amz-Signature=ec13ab27f27cea9ad4b0f20610a11c6e756bd64ac25e132662055d93528481ab',
        ),
        TeamItem(
          nama: 'Aura Fire',
          gambarUrl:
              'https://mplid-storage.sgp1.digitaloceanspaces.com/data/teams/aura-256.png?X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=DO009FUHAY8BZC8VR7EB%2F20240328%2Fsgp1%2Fs3%2Faws4_request&X-Amz-Date=20240328T051206Z&X-Amz-SignedHeaders=host&X-Amz-Expires=21600&X-Amz-Signature=c9bfd3c1c9ad41336ba18075a91622f998a95bb4f3cc03b8b46af166a958b796',
        ),
      ],
    );
  }
}

class TeamItem extends StatefulWidget {
  final String nama;
  final String gambarUrl;

  const TeamItem({
    super.key,
    required this.nama,
    required this.gambarUrl,
  });

  @override
  _TeamItemState createState() => _TeamItemState();
}

class _TeamItemState extends State<TeamItem> {
  String namaTim = '';
  final List<String> daftarNamaTim = [
    'RRQ Hoshi',
    'Aura Fire',
    'ONIC Esports',
    'Alter Ego'
  ];

  @override
  void initState() {
    super.initState();
    namaTim = widget.nama;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Column(
        children: [
          SizedBox(
            width: 90,
            height: 90,
            child: Image.network(
              widget.gambarUrl,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: Text(
              namaTim,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                namaTim = daftarNamaTim[Random().nextInt(daftarNamaTim.length)];
              });
            },
            child: const Text('Ubah Nama Tim'),
          ),
        ],
      ),
    );
  }
}
