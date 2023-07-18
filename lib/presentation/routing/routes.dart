import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/logic/cubit/loaddata_cubit.dart';
import 'package:news_app/model/grap_data.dart';
import 'package:news_app/presentation/screen/home_screen.dart';
import 'package:news_app/presentation/screen/reading_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    List<Articles> listofdata = [];
    int index = 0;
    LoaddataCubit loadingDataCubitinstance = LoaddataCubit(listofdata);
    final arg = routeSettings.arguments;
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: loadingDataCubitinstance,
            child: const HomeScreen(),
          ),
        );
      case '/Reading':
        return MaterialPageRoute(
          builder: (_) { 
            ReadingScreen? args = arg as ReadingScreen?;
            return BlocProvider.value(
            value: loadingDataCubitinstance,
            child: ReadingScreen(
              index: args!.index,
              listofdata: args.listofdata,
            ),
          );}
         
        );
      default:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: loadingDataCubitinstance,
            child: const HomeScreen(),
          ),
        );
    }
  }
}
