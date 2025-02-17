import "package:flutter/material.dart";

import "../../models/mtc.dart";

Widget responseDetailResi(Mtc mtc) {
  return Column(
    children: [
      const SizedBox(
        height: 40,
        child: Column(
          children: [
            Expanded(
                child: Center(
              child: Text(
                "Detail Resi",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
            ))
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(
                      child: Text(
                        'No Resi/Stt:',
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
                      mtc.resi,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                      ),
                      textAlign: TextAlign.center,
                    ))
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(
                      child: Text(
                        'Asal:',
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
                      mtc.dataManifest.daerahAsal,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                      ),
                      textAlign: TextAlign.center,
                    ))
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(
                      child: Text(
                        'Tujuan:',
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
                        mtc.dataManifest.daerahTujuan,
                        style: const TextStyle(
                            color: Colors.black, fontSize: 16.0),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ],
  );
}
