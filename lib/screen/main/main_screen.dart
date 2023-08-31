import 'package:flutter/material.dart';
import 'package:flutter_demo/extension/context_extension.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../env.dart';
import '../../gen/colors.gen.dart';
import 'main_view_model.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  Widget get _mainScreenContent => Consumer(builder: (_, widgetRef, __) {
        final isLoading = ref.watch(loadingStreamProvider).value ?? false;
        final banners = ref.watch(bannersStreamProvider).value ?? [];

        return Scaffold(
          appBar: AppBar(
            backgroundColor: context.colorTheme.primary,
            title: Text(context.localization.tab_checkout),
          ),
          body: Stack(children: [
            Container(
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
            if (isLoading) // 根据需要展示 loading 控件
              Container(
                color: ColorName.blackColor.withOpacity(0.5), // 半透明黑色背景
                child: const Center(
                  child: CircularProgressIndicator(
                      backgroundColor: ColorName.skyBlueColor), // loading 控件
                ),
              ),
          ]),
        );
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
