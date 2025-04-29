import 'package:flutter/material.dart';
import 'package:ucp1/barang_page.dart';
import 'package:ucp1/customer_page.dart';
import 'package:ucp1/login_page.dart';
import 'package:ucp1/piket_page.dart';

class HomePage extends StatefulWidget {
  final String nama;
  final String email;
  final String pw;

  const HomePage({super.key, required this.nama,
  required this.email, required this.pw});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90), // Set this height
        child: Container(
          color: Color(0XFF2D336B),
          child: Padding(
            padding: const EdgeInsets.only(top: 15.0, left: 20.0, right: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 35,
                          backgroundImage: AssetImage(
                            'assets/images/profile.jpg',
                          ),
                        ),

                        SizedBox(width: 15),

                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Selamat Datang',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              widget.nama,
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,

                  children: [
                    IconButton(
                      icon: Icon(Icons.logout, color: Colors.white),
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => LoginPage(
                                  namaUser: widget.nama,
                                  email: widget.email,
                                  password: widget.pw,
                                ),
                          ),
                          (route) => false,
                        );
                        // Handle notification icon press
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        color: Color(0XFFF1E7E7),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                color: Colors.brown,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Image.asset('assets/images/food.png', width: 150),
                              const SizedBox(height: 15),
                            ],
                          ),
                          SizedBox(width: 13),

                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Dapatkan Diskon 25% disetiap harinya',
                                  style: TextStyle(
                                    fontSize: 21,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                  softWrap: true,
                                  overflow: TextOverflow.visible,
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  child: Text('Order now'),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PiketPage(namausr: widget.nama),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0XFF2D336B),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      minimumSize: Size(150, 150),
                    ),

                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 42,
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/piket.png',
                            width: 55,
                            color: Colors.white,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Data Piket',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                  ),

                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CustomerPage(
                            nmAkun: widget.nama,
                            emailAkun: widget.email,
                            pwAkun: widget.pw,
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0XFF2D336B),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      minimumSize: Size(150, 150),
                    ),

                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 42,
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/customer.png',
                            width: 55,
                            color: Colors.white,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Data Pelanggan',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BarangPage(
                            nmAkun: widget.nama,
                            emailAkun: widget.email,
                            pwAkun: widget.pw,
                          ),
                        ),
                      );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0XFF2D336B),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  minimumSize: Size(150, 150),
                ),

                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 89,
                    vertical: 42,
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 8),
                      Image.asset(
                        'assets/images/things.png',
                        width: 55,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Barang masuk/keluar',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
