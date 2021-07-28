import 'dart:convert';

import 'package:flutter_hadith_app/model/hadith_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class APIRepo {
  final Uri apiUrl = Uri.parse('https://api.hadith.sutanlab.id/books/');

  Future<List<HadithModel>?> fetchHadith() async {
    final res = await http.get(apiUrl);

    try {
      if (res.statusCode == 200) {
        List result = json.decode(res.body)["data"];
        List<HadithModel> rest =
            result.map((x) => HadithModel.fromJson(x)).toList();

        return rest;
      } else {
        throw Exception("Error fetching data");
      }
    } catch (e) {
      throw e;
    }
  }
}

final hadithProvider = Provider((_) => APIRepo());

final hadithData = FutureProvider<List<HadithModel>?>((ref) async {
  return ref.watch(hadithProvider).fetchHadith();
});
