import 'package:flutter_demo/api/repository/wanandroid_repository.dart';
import 'package:flutter_demo/model/banner_model.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class GetBannerUseCase {
  final WanAndroidRepository _wanAndroidRepository;

  const GetBannerUseCase(this._wanAndroidRepository);

  Future<List<BannerModel>> call() {
    return _wanAndroidRepository.getBanners();
  }
}