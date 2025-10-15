import 'dart:async';
import 'package:dfa_media_flutter/src/providers/local_data_provider.dart';
import 'package:flutter/material.dart';

class ThemeRepository {
  final LocalDataProvider _localDataProvider;

  ThemeRepository(this._localDataProvider) {
    final result = _localDataProvider.getTheme();

    _themeMode = switch (result) {
      'light' => ThemeMode.light,
      'dark' => ThemeMode.dark,
      _ => ThemeMode.light,
    };

    saveTheme();
  }

  final _controller = StreamController<ThemeMode>();
  ThemeMode? _themeMode;

  ThemeMode get getThemeMode => _themeMode ?? ThemeMode.system;
  Stream<ThemeMode> get getThemeStream => _controller.stream;

  Future<void> saveTheme([ThemeMode? theme]) async {
    final newTheme = theme ?? getThemeMode;

    _themeMode = newTheme;
    _controller.add(newTheme);
    _localDataProvider.saveTheme(newTheme.name);
  }

  void dispose() => _controller.close();
}
