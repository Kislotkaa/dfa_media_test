// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:dfa_media_flutter/core/gen/assets.gen.dart';
import 'package:dfa_media_flutter/core/models/theme/colors.dart';
import 'package:dfa_media_flutter/core/router/app_router.gr.dart';
import 'package:dfa_media_flutter/core/utils/context_extension.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;

    return AutoTabsRouter(
      routes: const [
        MainRoute(),
        DeliveryRoute(),
        EmptyRoute(),
        ShopRoute(),
        ChatRoute(),
      ],
      transitionBuilder: (context, child, animation) => FadeTransition(
        opacity: animation,
        child: child,
      ),
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: (index) {
              if (index == 2) return;
              tabsRouter.setActiveIndex(index);
            },
            type: BottomNavigationBarType.fixed,
            selectedLabelStyle: textTheme.bodyMedium,
            unselectedLabelStyle: textTheme.bodyMedium,
            selectedItemColor: AppStaticColors.primary,
            unselectedItemColor: textTheme.bodyMedium?.color,
            showUnselectedLabels: true,
            items: [
              BottomNavigationBarItem(
                icon: _NavigatorIconWidget(
                  icon: Assets.icons.home,
                  isSelected: 0 == tabsRouter.activeIndex,
                ),
                label: 'Главная',
              ),
              BottomNavigationBarItem(
                icon: _NavigatorIconWidget(
                  icon: Assets.icons.delivery,
                  isSelected: 1 == tabsRouter.activeIndex,
                ),
                label: 'Доставка',
              ),
              const BottomNavigationBarItem(
                icon: SizedBox.shrink(),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: _NavigatorIconWidget(
                  icon: Assets.icons.shop,
                  isSelected: 3 == tabsRouter.activeIndex,
                ),
                label: 'Магазины',
              ),
              BottomNavigationBarItem(
                icon: _NavigatorIconWidget(
                  icon: Assets.icons.message,
                  isSelected: 4 == tabsRouter.activeIndex,
                ),
                label: 'Связаться',
              ),
            ],
          ),
        );
      },
    );
  }
}

class _NavigatorIconWidget extends StatelessWidget {
  final SvgGenImage icon;
  final bool isSelected;

  const _NavigatorIconWidget({
    required this.icon,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    final primaryColor = context.theme.primaryColor;

    return icon.svg(
      height: 24,
      width: 24,
      colorFilter: isSelected
          ? ColorFilter.mode(
              primaryColor,
              BlendMode.srcIn,
            )
          : null,
    );
  }
}
