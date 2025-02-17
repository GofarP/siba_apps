import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:dropdown_search/dropdown_search.dart';

Widget dropDownKotaTujuan(List<Map<String, dynamic>> kabupatenKotaList,
    Function(String?) selectedKotaTujuan){
  return   DropdownSearch<String>(
                                      popupProps: const PopupProps.menu(
                                          showSelectedItems: true,
                                          showSearchBox: true),
                                      items: kabupatenKotaList
                                          .map((kota) => kota['nama'] as String)
                                          .toList(),
                                      dropdownDecoratorProps:
                                          const DropDownDecoratorProps(
                                              dropdownSearchDecoration:
                                                  InputDecoration(
                                                      hintText:
                                                          "Pilih Wilayah")),
                                      onChanged: selectedKotaTujuan,
                                    );
}