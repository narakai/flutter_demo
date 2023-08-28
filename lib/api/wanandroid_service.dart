import 'package:dio/dio.dart';
import 'package:flutter_demo/api/response/banner_response.dart';
import 'package:retrofit/retrofit.dart';

part 'wanandroid_service.g.dart';

abstract class WanAndroidService {
  Future<List<BannerResponse>> getBanners();
}

@RestApi()
abstract class WanAndroidServiceImpl extends WanAndroidService {
  factory WanAndroidServiceImpl(Dio dio, {String baseUrl}) = _WanAndroidServiceImpl;

  @override
  @GET('banner/json')
  Future<List<BannerResponse>> getBanners();
}
