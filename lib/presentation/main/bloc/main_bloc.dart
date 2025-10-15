import 'dart:async';

import 'package:dfa_media_flutter/core/models/banner_model.dart';
import 'package:dfa_media_flutter/core/models/product_model.dart';
import 'package:dfa_media_flutter/core/models/story_model.dart';
import 'package:dfa_media_flutter/src/repositories/banners_repository.dart';
import 'package:dfa_media_flutter/src/repositories/products_repository.dart';
import 'package:dfa_media_flutter/src/repositories/stories_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  final BannersRepository _bannersRepository;
  final StoriesRepository _storiesRepository;
  final ProductsRepository _productsRepository;

  MainBloc(
    this._bannersRepository,
    this._storiesRepository,
    this._productsRepository,
  ) : super(MainInitialState()) {
    on<MainGetProductsEvent>(_getProducts);
    on<MainGetStoriesEvent>(_getStories);
    on<MainGetBannersEvent>(_getBanners);
  }

  final List<ProductModel> _products = [];
  final List<BannerModel> _banners = [];
  final List<StoryModel> _stories = [];

  FutureOr<void> _getProducts(MainGetProductsEvent event, emit) async {
    emit(MainLoadingProductsState());
    final response = await _productsRepository.getProducts();

    if (response.isError) return emit(MainLoadProductsFailedState());

    _products.addAll(response.data ?? []);
    emit(MainProductsLoadedState(_products));
  }

  FutureOr<void> _getStories(MainGetStoriesEvent event, emit) async {
    emit(MainLoadingStoriesState());
    final response = await _storiesRepository.getStories();

    if (response.isError) return emit(MainLoadStoriesFailedState());

    _stories.addAll(response.data ?? []);
    emit(MainStoriesLoadedState(_stories));
  }

  FutureOr<void> _getBanners(MainGetBannersEvent event, emit) async {
    emit(MainLoadingBannersState());

    final response = await _bannersRepository.getBanners();

    if (response.isError) return emit(MainLoadBannersFailedState());

    _banners.addAll(response.data ?? []);
    emit(MainBannersLoadedState(_banners));
  }
}
