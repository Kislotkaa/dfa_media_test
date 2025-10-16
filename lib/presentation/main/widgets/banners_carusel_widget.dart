import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dfa_media_flutter/core/models/banner_model.dart';
import 'package:dfa_media_flutter/core/utils/context_extension.dart';
import 'package:dfa_media_flutter/src/widgets/place_holder_widget.dart';
import 'package:flutter/material.dart';

class BannersCaruselWidget extends StatefulWidget {
  final double height;
  final List<BannerModel> banners;

  const BannersCaruselWidget({
    super.key,
    required this.height,
    required this.banners,
  });

  @override
  State<BannersCaruselWidget> createState() => _BannersCaruselWidgetState();
}

class _BannersCaruselWidgetState extends State<BannersCaruselWidget> {
  final _controller = PageController();
  Timer? _timer;
  int _currentPage = 0;

  void _onPageChanged(int value) => setState(() => _currentPage = value);

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(
      const Duration(seconds: 5),
      (_) {
        if (_currentPage != widget.banners.length - 1) {
          _controller.nextPage(
            duration: Durations.medium3,
            curve: Curves.easeIn,
          );
          return;
        }
        _controller.animateToPage(
          0,
          duration: Durations.medium3,
          curve: Curves.easeIn,
        );
      },
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: SizedBox(
            height: widget.height,
            child: PageView.builder(
              controller: _controller,
              itemCount: widget.banners.length,
              onPageChanged: _onPageChanged,
              itemBuilder: (context, i) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: CachedNetworkImage(
                    fit: BoxFit.fill,
                    imageUrl: widget.banners[i].image,
                    placeholder: (context, url) => const PlaceHolderWidget(),
                    errorWidget: (context, url, error) => const PlaceHolderWidget(),
                  ),
                ),
              ),
            ),
          ),
        ),
        _PageIndicatorWidget(
          currentPage: _currentPage,
          listBannersLenght: widget.banners.length,
        ),
        const SizedBox(height: 25),
      ],
    );
  }
}

class _PageIndicatorWidget extends StatelessWidget {
  final int? currentPage;
  final int listBannersLenght;

  const _PageIndicatorWidget({
    required this.currentPage,
    required this.listBannersLenght,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        listBannersLenght,
        (i) => AnimatedContainer(
          duration: Durations.short4,
          margin: const EdgeInsets.symmetric(horizontal: 5),
          width: currentPage == i ? 32 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: currentPage == i ? theme.dividerColor : theme.cardColor,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
