import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gummy/view/pages/home_page.dart';
import 'package:flutter_gummy/service/app_theme.dart';
import 'package:flutter_gummy/service/router.dart';

import 'bloc/manga_list_bloc/manga_list_bloc.dart';
import 'core/constants/page_routes_constants.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MyApp(appRouter: AppRouter())
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.appRouter}) : super(key: key);
  final AppRouter appRouter;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider<MangaListBloc>(
          create: (_) => MangaListBloc(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: AppThemes.appThemeData[AppTheme.darkTheme],
        onGenerateRoute: appRouter.generateRoute,
        initialRoute: PageRoutes.homePage,
      ),
    );
  }
}