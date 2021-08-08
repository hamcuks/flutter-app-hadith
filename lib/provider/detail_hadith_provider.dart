import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_hadith_app/model/detail_hadit_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

Future<DetailHadithModel> fetchDetailHadith({String? id, int page = 1}) async {
  final Uri apiUrl =
      Uri.parse('https://api.hadith.sutanlab.id/books/$id/$page');
  final res = await http.get(apiUrl);

  try {
    if (res.statusCode == 200) {
      var result = json.decode(res.body)["data"];

      if (result['contents'] == null) {
        throw "Tidak ada data";
      }
      return DetailHadithModel.fromJson(result);
    } else {
      throw Exception("Gagal memuat data. Silahkan restart aplikasi.");
    }
  } catch (e) {
    throw e;
  }
}

class DetailHadithParams extends Equatable {
  final String hadithId;
  final int page;

  DetailHadithParams({required this.hadithId, required this.page});

  @override
  List<Object> get props => [hadithId, page];
}

final detailHadithData =
    FutureProvider.family<DetailHadithModel, DetailHadithParams>(
        (ref, hadithParam) async {
  return ref.watch(Provider((_) =>
      fetchDetailHadith(id: hadithParam.hadithId, page: hadithParam.page)));
});
