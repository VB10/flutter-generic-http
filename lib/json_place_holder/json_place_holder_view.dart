import 'package:flutter/material.dart';
import 'package:generichttp/json_place_holder/model/post_model.dart';
import './json_place_holder_view_model.dart';

class JsonPlaceHolderView extends JsonPlaceHolderViewModel {
  @override
  Widget build(BuildContext context) {
    // Replace this with your build function
    return Scaffold(
      appBar: AppBar(title: buildTitleAppBar()),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getPosts();
        },
      ),
      body: ListView.builder(
        itemCount: postModels.length,
        itemBuilder: (context, index) => postCard(postModels[index]),
      ),
    );
  }

  Widget postCard(PostModel model) {
    return Card(
      child: ListTile(
        title: Text(model.title),
        subtitle: Text(model.body),
        leading: Text(model.id.toString()),
      ),
    );
  }

  Widget buildTitleAppBar() {
    return isLoading
        ? CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          )
        : Text("Json Place Holder View");
  }
}
