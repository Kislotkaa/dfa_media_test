import 'package:cached_network_image/cached_network_image.dart';
import 'package:dfa_media_flutter/core/models/story_model.dart';
import 'package:dfa_media_flutter/core/utils/context_extension.dart';
import 'package:dfa_media_flutter/src/widgets/feedback_widget.dart';
import 'package:dfa_media_flutter/src/widgets/place_holder_widget.dart';
import 'package:flutter/material.dart';

class StoryWidget extends StatelessWidget {
  final StoryModel story;

  const StoryWidget(this.story, {super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final textTheme = context.textTheme;

    return FeedbackWidget(
      scalePattern: 0.9,
      child: SizedBox(
        width: 80,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Container(
                height: 67,
                width: 67,
                padding: const EdgeInsets.all(2),
                foregroundDecoration: story.viewed
                    ? null
                    : BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: theme.dividerColor,
                        ),
                        shape: BoxShape.circle,
                      ),
                decoration: BoxDecoration(
                  color: theme.cardColor,
                ),
                child: CachedNetworkImage(
                  height: 63,
                  width: 63,
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
      ),
    );
  }
}
