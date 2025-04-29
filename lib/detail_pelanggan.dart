import 'package:flutter/material.dart';
import 'package:ucp1/home_page.dart';

class DetailPelanggan extends StatelessWidget {
  //parsing akun
  final String nmAkun;
  final String emailAkun;
  final String pwAkun;

  final String nama;
  final String email;
  final String phone;
  final String alamat;
  final String provinsi;
  final String kodePos;
  const DetailPelanggan({
    super.key,
    required this.nmAkun,
    required this.emailAkun,
    required this.pwAkun,

    required this.nama,
    required this.email,
    required this.phone,
    required this.alamat,
    required this.provinsi,
    required this.kodePos,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail $nama', style: TextStyle(fontSize: 24)),
        backgroundColor: const Color(0XFF2D336B),
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 16),
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('assets/images/profile.jpg'),
                  ),
                  Text('$nama',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
                  const SizedBox(height: 8),
                  Text('$email'),
                  const SizedBox(height: 5),
                  Text('$phone'),
                ],
              ),
            ),
            const SizedBox(height: 13),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Alamat",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Container(
                  width: 500,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      // tambahkan ini
                      color: Colors.black, // warna border
                      width: 1.5, // ketebalan border
                    ),
                  ),

                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 13),

                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text('$alamat'),
                    ),
                  ),
                ),

                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Provinsi",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          width: 180,
                          height: 50,

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              // tambahkan ini
                              color: Colors.black, // warna border
                              width: 1.5, // ketebalan border
                            ),
                          ),

                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 13),

                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text('$provinsi'),
                            ),
                          ),
                        ),
                      ],
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Kode Pos",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          width: 150,
                          height: 50,

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              // tambahkan ini
                              color: Colors.black, // warna border
                              width: 1.5, // ketebalan border
                            ),
                          ),

                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 13),

                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text('$kodePos'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 30),

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
          ],
        ),
      ),
    );
  }
}
