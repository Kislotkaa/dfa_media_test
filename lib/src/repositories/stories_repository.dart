import 'package:dfa_media_flutter/core/models/app_response.dart';
import 'package:dfa_media_flutter/core/models/story_model.dart';
import 'package:dfa_media_flutter/src/providers/remote_data_provider.dart';

class StoriesRepository {
  final RemoteDataProvider _remoteDataProvider;

  StoriesRepository(this._remoteDataProvider);

  Future<AppResponse<List<StoryModel>, GatewayError>> getStories() => _remoteDataProvider.getStories();
}
