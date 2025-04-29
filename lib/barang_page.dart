import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ucp1/detail_barang.dart';

class BarangPage extends StatefulWidget {
  final String nmAkun;
  final String emailAkun;
  final String pwAkun;
  const BarangPage({super.key,
  required this.nmAkun,
  required this.emailAkun, required this.pwAkun
  });

  @override
  State<BarangPage> createState() => _BarangPageState();
}

class _BarangPageState extends State<BarangPage> {

  final TextEditingController tglTransaksiController = TextEditingController();
  final TextEditingController hargaSatuanController = TextEditingController();
  final TextEditingController jumlahBrgController = TextEditingController();

  List<Map<String, String>> dataBarang = [];

  final Map<String, int> hargaBarangMap = {
    'Carrier': 700000,
    'Sleeping Bag': 100000,
    'Tenda': 200000,
    'Sepatu': 400000,
  };

  int totalHarga = 0;

  void hitungTotalHarga() {
    int hargaSatuan = int.tryParse(hargaSatuanController.text) ?? 0;
    int jumlahBrg = int.tryParse(jumlahBrgController.text) ?? 0;

    setState(() {
      totalHarga = (jumlahBrg * hargaSatuan);
    });
  }

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    
  }
}
