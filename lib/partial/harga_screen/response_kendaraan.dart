import 'package:flutter/material.dart';

Widget responseKendaraan(
    String kotaAsal, String kotaTujuan, Map<String, dynamic>? hargaData) {
  return Column(
    children: [
      Center(
        child: Text(
          "Tarif Kirim Kendaraan Dari $kotaAsal Ke $kotaTujuan",
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
                              child: Text(
                            "Asal:",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          )),
                          Expanded(
                            child: Text(
                              kotaAsal,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          const Expanded(
                              child: Text(
                            "Tujuan:",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          )),
                          Expanded(
                            child: Text(
                              kotaTujuan,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          const Expanded(
                              child: Text(
                            "Jenis Barang:",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          )),
                          Expanded(
                            child: Text(
                              hargaData?['tipe_biaya'],
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          const Expanded(
                              child: Text(
                            "Harga:",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          )),
                          Expanded(
                            child: Text(
                              item['harga'],
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          const Expanded(
                              child: Text(
                            "Estimasi:",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          )),
                          Expanded(
                            child: Text(
                              item['estimasi'],
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
        ],
      )
    ],
  );
}
