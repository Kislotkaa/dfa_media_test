part of 'main_bloc.dart';

abstract class MainState {}

class MainInitialState extends MainState {}

class MainLoadingStoriesState extends MainState {}

class MainLoadingBannersState extends MainState {}

class MainLoadingProductsState extends MainState {}

class MainLoadStoriesFailedState extends MainState {}

class MainLoadBannersFailedState extends MainState {}

class MainLoadProductsFailedState extends MainState {}

class MainStoriesLoadedState extends MainState {
  final List<StoryModel> stories;

  MainStoriesLoadedState(this.stories);
}

class MainBannersLoadedState extends MainState {
  final List<BannerModel> banners;

  MainBannersLoadedState(this.banners);
}

class MainProductsLoadedState extends MainState {
  final List<ProductModel> products;

  MainProductsLoadedState(this.products);
}
