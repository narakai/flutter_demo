import 'package:freezed_annotation/freezed_annotation.dart';

import 'converter/response_converter.dart';

part 'banner_response.g.dart';

@JsonSerializable()
class BannerResponse {
  final List<Banner> data;
  final int errorCode;
  final String errorMsg;

  BannerResponse(this.data, this.errorCode, this.errorMsg);

  factory BannerResponse.fromJson(Map<String, dynamic> json) =>
      _$BannerResponseFromJson(json);
}

@JsonSerializable()
class Banner {
  final String? desc;
  final int? id;
  final String? imagePath;
  final int? isVisible;
  final int? order;
  final String? title;
  final int? type;
  final String? url;

  Banner(this.desc, this.id, this.imagePath, this.isVisible, this.order,
      this.title, this.type, this.url);

  factory Banner.fromJson(Map<String, dynamic> json) => _$BannerFromJson(json);
}
