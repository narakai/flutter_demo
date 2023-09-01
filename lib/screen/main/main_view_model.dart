import 'package:flutter_demo/model/banner_model.dart';
import 'package:flutter_demo/usecase/get_banner_use_case.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';

import '../../di/di.dart';

part 'main_view_model.g.dart';

// final mainViewModelProvider =
//     StateNotifierProvider.autoDispose<MainViewModel, MainViewState>(
//         (_) => MainViewModel(
//               getIt.get<GetBannerUseCase>(),
//             ));

// final mainViewModelProvider =
//     AsyncNotifierProvider.autoDispose<MainViewModel, void>(() {
//   return MainViewModel(getIt.get<GetBannerUseCase>());
// });

// final bannersStream = StreamProvider.autoDispose(
//     (ref) => ref.watch(mainViewModelProvider.notifier)._bannersStream.stream);

// @riverpod
// Stream<List<BannerModel>> bannersStream(BannersStreamRef ref) =>
//     ref.watch(mainViewModelProvider.notifier)._bannersStream.stream;

@riverpod
class BannersStream extends _$BannersStream {
  @override
  Stream<List<BannerModel>> build() {
    return ref.watch(mainViewModelProvider.notifier)._bannersStream.stream;
  }
}

// @riverpod
// Stream<bool> loadingStream(LoadingStreamRef ref) =>
//     ref.watch(mainViewModelProvider.notifier)._isLoading.stream;

@riverpod
class LoadingStream extends _$LoadingStream {
  @override
  Stream<bool> build() {
    return ref.watch(mainViewModelProvider.notifier)._isLoading.stream;
  }
}

@riverpod
class MainViewModel extends _$MainViewModel {
  final GetBannerUseCase _getBannerUseCase = getIt.get<GetBannerUseCase>();

  final BehaviorSubject<bool> _isLoading = BehaviorSubject();
  final BehaviorSubject<List<BannerModel>> _bannersStream = BehaviorSubject();

  Future<void> getData() async {
    _getBannerUseCase.call().asStream().doOnListen(() {
      _isLoading.add(true);
    }).doOnDone(() {
      _isLoading.add(false);
    }).doOnError((error, _) {
      _isLoading.add(false);
    }).listen((banners) {
      _bannersStream.add(banners);
    });
  }

  // may pass additional arguments to an AsyncNotifier
  @override
  FutureOr<void> build() {}
}
