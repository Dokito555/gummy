import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_gummy/data/api/api_repository.dart';
import 'package:flutter_gummy/data/models/responses/manga_list_response_model.dart';

part 'manga_list_event.dart';
part 'manga_list_state.dart';

class MangaListBloc extends Bloc<MangaListEvent, MangaListState> {
  MangaListBloc() : super(MangaListInitial()) {

    final ApiRepository _apiRepository = ApiRepository();

    on<GetMangaList>((event, emit) async {
      try {
        emit(MangaListLoading());
        final mangaList = await _apiRepository.fetchMangaList(20, 1);
        print("FETCHING");
        emit(MangaListLoaded(mangaListResponseModel: mangaList));
        print('FETCHED ${mangaList.data![0].attributes!.title!.en}');
        if (mangaList.error != null) {
          emit(MangaListError(message: mangaList.error));
        }
      }
      on NetworkError {
        emit(const MangaListError(message: "Failed to fetch data"));
      }
    });

  }
}