import 'package:flutter_demo/model/banner_model.dart';
import 'package:flutter_demo/usecase/get_banner_use_case.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';

import 'main_screen.dart';
import 'main_view_state.dart';

final isLoadingProvider = StreamProvider.autoDispose(
    (ref) => ref.watch(mainViewModelProvider.notifier).isLoading);

final bannersStream = StreamProvider.autoDispose(
    (ref) => ref.watch(mainViewModelProvider.notifier)._bannersStream.stream);

class MainViewModel extends StateNotifier<MainViewState> {
  final GetBannerUseCase _getBannerUseCase;

  MainViewModel(
    this._getBannerUseCase,
  ) : super(const MainViewState.init());

  final BehaviorSubject<bool> _isLoading = BehaviorSubject();

  Stream<bool> get isLoading => _isLoading.stream;

  final BehaviorSubject<List<BannerModel>> _bannersStream = BehaviorSubject();

  void getData() async {
    _getBannerUseCase.call().asStream().doOnListen(() {
      _isLoading.add(true);
    }).doOnDone(() {
      _isLoading.add(false);
    }).doOnError((error, _) {
      _isLoading.add(false);
      state = MainViewState.error(error.toString());
    }).listen((banners) {
      _bannersStream.add(banners);
    });
  }

  @override
  void dispose() async {
    _isLoading.close();
    _bannersStream.close();
    super.dispose();
  }
}
