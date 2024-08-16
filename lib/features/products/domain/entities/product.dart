class Product {
  int id;
  String name;
  String brand;
  String weight;
  double price;
  double? originalPrice;
  bool onSale;
  String image;

  Product({
    required this.id,
    required this.name,
    required this.brand,
    required this.weight,
    required this.price,
    this.originalPrice,
    required this.onSale,
    required this.image,
  });

}
