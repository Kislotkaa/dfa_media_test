import 'package:dfa_media_flutter/core/utils/context_extension.dart';
import 'package:dfa_media_flutter/presentation/main/bloc/main_bloc.dart';
import 'package:dfa_media_flutter/presentation/main/widgets/banners_carusel_widget.dart';
import 'package:dfa_media_flutter/src/widgets/button_widget.dart';
import 'package:dfa_media_flutter/src/widgets/progess_indicator_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BannersListWidget extends StatelessWidget {
  const BannersListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<MainBloc>();
    final theme = context.theme;
    final textTheme = context.textTheme;
    final constHeight = 162.0;

    return BlocBuilder<MainBloc, MainState>(
      buildWhen: (previous, current) =>
          current is MainLoadingBannersState ||
          current is MainLoadBannersFailedState ||
          current is MainBannersLoadedState,
      builder: (context, state) {
        if (state is MainLoadingBannersState) {
          return ProgressIndicatorWidget(
            padding: const EdgeInsets.only(bottom: 25, left: 15, right: 15),
            state: ProgressIndicatorEnum.shimmer,
            shimmerChild: Column(
              children: [
                Container(
                  height: constHeight,
                  width: double.infinity,
                  margin: const EdgeInsets.only(bottom: 18),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: theme.dividerColor,
                  ),
                ),
              ],
            ),
          );
        }

        if (state is MainLoadBannersFailedState) {
          return Container(
            height: constHeight,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Что то пошло не так.',
                  style: textTheme.headlineMedium,
                ),
                Text(
                  'Не удалось загрузить баннера. Повторите попытку.',
                  style: textTheme.bodyMedium,
                ),
                ButtonWidget(
                  padding: const EdgeInsets.only(top: 16),
                  onTap: () => bloc.add(MainGetBannersEvent()),
                  text: 'Повторить',
                ),
              ],
            ),
          );
        }

        if (state is MainBannersLoadedState) {
          if (state.banners.isEmpty) {
            return const SizedBox.shrink();
          }

          return BannersCaruselWidget(
            height: constHeight,
            banners: state.banners,
          );
        }

        return const SizedBox.square();
      },
    );
  }
}
