import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:siba_apps/models/kabupaten_kota.dart';


Future<List<Map<String, dynamic>>> getKabupatenKotaServices() async {
  try {
    var response = await http.get(Uri.parse("${dotenv.env['API_URL']}/getkabupatenkota"));

    if (response.statusCode == 200) {
      List<dynamic> jsonData = jsonDecode(response.body)['data'];

      // Cast each item in the list to Map<String, dynamic>
      List<Map<String, dynamic>> data = jsonData.map((item) => item as Map<String, dynamic>).toList();

      return data;
    } else {
      throw Exception('Failed to fetch data from the API');
    }
  } catch (e) {
    throw Exception('Failed to connect to the API: $e');
  }
}

Future<Map<String, dynamic>> cekHargaServices({
  required String daerahAsalId,
  required String daerahTujuanId,
  required String jenis,
  required int panjang,
  required int lebar,
  required int tinggi,
  required int berat,

})async{
  final response=await http.post(
    Uri.parse("${dotenv.env['API_URL']}/cekharga"),
    body: {
      'daerah_asal_id':daerahAsalId.toString(),
      'daerah_tujuan_id':daerahTujuanId.toString(),
      'jenis':jenis,
      'panjang':panjang.toString(),
      'lebar':lebar.toString(),
      'tinggi':tinggi.toString(),
      'berat':berat.toString(),
    },
  );

  if(response.statusCode==200){
    return jsonDecode(response.body);
  }
  else if(response.statusCode==404){
    return jsonDecode(response.body);
  }
  else{
    throw Exception('Failed to connect');
  }
}

// Future<ApiResponse> getHargaServices() async {
  
//   try {
//     var hargaResponse =
//       await http.post(Uri.parse("${dotenv.env['API_URL']}/cekharga"), body: {
//       "daerah_asal_id": 153,
//       "daerah_tujuan_id": 53,
//       "jenis": 'elektronik',
//       "panjang": 0,
//       "lebar": 0,
//       "tinggi": 0,
//       "berat": 0
//     });

//     switch (hargaResponse.statusCode) {
//       case 200:
//         debugPrint("OK");
//         break;
//       case 404:
//         debugPrint("Data Tidak Ditemukan");
//         break;
//       case 500:
//         debugPrint("Internal Server Error");
//       default:
//         debugPrint("Error ${hargaResponse.statusCode}");
//     }
//   } catch (e) {
//     apiResponse.error = e.toString();
//   }

//   return apiResponse;

// }
