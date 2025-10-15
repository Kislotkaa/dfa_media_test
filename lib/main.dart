import 'package:dfa_media_flutter/app.dart';
import 'package:dfa_media_flutter/src/cubits/theme_cubit.dart';
import 'package:dfa_media_flutter/src/providers/remote_data_provider.dart';
import 'package:dfa_media_flutter/src/providers/local_data_provider.dart';
import 'package:dfa_media_flutter/src/repositories/banners_repository.dart';
import 'package:dfa_media_flutter/src/repositories/products_repository.dart';
import 'package:dfa_media_flutter/src/repositories/stories_repository.dart';
import 'package:dfa_media_flutter/src/repositories/theme_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  final sharedPreferences = await SharedPreferences.getInstance();

  final localDataProvider = LocalDataProvider(sharedPreferences);
  final remoteDataProvider = RemoteDataProvider();

  final themeRepository = ThemeRepository(localDataProvider);

  final productsRepository = ProductsRepository(remoteDataProvider);
  final bannersRepository = BannersRepository(remoteDataProvider);
  final storiesRepository = StoriesRepository(remoteDataProvider);

  runApp(
    MultiBlocProvider(
      providers: [
        // Providers
        RepositoryProvider(create: (_) => localDataProvider),
        RepositoryProvider(create: (_) => remoteDataProvider),

        // Repositories
        RepositoryProvider(create: (_) => themeRepository),
        RepositoryProvider(create: (_) => productsRepository),
        RepositoryProvider(create: (_) => bannersRepository),
        RepositoryProvider(create: (_) => storiesRepository),

        // Cubits
        BlocProvider(create: (_) => ThemeCubit(themeRepository)),
      ],
      child: const App(),
    ),
  );
}
