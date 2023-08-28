import 'package:injectable/injectable.dart';

import '../../api/wanandroid_service.dart';
import '../../env.dart';
import '../provider/dio_provider.dart';

@module
abstract class NetworkModule {
  @Singleton(as: WanAndroidService)
  WanAndroidServiceImpl provideApiService(DioProvider dioProvider) {
    return WanAndroidServiceImpl(
      dioProvider.getDio(),
      baseUrl: Env.restApiEndpoint,
    );
  }
}
