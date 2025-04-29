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
  String? selectedJenisTransaksi;
  String? selectedJenisBarang;
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
    Future<DateTime?> _showDatePicker() async {
      return await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pendataan Barang', style: TextStyle(fontSize: 24)),
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
                    "Tanggal Transaksi",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),

                  //field untuk tanggal
                  DateTimeField(
                    controller: tglTransaksiController,
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
                    validator: (value) {
                      if (value == null) {
                        return 'Tanggal Transaksi tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  //dropdown untuk memilih jenis transaksi
                  DropdownButtonFormField<String>(
                    value: selectedJenisTransaksi,
                    items:
                        <String>['Barang Masuk', 'Barang Keluar'].map((
                          String value,
                        ) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedJenisTransaksi = newValue;
                      });
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      labelText: 'Jenis Transaksi',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Jumlah Transaksi tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  
                  //dropdown untuk memilih jenis barang dan automatis mengisi harga satuan
                  DropdownButtonFormField<String>(
                    value: selectedJenisBarang,

                    items:
                        <String>[
                          'Carrier',
                          'Sleeping Bag',
                          'Tenda',
                          'Sepatu',
                        ].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedJenisBarang = newValue;
                        hargaSatuanController.text =
                            hargaBarangMap[newValue]!.toString();
                      });
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      labelText: 'Jenis Barang',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Jenis Barang tidak boleh kosong';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 16),

                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Jumlah Barang",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),

                            //field jumlah barang
                            TextFormField(
                              controller: jumlahBrgController,
                              decoration: InputDecoration(
                                //membuat icon di start text field
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                hintText: 'Jumlah Barang',
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
                                  return 'Jumlah Barang tidak boleh kosong';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(width: 16),

                      //field harga satuan sudah terisi 

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Harga Satuan",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            TextFormField(
                              controller: hargaSatuanController,
                              decoration: InputDecoration(
                                prefixText: 'Rp.',

                                //membuat icon di start text field
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                hintText: 'Harga Satuan',
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
                                  return 'Jumlah Barang tidak boleh kosong';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        hitungTotalHarga();
                        setState(() {
                          dataBarang.add({
                            'tglTransaksi': tglTransaksiController.text,
                            'JenisTrans': selectedJenisTransaksi?.trim() ?? '',
                            'JenisBrg': selectedJenisBarang?.trim() ?? '',
                            'jumlahbrg': jumlahBrgController.text,
                            'satuan': hargaSatuanController.text,
                            'totalHarga': totalHarga.toString()
                          });
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => DetailBarang(
                                  nmAkun: widget.nmAkun,
                                emailAkun: widget.emailAkun,
                                pwAkun: widget.pwAkun,

                                tglTransaksi: dataBarang.last['tglTransaksi'] ?? '',
                                jenisBrg:  dataBarang.last['JenisBrg'] ?? '',
                                jenisTransaksi: dataBarang.last['JenisTrans'] ?? '',
                                jumlahBrg: dataBarang.last['jumlahbrg'] ?? '',
                                hgSatuan: dataBarang.last['satuan'] ?? '',
                                 totalHarga: totalHarga,
                                ),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      backgroundColor: Color(0XFF2D336B),
                      minimumSize: const Size(500, 70),
                    ),
                    child: Text(
                      'Simpan',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
