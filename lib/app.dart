import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dfa_media_flutter/core/models/theme/theme_data.dart';
import 'package:dfa_media_flutter/src/cubits/theme_cubit.dart';
import 'package:dfa_media_flutter/core/router/app_router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ThemeCubit, ThemeState>(
      listener: (context, themeState) => context.read<ThemeCubit>().rebuildAllChildren(context),
      listenWhen: (prev, current) => prev.isDarkMode != current.isDarkMode,
      builder: (context, themeState) => MaterialApp.router(
        title: 'DFA',
        showPerformanceOverlay: false,
        debugShowMaterialGrid: false,
        showSemanticsDebugger: false,
        checkerboardRasterCacheImages: false,
        checkerboardOffscreenLayers: false,
        debugShowCheckedModeBanner: false,
        theme: AppThemeData.light,
        darkTheme: AppThemeData.dark,
        themeMode: themeState.themeMode,
        routerConfig: router.config(),
      ),
    );
  }
}
