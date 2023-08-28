import 'package:flutter_demo/api/repository/wanandroid_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class GetBannerUseCase {
  final WanAndroidRepository _wanAndroidRepository;

  const GetBannerUseCase(this._wanAndroidRepository);

  Future<void> call() {
    return _wanAndroidRepository.getBanners();
  }
}