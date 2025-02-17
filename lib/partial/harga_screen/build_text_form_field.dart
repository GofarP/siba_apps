
import 'package:flutter/material.dart';

Widget buildTextFormField(String label, TextEditingController controller) {
      return Column(
        children: [
          Center(
            child: Text(
              label,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
          TextFormField(
            controller: controller,
            style: const TextStyle(color: Colors.black),
            validator: (val) {
              if (val == null || val.isEmpty) {
                return "Silahkan masukkan $label";
              }
              if (double.tryParse(val) == null) {
                return "Silahkan masukkan angka yang valid";
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
        ],
      );
    }