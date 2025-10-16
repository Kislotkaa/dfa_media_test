import 'package:dfa_media_flutter/core/models/theme/colors.dart';
import 'package:dfa_media_flutter/core/utils/context_extension.dart';
import 'package:flutter/material.dart';

enum BadgeTypeEnum { push, faq, invitation, all }

class BadgeWidget extends StatelessWidget {
  final int count;
  final Alignment alignment;
  final Offset? offset;
  final Widget? child;

  const BadgeWidget({
    super.key,
    this.child,
    required this.count,
    this.alignment = Alignment.topRight,
    this.offset = const Offset(2, -2),
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;

    return Badge.count(
      offset: offset,
      isLabelVisible: count > 0,
      count: count,
      textColor: AppStaticColors.white,
      textStyle: textTheme.bodyMedium,
      backgroundColor: AppStaticColors.primary,
      alignment: alignment,
      child: child,
    );
  }
}
