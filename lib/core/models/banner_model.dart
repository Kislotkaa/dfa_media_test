class BannerModel {
  final String image;
  final String link;

  BannerModel({
    required this.image,
    required this.link,
  });

  factory BannerModel.fromMap(Map<String, dynamic> map) {
    return BannerModel(
      image: map['image'] as String,
      link: map['link'] as String,
    );
  }
}
