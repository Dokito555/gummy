import 'package:flutter_gummy/data/api/api_provider.dart';
import 'package:flutter_gummy/data/models/responses/manga_list_response_model.dart';

class ApiRepository {

  Future<MangaListResponseModel> fetchMangaList(int limit, int offset) {
    return ApiProvider.fetchMangaList(limit, offset);
  }

}

class NetworkError extends Error {}