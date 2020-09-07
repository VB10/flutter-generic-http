import 'package:flutter/material.dart';

import './json_place_holder.dart';
import 'model/album_model.dart';
import 'model/post_model.dart';
import 'service/json_place_service.dart';

abstract class JsonPlaceHolderViewModel extends State<JsonPlaceHolder> {
  // Add your state and logic here
  List<PostModel> postModels = [];
  List<AlbumModel> albumModels = [];
  String errorMessage = "";
  JsonPlaceService jsonPlaceService;

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    jsonPlaceService = JsonPlaceService();
  }

  Future<void> getPosts() async {
    changeLoading();
    try {
      postModels = await jsonPlaceService.getPosts();
    } catch (e) {
      showErrorDialog(e.toString());
    }
    changeLoading();
  }

  void showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Text(message),
      ),
    );
  }

  Future<void> getAlbums() async {
    changeLoading();
    try {
      albumModels = await jsonPlaceService.getAlbums();
    } on Exception catch (e) {
      showErrorDialog(e.toString());
    }
    changeLoading();
  }

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }
}
