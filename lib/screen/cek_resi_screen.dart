import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:siba_apps/models/api_response.dart';
import 'package:siba_apps/models/mtc.dart';
import 'package:siba_apps/partial/cek_resi_screen/response_alamat_penerima_pengirim.dart';
import 'package:siba_apps/partial/cek_resi_screen/response_beginning.dart';
import 'package:siba_apps/partial/cek_resi_screen/response_detail_resi.dart';
import 'package:siba_apps/partial/cek_resi_screen/response_not_found.dart';
import 'package:siba_apps/partial/cek_resi_screen/response_perjalanan_paket.dart';
import 'package:siba_apps/services/cek_resi_services.dart';
import 'package:siba_apps/utility/enum_cek_resi.dart';
import 'package:siba_apps/utility/network_connection.dart';

class CekResiScreen extends StatefulWidget {
  const CekResiScreen({super.key});

  @override
  State<CekResiScreen> createState() => _CekResiScreenState();
}

class _CekResiScreenState extends State<CekResiScreen> {
  Status status = Status.beginning;

  Map _source = {ConnectivityResult.none: false};

  final NetworkConnection _connectivity = NetworkConnection.instance;

  TextEditingController noResiC = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isDialogOpen = false, _isOnline = false, _isLoading = false;

  late Mtc mtc;

  Future<void> _getDataMtc(String noResi) async {
    // Set _isLoading to true before starting the data fetch
    setState(() {
      _isLoading = true;
    });

    try {
      // Fetch data from the service
      ApiResponse apiResponse = await getDataMTCServices(noResi).timeout(const Duration(seconds: 5));

      // Process the response based on the result
      if (apiResponse.error == null) {
        setState(() {
          mtc = apiResponse.data as Mtc;
          status = Status.found;
        });
      } else if (apiResponse.error == "404") {
        setState(() {
          status = Status.notfound;
        });
      } else {
        debugPrint('Error: ${apiResponse.error}');
      }
    } on TimeoutException catch (e) {
      debugPrint('Timeout: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Gagal Menghubungkan Ke Internet. Silahkan Coba Lagi.'),
          duration: Duration(seconds: 3),
        ),
      );
    } catch (e) {
      // Handle any exceptions
      debugPrint('Exception: $e');
    } finally {
      // Ensure _isLoading is set to false regardless of success or failure
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    _connectivity.initialise();
    _isOnline = _connectivity.isOnline;

    _connectivity.myStream.listen((source) {
      setState(() {
        _source = source;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_isOnline && !_isDialogOpen) {
        _isDialogOpen = true;
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) {
              return PopScope(
                  canPop: false,
                  onPopInvoked: (didPop) {
                    if (didPop) {
                      return;
                    }
                  },
                  child: const AlertDialog(
                    title: Text('Tidak Ada Koneksi Internet'),
                    content: Text(
                        'Silahkan Cek Koneksi Internet Anda Terlebih Dahulu'),
                  ));
            });
      }

      String connectivityResult = _source.keys.toList()[0].toString();

      switch (connectivityResult) {
        case "[ConnectivityResult.mobile]":
          debugPrint("Inet is up and on mobile, isOnline:$_isOnline");

          if (_isDialogOpen) {
            Navigator.of(context).pop(); // Dismiss the dialog if open
            _isDialogOpen = false; // Reset the dialog status
          }

          break;

        case "[ConnectivityResult.wifi]":
          debugPrint("Inet is up and on wifi, isOnline:$_isOnline");
          if (_isDialogOpen) {
            Navigator.of(context).pop(); // Dismiss the dialog if open
            _isDialogOpen = false; // Reset the dialog status
          }
          break;

        case "[ConnectivityResult.none]":
          debugPrint("No internet detected");
          if (!_isDialogOpen) {
            _isDialogOpen = true;
            showDialog(
                barrierDismissible: false,
                context: context,
                builder: (BuildContext context) {
                  return PopScope(
                      canPop: false,
                      onPopInvoked: (didPop) {
                        if (didPop) {
                          return;
                        }
                      },
                      child: const AlertDialog(
                        title: Text('Tidak Ada Koneksi Internet'),
                        content: Text(
                            'Silahkan Cek Koneksi Internet Anda Terlebih Dahulu'),
                      ));
                });
          }
      }
    });

    return Scaffold(
      body: Stack(
        children: [
          Container(
              height: double.infinity,
              width: double.infinity,
              color: const Color(0xFF61A4F1)),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: screenHeight * 0.1),
                const Padding(
                  padding: EdgeInsets.only(top: 35, bottom: 15),
                  child: Center(
                    child: Text(
                      "CEK RESI",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Card(
                  margin: const EdgeInsets.all(16.0),
                  color: Colors.white,
                  child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Form(
                              key: _formKey,
                              child: TextFormField(
                                controller: noResiC,
                                style: const TextStyle(color: Colors.black),
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return 'Silahkan Isi Nomor Resi Anda';
                                  } else if (int.tryParse(val) == null) {
                                    return "Silahkan Masukkan Angka";
                                  }
                                },
                                decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.all(14.0),
                                    hintText: "Masukkan No Resi",
                                    hintStyle: TextStyle(color: Colors.grey),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.blue, width: 1.0),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.blue, width: 1.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.blue, width: 1.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.blue, width: 1.0))),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                            const SizedBox(height: 16.0),
                            ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  setState(() {
                                    _getDataMtc(noResiC.text);
                                  });
                                }
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        const Color.fromRGBO(97, 164, 241, 1)),
                              ),
                              child: Stack(
                                alignment: Alignment
                                    .center, // Center the spinner and text
                                children: [
                                  if (_isLoading)
                                    const SizedBox(
                                      width: 24,
                                      height: 24,
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                        strokeWidth: 2,
                                      ),
                                    ),
                                  if (!_isLoading)
                                    const Text(
                                      "Cek Resi Anda",
                                      style: TextStyle(color: Colors.white),
                                      textAlign: TextAlign.center,
                                    ),
                                ],
                              ),
                            )
                          ])),
                ),
                if (status == Status.beginning) ...[
                  responseBeginning()
                ] else if (status == Status.notfound) ...[
                  responseNotFound()
                ] else if (status == Status.found) ...[
                  responseDetailResi(mtc),
                  responseAlamatPenerimaPengirim(mtc),
                  responsePerjalananPaket(mtc)
                ]
              ],
            ),
          )
        ],
      ),
    );
  }
}
