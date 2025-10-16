import 'package:dfa_media_flutter/core/gen/assets.gen.dart';
import 'package:dfa_media_flutter/core/models/product_model.dart';
import 'package:dfa_media_flutter/core/utils/context_extension.dart';
import 'package:dfa_media_flutter/presentation/main/widgets/product_widget.dart';
import 'package:flutter/material.dart';

class ProductsGroupWidget extends StatelessWidget {
  final String title;
  final bool isHot;
  final List<ProductModel> products;

  const ProductsGroupWidget({
    super.key,
    required this.title,
    required this.isHot,
    this.products = const [],
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10, left: 15, right: 15),
          child: Row(
            children: [
              if (isHot)
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Assets.icons.fire.svg(
                    height: 24,
                    width: 24,
                  ),
                ),
              Text(
                title,
                style: textTheme.headlineMedium,
              )
            ],
          ),
        ),
        SizedBox(
          height: 198,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, i) => ProductWidget(products[i]),
            separatorBuilder: (_, __) => const SizedBox(width: 10),
            itemCount: products.length,
          ),
        ),
      ],
    );
  }
}
