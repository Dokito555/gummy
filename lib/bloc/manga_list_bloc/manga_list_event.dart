part of 'manga_list_bloc.dart';

abstract class MangaListEvent extends Equatable {
  const MangaListEvent();

  @override
  List<Object> get props => [];
}

class GetMangaList extends MangaListEvent {}
