import 'package:dfa_media_flutter/core/utils/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

enum ProgressIndicatorEnum { circular, linear, shimmer }

class ProgressIndicatorWidget extends StatelessWidget {
  const ProgressIndicatorWidget({
    super.key,
    this.state = ProgressIndicatorEnum.circular,
    this.shimmerChild,
    this.padding,
    this.size = 24,
  });

  final ProgressIndicatorEnum state;
  final Widget? shimmerChild;
  final EdgeInsets? padding;
  final double size;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: switch (state) {
        ProgressIndicatorEnum.circular => SizedBox.square(
            dimension: size,
            child: const CircularProgressIndicator(),
          ),
        ProgressIndicatorEnum.linear => const LinearProgressIndicator(),
        ProgressIndicatorEnum.shimmer => Shimmer.fromColors(
            baseColor: theme.cardColor.withOpacity(0.3),
            highlightColor: theme.cardColor,
            child: shimmerChild ?? const SizedBox.shrink(),
          ),
      },
    );
  }
}
