import 'package:flutter/material.dart';
import 'package:ucp1/login_page.dart';


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
      
    );
  }
}
