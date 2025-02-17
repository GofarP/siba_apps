import 'package:flutter/material.dart';

Widget responseBarang(
    String kotaAsal, String kotaTujuan, Map<String, dynamic>? hargaData) {
  return Column(
    children: [
      Center(
        child: Text(
          "Tarif Pengiriman $kotaAsal Ke $kotaTujuan",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
      const SizedBox(height: 20),
      SizedBox(
        width: double.infinity,
        child: Card(
          margin: EdgeInsets.all(16.0),
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(
                      child: Text(
                        "Asal Tujuan:",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "$kotaAsal - $kotaTujuan",
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(
                      child: Text(
                        "Layanan:",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        hargaData?['data']['daerah']['servis']['nama'],
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
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(
                      child: Text(
                        "Berat Minimum:",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        hargaData?['data']['daerah']['berat_minimal'] + " "+"KG",
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(
                      child: Text(
                        "Estimasi",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        hargaData?['data']['daerah']['estimasi'],
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      const SizedBox(height: 20),
      SizedBox(
        width: double.infinity,
        child: Card(
          margin: EdgeInsets.all(16.0),
          color: Colors.white,
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    hargaData?['data']['berat_aktual'],
                    style: const TextStyle(color: Colors.black, fontSize: 15),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    hargaData?['data']['berat_diambil'],
                    style: const TextStyle(color: Colors.black, fontSize: 15),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    hargaData?['data']['hitungan_volume_darat_laut'],
                    style: const TextStyle(color: Colors.black, fontSize: 15),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    hargaData?['data']['hitungan_volume_udara'],
                    style: const TextStyle(color: Colors.black, fontSize: 15),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    hargaData?['data']['hitungan_kubikasi'],
                    style: const TextStyle(color: Colors.black, fontSize: 15),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    hargaData?['data']['total_biaya'],
                    style: const TextStyle(color: Colors.black, fontSize: 15),
                  )
                ],
              )),
        ),
      ),
      const SizedBox(height: 15)
    ],
  );
}
