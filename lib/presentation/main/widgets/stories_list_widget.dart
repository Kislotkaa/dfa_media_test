import 'package:cached_network_image/cached_network_image.dart';
import 'package:dfa_media_flutter/core/models/story_model.dart';
import 'package:dfa_media_flutter/core/utils/context_extension.dart';
import 'package:dfa_media_flutter/presentation/main/bloc/main_bloc.dart';
import 'package:dfa_media_flutter/src/widgets/place_holder_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoriesListWidget extends StatelessWidget {
  const StoriesListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      buildWhen: (previous, current) =>
          current is MainLoadingStoriesState ||
          current is MainLoadStoriesFailedState ||
          current is MainStoriesLoadedState,
      builder: (context, state) {
        if (state is MainLoadingStoriesState) {
          return const SizedBox.square();
        }

        if (state is MainLoadStoriesFailedState) {
          return const SizedBox.square();
        }

        if (state is MainStoriesLoadedState) {
          if (state.stories.isEmpty) return const SizedBox.shrink();

          return Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: SizedBox(
              height: 114,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                scrollDirection: Axis.horizontal,
                itemCount: state.stories.length,
                itemBuilder: (context, i) => _StoryWidget(state.stories[i]),
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

class _StoryWidget extends StatelessWidget {
  final StoryModel story;

  const _StoryWidget(this.story);

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final textTheme = context.textTheme;

    return SizedBox(
      width: 80,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Container(
              height: 67,
              width: 67,
              margin: const EdgeInsets.only(bottom: 5),
              decoration: BoxDecoration(
                color: theme.cardColor,
              ),
              child: CachedNetworkImage(
                imageUrl: story.previewImage ?? '',
                placeholder: (context, url) => const PlaceHolderWidget(),
                errorWidget: (context, url, error) => const PlaceHolderWidget(),
              ),
            ),
          ),
          Text(
            story.title ?? '',
            textAlign: TextAlign.center,
            style: textTheme.bodyMedium,
            maxLines: 3,
          )
        ],
      ),
    );
  }
}
