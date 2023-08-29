import 'package:flutter/material.dart';
import 'package:flutter_demo/extension/context_extension.dart';
import 'package:flutter_demo/screen/main/main_view_state.dart';
import 'package:flutter_demo/usecase/get_banner_use_case.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../di/di.dart';
import '../../env.dart';
import '../../gen/colors.gen.dart';
import 'main_view_model.dart';

final mainViewModelProvider =
    StateNotifierProvider.autoDispose<MainViewModel, MainViewState>(
        (_) => MainViewModel(
              getIt.get<GetBannerUseCase>(),
            ));

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  Widget get _mainScreenContent => Consumer(builder: (_, widgetRef, __) {
        final banners = ref.watch(bannersStream).value ?? [];

        return Scaffold(
          appBar: AppBar(
            backgroundColor: context.colorTheme.primary,
            title: Text(context.localization.tab_checkout),
          ),
          body: Container(
            color: context.colorTheme.inversePrimary,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    Env.restApiEndpoint + banners.length.toString(),
                    style: context.textTheme.labelMedium,
                  ),
                ],
              ),
            ),
          ),
        );
        ;
      });

  @override
  void initState() {
    super.initState();
    ref.read(mainViewModelProvider.notifier).getData();
  }

  @override
  Widget build(BuildContext context) {
    return _mainScreenContent;
  }
}
