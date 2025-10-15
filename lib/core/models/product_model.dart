class ProductModel {
  final int id;
  final String title;
  final String image;
  final int price;
  final int? salePrice;
  final int unit;
  final String unitText;

  ProductModel({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
    required this.salePrice,
    required this.unit,
    required this.unitText,
  });

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] as int,
      title: map['title'] as String,
      image: map['image'] as String,
      price: map['price'] as int,
      salePrice: map['sale_price'] as int?,
      unit: map['unit'] as int,
      unitText: map['unit_text'] as String,
    );
  }
}
