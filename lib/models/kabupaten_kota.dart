import 'dart:convert';

// Define the class for each item in the data array
class KabupatenKota {
  final int id;
  final String nama;
  final String daerahTingkat;
  final int provinsiId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;

  KabupatenKota({
    required this.id,
    required this.nama,
    required this.daerahTingkat,
    required this.provinsiId,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  // Factory constructor to create an instance from JSON
  factory KabupatenKota.fromJson(Map<String, dynamic> json) {
    return KabupatenKota(
      id: json['id'],
      nama: json['nama'],
      daerahTingkat: json['daerah_tingkat'],
      provinsiId: json['provinsi_id'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      deletedAt: json['deleted_at'] != null ? DateTime.parse(json['deleted_at']) : null,
    );
  }

  // Convert the instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama': nama,
      'daerah_tingkat': daerahTingkat,
      'provinsi_id': provinsiId,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'deleted_at': deletedAt?.toIso8601String(),
    };
  }
}

// Define the class for the entire response
class ApiResponse {
  final String status;
  final String message;
  final List<KabupatenKota> data;

  ApiResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  // Factory constructor to create an instance from JSON
  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    var dataList = json['data'] as List;
    List<KabupatenKota> kabupatenKotaList = dataList.map((i) => KabupatenKota.fromJson(i)).toList();

    return ApiResponse(
      status: json['status'],
      message: json['message'],
      data: kabupatenKotaList,
    );
  }

  // Convert the instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data.map((item) => item.toJson()).toList(),
    };
  }
}

