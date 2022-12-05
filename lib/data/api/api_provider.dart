import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_gummy/data/api/server.dart';
import 'package:flutter_gummy/data/models/manga/cover_model.dart';
import 'package:flutter_gummy/data/models/responses/manga_list_response_model.dart';
import 'package:http/http.dart' as http;

class ApiProvider {

  static Future<MangaListResponseModel> fetchMangaList(int limit, int offset) async {

    try {

      final initUrl = ApiServer.urlMangaList + '?limit=${limit}&offset=${offset}';
      final url = Uri.parse(initUrl);
      final response = await http.get(
        url 
      );

      final data = json.decode(response.body);
      if (response.statusCode == 200) {
        return MangaListResponseModel.fromJson(data);
      } else {
        throw Exception('Failed to get Manga ${response.statusCode}');
      }

    } catch(error, stackTrace) {

      if (kDebugMode) {
        print("Exception occured $error stackTrace $stackTrace");
      }
      throw Exception('Data Not Found / No Internet Connection');

    }

  }

  static Future<CoverModel> fetchMangaCover(String mangaId) async {

    try {

      final initUrl = ApiServer.urlMangaCover + mangaId;
      final url = Uri.parse(initUrl);
      final response = await http.get(
        url
      );

      final data = json.decode(response.body);
      if (response.statusCode == 200) {
        return CoverModel.fromJson(data);
      } else {
        throw Exception('Failed to get Cover ${response.statusCode}');
      }

    } catch(error, stackTrace) {

      if (kDebugMode) {
        print("Exception occured $error stackTrace $stackTrace");
      }
      throw Exception("Data Not Found / No Internet Connection");
    }

  } 
}