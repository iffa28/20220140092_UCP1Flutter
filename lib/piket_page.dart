
import 'package:flutter/material.dart';

class PiketPage extends StatefulWidget {
  final String namausr;
  const PiketPage({super.key,
  required this.namausr
  });

  @override
  State<PiketPage> createState() => _PiketPageState();
}

class _PiketPageState extends State<PiketPage> {
  List<Map<String, String>> tugasPiket = []; // Daftar tugas piket
  final TextEditingController namaController = TextEditingController();
  final TextEditingController tanggalController = TextEditingController();
  final TextEditingController tugasController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    
  }
}
