import 'package:dfa_media_flutter/src/widgets/progess_indicator_widget.dart';
import 'package:flutter/material.dart';

class PlaceHolderWidget extends StatelessWidget {
  final double? height;
  final double? width;

  const PlaceHolderWidget({super.key, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return ProgressIndicatorWidget(
      state: ProgressIndicatorEnum.shimmer,
      shimmerChild: Container(
        height: height,
        width: width ?? double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
      ),
    );
  }
}
