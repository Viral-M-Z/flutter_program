
import 'package:flutter/material.dart';
import 'package:flutter_program/common_utils/network_service.dart';
import 'package:flutter_program/src/models/movies_list_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {

  RxString profession = ''.obs;
  var scaffoldKey = GlobalKey<ScaffoldState>();

  Rx<MoviesListModel> moviesListModel = MoviesListModel().obs;

  @override
  void onInit() {
    /// TODO :

    super.onInit();
  }

  @override
  void onReady() {
    /// TODO :
    getMoviesList();


    super.onReady();
  }

  void getMoviesList() async {
    moviesListModel.value = MoviesListModel();
    String url = "https://hoblist.com/api/movieList";
    Map<String, String> body = {
      "category": "movies",
      "language": "kannada",
      "genre": "all",
      "sort": "voting"
    };

    var response = await NetworkService.post(url: url, body: body);

    if(response != null) {
      print(response);
      moviesListModel.value = MoviesListModel.fromJson(response);
    }

  }

}
