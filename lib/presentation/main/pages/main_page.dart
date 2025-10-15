import 'package:auto_route/auto_route.dart';
import 'package:dfa_media_flutter/core/gen/assets.gen.dart';
import 'package:dfa_media_flutter/presentation/main/bloc/main_bloc.dart';
import 'package:dfa_media_flutter/presentation/main/widgets/banners_list_widget.dart';
import 'package:dfa_media_flutter/presentation/main/widgets/products_list_widget.dart';
import 'package:dfa_media_flutter/presentation/main/widgets/stories_list_widget.dart';
import 'package:dfa_media_flutter/src/widgets/appbar_widget.dart';
import 'package:dfa_media_flutter/src/widgets/icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) => MainBloc(
        context.read(),
        context.read(),
        context.read(),
      )
        ..add(MainGetProductsEvent())
        ..add(MainGetBannersEvent())
        ..add(MainGetStoriesEvent()),
      child: const _MainView(),
    );
  }
}

class _MainView extends StatelessWidget {
  const _MainView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'Анна',
        leading: IconWidget(
          icon: Assets.icons.profile,
          onTap: () {},
          padding: const EdgeInsets.only(left: 16),
        ),
        actions: [
          IconWidget(
            icon: Assets.icons.mark,
            onTap: () {},
          ),
          IconWidget(
            padding: const EdgeInsets.only(left: 8),
            icon: Assets.icons.bell,
            onTap: () {},
          ),
        ],
      ),
      body: ListView(
        children: [
          const StoriesListWidget(),
          const BannersListWidget(),
          const ProductsListWidget(),
        ],
      ),
    );
  }
}
