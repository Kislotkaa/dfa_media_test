import 'package:dfa_media_flutter/core/models/theme/colors.dart';
import 'package:dfa_media_flutter/core/utils/context_extension.dart';
import 'package:dfa_media_flutter/src/widgets/feedback_widget.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.onTap,
    required this.text,
    this.padding,
    this.height = 50,
    this.withHapticFeedback = false,
  });

  final Function() onTap;
  final String text;
  final double height;
  final EdgeInsets? padding;
  final bool withHapticFeedback;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return FeedbackWidget(
      scalePattern: 0.9,
      withHapticFeedback: withHapticFeedback,
      child: Padding(
        padding: padding ?? EdgeInsets.zero,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(theme.primaryColor),
            minimumSize: WidgetStatePropertyAll(Size(double.infinity, height)),
            padding: const WidgetStatePropertyAll(
              EdgeInsets.symmetric(horizontal: 32),
            ),
            elevation: const WidgetStatePropertyAll(0),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          onPressed: onTap,
          child: Text(
            text,
            style: context.textTheme.headlineMedium?.copyWith(color: AppDarkColors.text),
          ),
        ),
      ),
    );
  }
}
