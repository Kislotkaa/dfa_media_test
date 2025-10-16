import 'package:dfa_media_flutter/core/utils/context_extension.dart';
import 'package:dfa_media_flutter/presentation/main/bloc/main_bloc.dart';
import 'package:dfa_media_flutter/presentation/main/widgets/products_group_widget.dart';
import 'package:dfa_media_flutter/src/widgets/button_widget.dart';
import 'package:dfa_media_flutter/src/widgets/progess_indicator_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsListWidget extends StatelessWidget {
  const ProductsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<MainBloc>();
    final theme = context.theme;
    final textTheme = context.textTheme;

    return BlocBuilder<MainBloc, MainState>(
      buildWhen: (previous, current) =>
          current is MainLoadProductsFailedState ||
          current is MainProductsLoadedState ||
          current is MainLoadingProductsState,
      builder: (context, state) {
        if (state is MainLoadingProductsState) {
          return ProgressIndicatorWidget(
            state: ProgressIndicatorEnum.shimmer,
            shimmerChild: SizedBox(
              height: 114,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, i) => Container(
                  width: 114,
                  decoration: BoxDecoration(
                    color: theme.cardColor,
                    borderRadius: BorderRadius.circular(11),
                  ),
                ),
                separatorBuilder: (_, __) => const SizedBox(width: 10),
              ),
            ),
          );
        }

        if (state is MainLoadProductsFailedState) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Не удалось загрузить продукты.',
                  style: textTheme.headlineMedium,
                ),
                Text(
                  'Не удалось загрузить продукты.',
                  style: textTheme.bodyMedium,
                ),
                ButtonWidget(
                  padding: const EdgeInsets.only(top: 16),
                  onTap: () => bloc.add(MainGetProductsEvent()),
                  text: 'Повторить ',
                ),
              ],
            ),
          );
        }

        if (state is MainProductsLoadedState) {
          if (state.products.isEmpty) {
            return Center(
              child: Text(
                'Список продуков пока что пуст',
                style: textTheme.headlineMedium,
              ),
            );
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ProductsGroupWidget(
                isHot: true,
                title: 'Хит продаж',
                products: state.products,
              )
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
