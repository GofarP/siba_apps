import 'package:flutter/material.dart';

Widget responseBeginning() {
  return const Padding(
    padding: EdgeInsets.only(top: 10),
    child: Center(
      child: Text(
        "Silahkan Masukkan Resi Anda Terlebih Dahulu",
        style: TextStyle(
            color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    ),
  );
}
