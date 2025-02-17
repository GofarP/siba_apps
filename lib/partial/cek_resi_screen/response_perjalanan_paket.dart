import 'package:flutter/material.dart';
import "../../models/mtc.dart";

Widget responsePerjalananPaket(Mtc mtc) {
  return Column(
    children: [
      const SizedBox(
        height: 40,
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Text(
                  "Perjalanan Paket",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
      SizedBox(
        width: double.infinity,
        child: Card(
          margin: const EdgeInsets.all(16.0),
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (mtc.dataMtc.isEmpty)
                  const Center(
                    child: Text("Belum Ada Perjalanan Paket",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold)),
                  )
                else
                  for (var item in mtc.dataMtc)
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                child: Text(
                              item.tanggalUpdate,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            )),
                            Expanded(
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    item.statusManifes,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    item.keteranganManifes,
                                    style: const TextStyle(color: Colors.black),
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 10)
                      ],
                    )
              ],
            ),
          ),
        ),
      )
    ],
  );
}
