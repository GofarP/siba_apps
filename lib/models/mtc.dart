// To parse this JSON data, do
//
//     final kabupatenKota = kabupatenKotaFromJson(jsonString);

import 'dart:convert';

KabupatenKota kabupatenKotaFromJson(String str) => KabupatenKota.fromJson(json.decode(str));

String kabupatenKotaToJson(KabupatenKota data) => json.encode(data.toJson());

class KabupatenKota {
    Mtc mtc;

    KabupatenKota({
        required this.mtc,
    });

    factory KabupatenKota.fromJson(Map<String, dynamic> json) => KabupatenKota(
        mtc: Mtc.fromJson(json["Mtc"]),
    );

    Map<String, dynamic> toJson() => {
        "Mtc": mtc.toJson(),
    };
}

class Mtc {
    String resi;
    DataManifest dataManifest;
    List<DataMtc> dataMtc;

    Mtc({
        required this.resi,
        required this.dataManifest,
        required this.dataMtc,
    });

    factory Mtc.fromJson(Map<String, dynamic> json) => Mtc(
        resi: json["resi"],
        dataManifest: DataManifest.fromJson(json["data_manifest"]),
        dataMtc: List<DataMtc>.from(json["data_mtc"].map((x) => DataMtc.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "resi": resi,
        "data_manifest": dataManifest.toJson(),
        "data_mtc": List<dynamic>.from(dataMtc.map((x) => x.toJson())),
    };
}

class DataManifest {
    String noResi;
    String daerahAsal;
    String daerahTujuan;
    String pengirim;
    String penerima;
    String alamatPengirim;
    String alamatPenerima;

    DataManifest({
        required this.noResi,
        required this.daerahAsal,
        required this.daerahTujuan,
        required this.pengirim,
        required this.penerima,
        required this.alamatPengirim,
        required this.alamatPenerima,
    });

    factory DataManifest.fromJson(Map<String, dynamic> json) => DataManifest(
        noResi: json["no_resi"],
        daerahAsal: json["daerah_asal"],
        daerahTujuan: json["daerah_tujuan"],
        pengirim: json["pengirim"],
        penerima: json["penerima"],
        alamatPengirim: json["alamat_pengirim"],
        alamatPenerima: json["alamat_penerima"],
    );

    Map<String, dynamic> toJson() => {
        "no_resi": noResi,
        "daerah_asal": daerahAsal,
        "daerah_tujuan": daerahTujuan,
        "pengirim": pengirim,
        "penerima": penerima,
        "alamat_pengirim": alamatPengirim,
        "alamat_penerima": alamatPenerima,
    };
}

class DataMtc {
    String tanggalUpdate;
    String statusManifes;
    String keteranganManifes;

    DataMtc({
        required this.tanggalUpdate,
        required this.statusManifes,
        required this.keteranganManifes,
    });

    factory DataMtc.fromJson(Map<String, dynamic> json) => DataMtc(
        tanggalUpdate: json["tanggal_update"],
        statusManifes: json["status_manifes"],
        keteranganManifes: json["keterangan_manifes"],
    );

    Map<String, dynamic> toJson() => {
        "tanggal_update": tanggalUpdate,
        "status_manifes": statusManifes,
        "keterangan_manifes": keteranganManifes,
    };
}
