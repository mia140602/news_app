import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

import 'package:news_app/model/grap_data.dart';

part 'loaddata_state.dart';

class LoaddataCubit extends Cubit<LoaddataState> {
  List<Articles> listofdata;
  LoaddataCubit(
    this.listofdata,
  ) : super(LoaddataInitial()) {
    loadNews('sports');
  }


  Future loadNews(String concat) async {
    var response = await http.get(Uri.parse(
        'https://newsapi.org/v2/everything?q=$concat&from=2023-05-20&sortBy=publishedAt&apiKey=abf37611d31f4b10b9f4fc44d34d9543'));
    if (response.statusCode == 200) {
      var jsonlist = json.decode(response.body)['articles'] as List;
      listofdata.clear();
      for (var i = 0; i < jsonlist.length; i++) {
        listofdata.add(Articles.fromJson(jsonlist[i]));
      }
      emitLoadedData();
      
    } 
  }

  void emitLoading() => emit(LoaddataInitial());
  void emitLoadedData() => emit(LoaddataLoaded());
  void emitError() => emit(LoaddataError());
}
