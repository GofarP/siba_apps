import 'package:flutter/material.dart';

Widget responseBarangNotFound() {
return const Center(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        "Harga Barang Tidak Ditemukan",
        style: TextStyle(
          color: Colors.white,
          fontSize: 15,
        ),
      ),
      SizedBox(height: 15),
    ],
  ),
);

}
