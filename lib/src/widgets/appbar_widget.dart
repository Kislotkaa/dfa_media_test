import 'package:dfa_media_flutter/core/utils/context_extension.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget> actions;
  final Widget? leading;
  final bool needClose;

  const AppBarWidget({
    super.key,
    required this.title,
    this.actions = const [],
    this.leading,
    this.needClose = false,
  });

  @override
  Widget build(BuildContext context) {
    final headlineMedium = context.textTheme.headlineMedium;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppBar(
          elevation: 0.0,
          titleSpacing: 8,
          leading: leading,
          centerTitle: false,
          title: Text(
            title,
            style: headlineMedium,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: actions,
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
