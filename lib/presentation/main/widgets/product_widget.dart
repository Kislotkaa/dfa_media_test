import 'package:cached_network_image/cached_network_image.dart';
import 'package:dfa_media_flutter/core/gen/assets.gen.dart';
import 'package:dfa_media_flutter/core/models/product_model.dart';
import 'package:dfa_media_flutter/core/models/theme/colors.dart';
import 'package:dfa_media_flutter/core/utils/context_extension.dart';
import 'package:dfa_media_flutter/src/widgets/feedback_widget.dart';
import 'package:dfa_media_flutter/src/widgets/icon_widget.dart';
import 'package:dfa_media_flutter/src/widgets/place_holder_widget.dart';
import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {
  final ProductModel product;

  const ProductWidget(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    final imageSize = MediaQuery.of(context).size.width / 3 - 30;
    final textTheme = context.textTheme;

    return SizedBox(
      width: imageSize,
      child: Column(
        children: [
          FeedbackWidget(
            scalePattern: 0.9,
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(11),
                  child: CachedNetworkImage(
                    height: imageSize,
                    width: imageSize,
                    fit: BoxFit.fill,
                    imageUrl: product.image,
                    placeholder: (context, url) => const PlaceHolderWidget(),
                    errorWidget: (context, url, error) => const PlaceHolderWidget(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    product.title,
                    style: textTheme.bodyMedium,
                    maxLines: 3,
                  ),
                ),
              ],
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${product.price} ₽/${product.unitText}',
                style: textTheme.bodyLarge?.copyWith(color: AppStaticColors.primary),
              ),
              IconWidget(
                icon: Assets.icons.addProduct,
                iconSize: 24,
                iconColor: AppStaticColors.primary,
                padding: const EdgeInsets.all(4),
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
