part of 'manga_list_bloc.dart';

abstract class MangaListState extends Equatable {
  const MangaListState();
  
  @override
  List<Object?> get props => [];
}

class MangaListInitial extends MangaListState {}

class MangaListLoading extends MangaListState {}

class MangaListLoaded extends MangaListState {
  final MangaListResponseModel mangaListResponseModel;
  const MangaListLoaded({required this.mangaListResponseModel});
}

class MangaListError extends MangaListState {
  final String? message;
  const MangaListError({required this.message});
}
