import "package:flutter/material.dart";

Widget responseNotFound() {
  return const Center(
    child: Text(
      "Resi Tidak Ditemukan",
      style: TextStyle(
        color: Colors.white,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    ),
  );
}
