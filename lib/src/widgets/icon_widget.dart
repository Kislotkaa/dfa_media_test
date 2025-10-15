import 'package:flutter/material.dart';
import 'package:dfa_media_flutter/core/gen/assets.gen.dart';

import 'package:dfa_media_flutter/core/utils/context_extension.dart';
import 'package:dfa_media_flutter/src/widgets/feedback_widget.dart';

class IconWidget extends StatelessWidget {
  const IconWidget({
    super.key,
    required this.icon,
    this.onTap,
    this.iconSize = 32,
    this.iconColor,
    this.padding = EdgeInsets.zero,
  });

  final SvgGenImage icon;
  final Function()? onTap;
  final double iconSize;
  final Color? iconColor;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;

    return FeedbackWidget(
      isEnabled: onTap != null,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: Padding(
          padding: padding,
          child: icon.svg(
            height: iconSize,
            width: iconSize,
            colorFilter: ColorFilter.mode(
              iconColor ?? textTheme.headlineMedium?.color ?? Colors.black,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}
