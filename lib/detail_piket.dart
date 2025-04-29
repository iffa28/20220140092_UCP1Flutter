import 'package:flutter/material.dart';

class DetailPiketPage extends StatelessWidget {
  final String nama;
  final String tanggal;
  final String tugas;
  
  const DetailPiketPage({super.key,
    required this.nama,
    required this.tanggal,
    required this.tugas,
  });
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail $tugas', style: TextStyle(fontSize: 24)),
        backgroundColor: const Color(0XFF2D336B),
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('$tanggal',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Container(
                  width: 150,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Color(0XFF2D336B)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '$nama',
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                    ),]
                  ),)

              ],
            ),
            const SizedBox(height: 16),

            Container(
                  width: 500,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0XFF2D336B)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$tugas',
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                      ),]
                    ),
                  ),)
          ],
        ),
      ),
    );
  }
}