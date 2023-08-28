import 'package:flutter/material.dart';
import 'package:flutter_demo/extension/context_extension.dart';

import '../../env.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
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
                Env.restApiEndpoint,
                style: context.textTheme.labelMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
