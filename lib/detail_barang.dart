import 'package:flutter/material.dart';
import 'package:ucp1/home_page.dart';

class DetailBarang extends StatelessWidget {
  //parsing akun
  final String nmAkun;
  final String emailAkun;
  final String pwAkun;

  final String tglTransaksi;
  final String jenisTransaksi;
  final String jenisBrg;
  final String jumlahBrg;
  final String hgSatuan;
  final int totalHarga;

  const DetailBarang({
    super.key,
    required this.nmAkun,
    required this.emailAkun,
    required this.pwAkun,

    required this.tglTransaksi,
    required this.jenisBrg,
    required this.jenisTransaksi,
    required this.jumlahBrg,
    required this.hgSatuan,
    required this.totalHarga
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Column(
              
              children: [
                Container(
                  width: 180,
                          height: 350,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/success.png', height: 100),
              const SizedBox(height: 30),
                        Text('Data berhasil tersimpan', style: TextStyle(fontSize: 16),)
                      ],
                    ),
                  ),
                )
                
        
              ],
            ),
        
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical:5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Tanggal'),
                      Text('$tglTransaksi')
                    ],
                  ),
                ),
                Divider(thickness: 1),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical:5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Jenis Transaksi'),
                      Text('$jenisTransaksi')
                    ],
                  ),
                ),
                Divider(thickness: 1),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical:5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Jenis Barang'),
                      Text('$jenisBrg')
                    ],
                  ),
                ),
                Divider(thickness: 1),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical:5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Jumlah Barang'),
                      Text('$jumlahBrg')
                    ],
                  ),
                ),
                Divider(thickness: 1),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical:5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Harga satuan'),
                      Text('Rp.$hgSatuan')
                    ],
                  ),
                ),
                Divider(thickness: 1),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical:5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total Harga'),
                      Text('Rp.$totalHarga')
                    ],
                  ),
                ),
                Divider(thickness: 1),
              ],
            ),
            const SizedBox(height: 25),

            ElevatedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => HomePage(nama: nmAkun, email: emailAkun, pw: pwAkun),
                      ),
                      (route) => false, 
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    backgroundColor: Color(0XFF2D336B),
                    minimumSize: const Size(500, 50),
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

    );
  }
}
