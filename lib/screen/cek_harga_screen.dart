import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:siba_apps/partial/harga_screen/build_text_form_field.dart';
import 'package:siba_apps/partial/harga_screen/dropdown_kota_asal.dart';
import 'package:siba_apps/partial/harga_screen/dropdown_kota_tujuan.dart';
import 'package:siba_apps/partial/harga_screen/response_barang.dart';
import 'package:siba_apps/partial/harga_screen/response_barang_not_found.dart';
import 'package:siba_apps/partial/harga_screen/response_elektronik.dart';
import 'package:siba_apps/partial/harga_screen/response_else.dart';
import 'package:siba_apps/partial/harga_screen/response_error.dart';
import 'package:siba_apps/partial/harga_screen/response_kendaraan.dart';
import 'package:siba_apps/services/cek_harga_services.dart';
import 'package:siba_apps/utility/network_connection.dart';

class CekHargaScreen extends StatefulWidget {
  const CekHargaScreen({super.key});
  @override
  State<CekHargaScreen> createState() => _CekHargaScreenState();
}

class _CekHargaScreenState extends State<CekHargaScreen> {
  Future<List<Map<String, dynamic>>>? _futureKabupatenKota;

  Map<String, dynamic>? hargaData;

  Map _source = {ConnectivityResult.none: false};

  final NetworkConnection _connectivity = NetworkConnection.instance;

  bool _isDialogOpen = false, _isOnline = false;

  late List<Map<String, dynamic>> kabupatenKotaList;

  String kotaAsal = "",
      kotaAsalId = "",
      kotaTujuan = "",
      kotaTujuanId = "",
      jenis = "";

  int panjang = 0, lebar = 0, tinggi = 0, berat = 0;

  String jenisPengiriman = "";

  bool sudahDicari = false, suksesAmbilData = true;

  TextEditingController beratC = TextEditingController();
  TextEditingController panjangC = TextEditingController();
  TextEditingController lebarC = TextEditingController();
  TextEditingController tinggiC = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    _futureKabupatenKota = getKabupatenKotaServices();
    panjangC.text = "0";
    lebarC.text = "0";
    tinggiC.text = "0";
    beratC.text = "0";

