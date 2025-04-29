import 'package:flutter/material.dart';
import 'package:ucp1/detail_pelanggan.dart';

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
  final TextEditingController namaCustController = TextEditingController();
  final TextEditingController emailCustController = TextEditingController();
  final TextEditingController phoneCustController = TextEditingController();
  final TextEditingController alamatCustController = TextEditingController();
  final TextEditingController provinsiCustController = TextEditingController();
  final TextEditingController kodePosCustController = TextEditingController();

  List<Map<String, String>> dataPelanggan = [];

  @override
  Widget build(BuildContext context) {
    
  }
}
