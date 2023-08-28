import 'package:freezed_annotation/freezed_annotation.dart';

import 'converter/response_converter.dart';

part 'banner_response.g.dart';

@JsonSerializable()
class BannerResponse {
  final String? desc;
  final int? id;
  final String? imagePath;
  final int? isVisible;
  final int? order;
  final String? title;
  final int? type;
  final String? url;

  BannerResponse(this.desc, this.id, this.imagePath, this.isVisible, this.order,
      this.title, this.type, this.url);

  factory BannerResponse.fromJson(Map<String, dynamic> json) =>
      _$BannerResponseFromJson(fromDataJsonApi(json));
}
