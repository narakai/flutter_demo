import 'package:flutter_demo/api/response/banner_response.dart';
import 'package:flutter_demo/api/wanandroid_service.dart';
import 'package:injectable/injectable.dart';

import '../../model/banner_model.dart';
import '../exception/network_exceptions.dart';

abstract class WanAndroidRepository {
  Future<List<BannerModel>> getBanners();
}

@LazySingleton(as: WanAndroidRepository)
class WanAndroidRepositoryImpl extends WanAndroidRepository {
  final WanAndroidService _wanAndroidService;

  WanAndroidRepositoryImpl(this._wanAndroidService);

  @override
  Future<List<BannerModel>> getBanners() async {
    try {
      final response = await _wanAndroidService.getBanners();
      return response.data
          .map((banner) => BannerModel.fromResponse(banner))
          .toList();
    } catch (exception) {
      throw NetworkExceptions.fromDioException(exception);
    }
  }
}