    _connectivity.initialise();
    _isOnline = _connectivity.isOnline;
    _connectivity.myStream.listen((source) {
      setState(() {
        _source = source;
      });
    });
  }

  void selectedKotaAsal(String? selectedValue) {
    Map<String, dynamic>? firstDataMap =
        kabupatenKotaList.firstWhere((map) => map['nama'] == selectedValue);

    kotaAsalId = firstDataMap['id'].toString();
    kotaAsal = selectedValue.toString();
  }

  void selectedKotaTujuan(String? selectedValue) {
    Map<String, dynamic>? firstDataMap =
        kabupatenKotaList.firstWhere((map) => map['nama'] == selectedValue);

    kotaTujuanId = firstDataMap['id'].toString();
    kotaTujuan = selectedValue.toString();
  }

  Future<void> cekHarga() async {
    try {
      final data = await cekHargaServices(
        daerahAsalId: kotaAsalId,
        daerahTujuanId: kotaTujuanId,
        jenis: jenisPengiriman.toLowerCase(),
        panjang: int.parse(panjangC.text),
        lebar: int.parse(lebarC.text),
        tinggi: int.parse(tinggiC.text),
        berat: int.parse(beratC.text),
      );
      setState(() {
        hargaData = data;
      });
      sudahDicari = true;
      debugPrint(hargaData.toString());
    } catch (e) {
      print('Failed to load data $e');
    }
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

    bool validateInputs() {
      bool invalid = false;
      final validationMessages = {
        kotaAsalId: "Silahkan Pilih Kota Asal",
        kotaTujuanId: "Silahkan Pilih Kota Tujuan",
        jenisPengiriman: "Silahkan Pilih Jenis Pengiriman",
        if (jenisPengiriman == 'Barang' && beratC.text == "0")
          'berat': "Silahkan Masukkan Berat Barang",
        if (jenisPengiriman == 'Barang' && panjangC.text == "0")
          'panjang': "Silahkan Masukkan Panjang Barang",
        if (jenisPengiriman == 'Barang' && lebarC.text == "0")
          'lebar': "Silahkan Masukkan Lebar Barang",
        if (jenisPengiriman == 'Barang' && tinggiC.text == "0")
          'tinggi': "Silahkan Masukkan Tinggi Barang",
      };

      for (var entry in validationMessages.entries) {
        if (entry.key.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(entry.value)),
          );
          invalid = true;
        }
      }

      return invalid;
    }

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            color: const Color(0xFF61A4F1),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: screenHeight * 0.1),
                const Padding(
                  padding: EdgeInsets.only(top: 35, bottom: 15),
                  child: Center(
                    child: Text(
                      "CEK  HARGA",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Card(
                  margin: EdgeInsets.all(16.0),
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        FutureBuilder<List<Map<String, dynamic>>>(
                            future: _futureKabupatenKota,
                            builder: (context,
                                AsyncSnapshot<List<Map<String, dynamic>>>
                                    snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              } else if (snapshot.hasError) {
                                return Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text('Gagal Mengambil Data'),
                                      const SizedBox(height: 16),
                                      ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            _futureKabupatenKota =
                                                getKabupatenKotaServices();
                                          });
                                        },
                                        style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty
                                              .all<Color>(const Color.fromRGBO(
                                                  97,
                                                  164,
                                                  241,
                                                  1)), // Set your desired background color here
                                        ),
                                        child: const Text("Ambil Ulang Data",
                                            style:
                                                TextStyle(color: Colors.white)),
                                      )
                                    ],
                                  ),
                                );
                              } else {
                                kabupatenKotaList = snapshot.data!;

                                return Column(
                                  children: [
                                    const Text("Kota Asal",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        )),
                                    const SizedBox(height: 5),
                                    dropDownKotaAsal(
                                        kabupatenKotaList, selectedKotaAsal),
                                    const SizedBox(height: 23),
                                    const Text("Kota Tujuan",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold)),
                                    const SizedBox(height: 5),
                                    dropDownKotaTujuan(
                                        kabupatenKotaList, selectedKotaTujuan),
                                    const SizedBox(height: 23),
                                    const SizedBox(
                                      child: Text("Jenis Pengiriman",
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          )),
                                    ),
                                    const SizedBox(height: 5),
                                    DropdownSearch<String>(
                                      popupProps: const PopupProps.menu(
                                        showSelectedItems: true,
                                        showSearchBox: true,
                                      ),
                                      items: const [
                                        'Kendaraan',
                                        'Barang',
                                        'Elektronik'
                                      ],
                                      dropdownDecoratorProps:
                                          const DropDownDecoratorProps(
                                        dropdownSearchDecoration:
                                            InputDecoration(
                                          hintText: "Pilih Jenis Pengiriman",
                                        ),
                                      ),
                                      onChanged: (value) {
                                        setState(() {
                                          jenisPengiriman = value.toString();
                                        });
                                      },
                                    ),
                                    const SizedBox(height: 25),
                                    if (jenisPengiriman == "Barang")
                                      Form(
                                          child: Column(
                                        children: [
                                          buildTextFormField(
                                              "Berat (KG)", beratC),
                                          buildTextFormField(
                                              "Panjang (CM)", panjangC),
                                          buildTextFormField(
                                              "Lebar (CM)", lebarC),
                                          buildTextFormField(
                                              "Tinggi (CM)", tinggiC),
                                        ],
                                      )),
                                    SizedBox(
                                      width: double.infinity,
                                      child: ElevatedButton(
                                        onPressed: () async {
                                          if (!validateInputs()) {
                                            cekHarga();
                                          }
                                        },
                                        style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty
                                              .all<Color>(const Color.fromRGBO(
                                                  97,
                                                  164,
                                                  241,
                                                  1)), // Set your desired background color here
                                        ),
                                        child: const Text("Cek Harga",
                                            style:
                                                TextStyle(color: Colors.white)),
                                      ),
                                    )
                                  ],
                                );
                              }
                            }),
                      ],
                    ),
                  ),
                ),
                if (sudahDicari == true && hargaData?['status'] == 'success')
                  if (hargaData?['tipe_biaya'] == 'barang')
                    responseBarang(kotaAsal, kotaTujuan, hargaData)
                  else if (hargaData?['tipe_biaya'] == 'elektronik')
                    responseElektronik(kotaAsal, kotaTujuan, hargaData)
                  else if (hargaData?['tipe_biaya'] == 'kendaraan')
                    responseKendaraan(kotaAsal, kotaTujuan, hargaData)
                  else
                    responseElse()
                else if(sudahDicari == true && hargaData?['tipe_biaya'] == 'barang' && hargaData?['status'] == 'failed')
                   responseBarangNotFound()
                else if (sudahDicari == true && hargaData?['status'] == 'error')
                  responsError()
              ],
            ),
          )
        ],
      ),
    );
  }
}
