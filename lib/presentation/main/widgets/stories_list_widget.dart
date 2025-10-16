import 'package:dfa_media_flutter/core/models/story_model.dart';
import 'package:dfa_media_flutter/core/utils/context_extension.dart';
import 'package:dfa_media_flutter/presentation/main/bloc/main_bloc.dart';
import 'package:dfa_media_flutter/presentation/main/widgets/story_widget.dart';
import 'package:dfa_media_flutter/src/widgets/button_widget.dart';
import 'package:dfa_media_flutter/src/widgets/progess_indicator_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoriesListWidget extends StatelessWidget {
  const StoriesListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<MainBloc>();
    final textTheme = context.textTheme;
    final constHeight = 114.0;

    return BlocBuilder<MainBloc, MainState>(
      buildWhen: (previous, current) =>
          current is MainLoadingStoriesState ||
          current is MainLoadStoriesFailedState ||
          current is MainStoriesLoadedState,
      builder: (context, state) {
        if (state is MainLoadingStoriesState) {
          return ProgressIndicatorWidget(
            state: ProgressIndicatorEnum.shimmer,
            shimmerChild: SizedBox(
              height: constHeight,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, i) => StoryWidget(StoryModel()),
                separatorBuilder: (_, __) => const SizedBox(width: 5),
              ),
            ),
          );
        }

        if (state is MainLoadStoriesFailedState) {
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
                  'Не удалось загрузить истории. Повторите попытку.',
                  style: textTheme.bodyMedium,
                ),
                ButtonWidget(
                  padding: const EdgeInsets.only(top: 16),
                  onTap: () => bloc.add(MainGetStoriesEvent()),
                  text: 'Повторить',
                ),
              ],
            ),
          );
        }

        if (state is MainStoriesLoadedState) {
          if (state.stories.isEmpty) {
            return const SizedBox.shrink();
          }

          return Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: SizedBox(
              height: constHeight,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                scrollDirection: Axis.horizontal,
                itemCount: state.stories.length,
                itemBuilder: (context, i) => StoryWidget(state.stories[i]),
                separatorBuilder: (_, __) => const SizedBox(width: 5),
              ),
            ),
          );
        }

        return const SizedBox.square();
      },
    );
  }
}
