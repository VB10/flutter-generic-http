import 'package:generichttp/json_place_holder/model/base_model.dart';

class AlbumModel extends IBaseModel<AlbumModel> {
  int userId;
  int id;
  String title;

  AlbumModel({this.userId, this.id, this.title});

  AlbumModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    return data;
  }

  @override
  AlbumModel fromJson(Map<String, Object> json) {
    return AlbumModel.fromJson(json);
  }
}
