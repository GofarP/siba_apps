import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:siba_apps/models/api_response.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:convert';

import 'package:siba_apps/models/mtc.dart';

Future<ApiResponse> getDataMTCServices(String noResi) async {
  ApiResponse apiResponse = ApiResponse();

  try {
    var resiResponse =
        await http.post(Uri.parse("${dotenv.env['API_URL']}/cekresi"), body: {
      "resi": noResi,
    });

    switch (resiResponse.statusCode) {
      case 200:
        Map<String, dynamic> responseBody = jsonDecode(resiResponse.body);
        dynamic mtcData = responseBody['Mtc'];

        Mtc mtc = Mtc.fromJson(mtcData);
        apiResponse.data = mtc;

        break;

      case 404:
        apiResponse.error = "404";
        break;

      case 501:
        apiResponse.error = "501";
        break;
      default:
        apiResponse.error = "Unknown Error";
    }
  } catch (e) {
    apiResponse.error = "Error: $e";
  }

  return apiResponse;
}
