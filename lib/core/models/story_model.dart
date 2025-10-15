class StoryModel {
  final String? title;
  final String? previewImage;
  final bool viewed;

  StoryModel({
    this.title,
    this.previewImage,
    this.viewed = false,
  });

  factory StoryModel.fromMap(Map<String, dynamic> map) {
    return StoryModel(
      title: map['title'] as String,
      previewImage: map['preview_image'] as String,
      viewed: map['viewed'] as bool,
    );
  }
}
