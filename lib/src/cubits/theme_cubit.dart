import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dfa_media_flutter/src/repositories/theme_repository.dart';

class ThemeCubit extends Cubit<ThemeState> {
  final ThemeRepository _themeRepository;

  ThemeCubit(
    this._themeRepository,
  ) : super(const ThemeState()) {
    _subscribeTheme();
    _onListen(_themeRepository.getThemeMode);
  }

  StreamSubscription<ThemeMode>? _themeSubscription;

  @override
  Future<void> close() {
    _themeSubscription?.cancel();
    _themeRepository.dispose();
    return super.close();
  }

  void _subscribeTheme() => _themeSubscription = _themeRepository.getThemeStream.listen(_onListen);

  void _onListen(ThemeMode customTheme) {
    if (customTheme.name == ThemeMode.light.name) {
      emit(
        const ThemeState(
          themeMode: ThemeMode.light,
          isDarkMode: false,
        ),
      );

      return;
    }

    if (customTheme.name == ThemeMode.dark.name) {
      emit(
        const ThemeState(
          themeMode: ThemeMode.dark,
          isDarkMode: true,
        ),
      );
      return;
    }

    final brightness = PlatformDispatcher.instance.platformBrightness;
    if (brightness == Brightness.dark) {
      emit(
        const ThemeState(
          themeMode: ThemeMode.dark,
          isDarkMode: true,
        ),
      );
      return;
    }

    emit(
      const ThemeState(
        themeMode: ThemeMode.light,
        isDarkMode: false,
      ),
    );
  }

  void switchTheme() {
    final themeMode = switch (state.isDarkMode) {
      true => ThemeMode.light,
      false => ThemeMode.dark,
    };
    _themeRepository.saveTheme(themeMode);
    _onListen(themeMode);
  }

  void rebuildAllChildren(BuildContext context) {
    void rebuild(Element el) {
      el.markNeedsBuild();
      el.visitChildren(rebuild);
    }

    (context as Element).visitChildren(rebuild);
  }
}

class ThemeState {
  final ThemeMode themeMode;
  final bool isDarkMode;

  const ThemeState({
    this.themeMode = ThemeMode.system,
    this.isDarkMode = false,
  });
}
