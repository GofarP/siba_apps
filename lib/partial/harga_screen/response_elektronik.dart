import 'package:flutter/material.dart';

Widget responseElektronik(
    String kotaAsal, String kotaTujuan, Map<String, dynamic>? hargaData) {
  return Column(
    children: [
      Center(
        child: Text(
          "Tarif Kirim Elektronik Dari $kotaAsal Ke $kotaTujuan",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
      Column(
        children: [
          for (var item in hargaData?['data'])
            SizedBox(
                width: double.infinity,
                child: Card(
                  margin: EdgeInsets.all(16.0),
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Expanded(
                              flex: 1,
                              child: Text(
                                "Asal:",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                "${item['daerah_asal']['nama']}",
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            const Expanded(
                              flex: 1,
                              child: Text(
                                "Tujuan:",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                "${item['daerah_tujuan']['nama']}",
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            const Expanded(
                              flex: 1,
                              child: Text(
                                "Jenis Barang:",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                "${item['nama']}",
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            const Expanded(
                              flex: 1,
                              child: Text(
                                "Unit:",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                "${item['unit']}",
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            const Expanded(
                              flex: 1,
                              child: Text(
                                "Harga:",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                "${item['harga']}",
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            const Expanded(
                              flex: 1,
                              child: Text(
                                "Estimasi:",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                "${item['estimasi']}",
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ))
        ],
      ),
    ],
  );
}
