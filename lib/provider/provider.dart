import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_hadith_app/model/detail_hadit_model.dart';
import 'package:flutter_hadith_app/model/hadith_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

Future<List<HadithModel>?> fetchHadith() async {
  final Uri apiUrl = Uri.parse('https://api.hadith.sutanlab.id/books/');
  final res = await http.get(apiUrl);

  try {
    if (res.statusCode == 200) {
      List result = json.decode(res.body)["data"];
      List<HadithModel> rest =
          result.map((x) => HadithModel.fromJson(x)).toList();

      return rest;
    } else {
      throw Exception("Gagal memuat data. Silahkan restart aplikasi.");
    }
  } catch (e) {
    throw e;
  }
}

final hadithProvider = Provider((_) => fetchHadith());

final hadithData = FutureProvider<List<HadithModel>?>((ref) async {
  return ref.watch(hadithProvider);
});
