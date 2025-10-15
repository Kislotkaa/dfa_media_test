import 'package:dfa_media_flutter/core/models/app_response.dart';
import 'package:dfa_media_flutter/core/models/banner_model.dart';
import 'package:dfa_media_flutter/src/providers/remote_data_provider.dart';

class BannersRepository {
  final RemoteDataProvider _remoteDataProvider;

  BannersRepository(this._remoteDataProvider);

  Future<AppResponse<List<BannerModel>, GatewayError>> getBanners() => _remoteDataProvider.getBanners();
}
