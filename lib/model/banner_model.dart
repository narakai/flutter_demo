import 'package:equatable/equatable.dart';

import '../api/response/banner_response.dart';

class BannerModel extends Equatable {
  final String desc;
  final int id;
  final String imagePath;
  final int isVisible;
  final int order;
  final String title;
  final int type;
  final String url;

  BannerModel(
      {required this.desc,
      required this.id,
      required this.imagePath,
      required this.isVisible,
      required this.order,
      required this.title,
      required this.type,
      required this.url});

  factory BannerModel.fromResponse(BannerResponse response) {
    return BannerModel(
        desc: response.desc ?? '',
        id: response.id ?? 0,
        imagePath: response.imagePath ?? '',
        isVisible: response.isVisible ?? 0,
        order: response.order ?? 0,
        title: response.title ?? '',
        type: response.type ?? 0,
        url: response.url ?? '');
  }

  @override
  List<Object?> get props =>
      [desc, id, imagePath, isVisible, order, title, type, url];
}
