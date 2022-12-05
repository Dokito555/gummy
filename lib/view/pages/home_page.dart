import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gummy/bloc/manga_list_bloc/manga_list_bloc.dart';
import 'package:flutter_gummy/view/pages/detail_page.dart';

import '../../data/models/responses/manga_list_response_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final MangaListBloc _mangaListBloc = MangaListBloc();

  @override
  void initState() {
    _mangaListBloc.add(GetMangaList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              _mangaList(),
            ],
          ),
        ),
      )
    );
  }

  Widget _mangaList() {
    return Container(
      child: BlocProvider(
        create: (_) => _mangaListBloc,
        child: BlocListener<MangaListBloc, MangaListState>(
          listener: (context, state) {
            if (state is MangaListError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message!),
                ),
              );
            }
          },
          child: BlocBuilder<MangaListBloc, MangaListState>(
            builder: (context, state) {
              if (state is MangaListInitial) {
                return _buildLoading();
              } else if (state is MangaListLoading) {
                return _buildLoading();
              } else if (state is MangaListLoaded) {
                return _mangaCard(context, state.mangaListResponseModel);
              } else if (state is MangaListError) {
                return Container();
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _mangaCard(BuildContext context, MangaListResponseModel model) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: model.data!.length,
      itemBuilder: (context, index) {
        final mangaItem = model.data![index];
        return Text('${mangaItem.attributes!.title!.en}');
      },
    );
  }

  Widget _buildLoading() {
    return const Center(child: CircularProgressIndicator());
  }
}