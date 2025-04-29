
import 'package:flutter/material.dart';


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

 

  @override
  Widget build(BuildContext context) {
    
  }
}
