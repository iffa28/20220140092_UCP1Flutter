import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ucp1/detail_piket.dart';

class PiketPage extends StatefulWidget {
  final String namausr;
  const PiketPage({super.key, required this.namausr});

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
    Future<DateTime?> _showDatePicker() async {
      return await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
      );
    }

    namaController.text = widget.namausr;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Piket Gudang', style: TextStyle(fontSize: 24)),
        backgroundColor: const Color(0XFF2D336B),
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Nama Anggota",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: namaController,
                    enabled: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      hintText: 'Nama Lengkap',
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.indigo,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Nama tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  Text(
                    "Pilih Tanggal",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),

                  DateTimeField(
                    controller: tanggalController,
                    format: DateFormat("E,dd MMMM yyyy"),
                    initialValue: DateTime.now(),
                    decoration: InputDecoration(
                      prefixIcon: Align(
                        widthFactor: 1.0,
                        heightFactor: 1.0,
                        child: Icon(Icons.calendar_today),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      hintText: 'Tanggal',
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.indigo,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    onShowPicker: (context, currentValue) {
                      return _showDatePicker();
                    },
                  ),
                  const SizedBox(height: 16),

                  Text(
                    "Tugas Piket",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),

                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: tugasController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            hintText: 'Tugas Piket',
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.indigo,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Tugas piket tidak boleh kosong';
                            }
                            return null;
                          },
                        ),
                      ),

                      const SizedBox(width: 16),

                      ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            setState(() {
                              // Menambahkan tugas piket ke dalam daftar
                              tugasPiket.add({
                                'tugas': tugasController.text,
                                'nama': namaController.text,
                                'tanggal': tanggalController.text,
                              });
                              tugasController.clear();
                              tanggalController.clear();
                            });
                          }
                        },
                        child: Text("Tambah"),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
          Center(
            child: Column(
              children: [
                Text(
                  'Daftar Tugas Piket',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),

                Center(
                  child:
                      tugasPiket.isEmpty
                          ? Center(
                            child: const Text('Tidak ada tugas piket'),
                          ) // Show this if the list is empty
                          : ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: tugasPiket.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Card(
                                  color: Color(0XFF2D336B),
                                  child: ListTile(
                                    title: Text(
                                      tugasPiket[index]['tugas'] ?? '',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder:
                                              (context) => DetailPiketPage(
                                                nama:
                                                    tugasPiket[index]['nama'] ??
                                                    '',
                                                tanggal:
                                                    tugasPiket[index]['tanggal'] ??
                                                    '',
                                                tugas:
                                                    tugasPiket[index]['tugas'] ??
                                                    '',
                                              ),
                                        ),
                                      );
                                    },
                                    trailing: Icon(
                                      Icons.keyboard_arrow_right_sharp,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              );
                            },
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
