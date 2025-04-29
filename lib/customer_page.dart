import 'package:flutter/material.dart';

class CustomerPage extends StatefulWidget {
  final String nmAkun;
  final String emailAkun;
  final String pwAkun;
  
  const CustomerPage({super.key,
  required this.nmAkun,
  required this.emailAkun, required this.pwAkun
  });

  @override
  State<CustomerPage> createState() => _CustomerPageState();
}

class _CustomerPageState extends State<CustomerPage> {
  List<Map<String, String>> dataPelanggan = [];

  @override
  Widget build(BuildContext context) {
    
    
  }
}
