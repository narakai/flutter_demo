import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension ContextExtension on BuildContext {
  AppLocalizations get localization => AppLocalizations.of(this)!;

  TextTheme get textTheme => Theme.of(this).textTheme;

  ColorScheme get colorTheme => Theme.of(this).colorScheme;

  void showMessageSnackBar({required String message}) =>
      ScaffoldMessenger.of(this).showSnackBar(SnackBar(content: Text(message)));
}
