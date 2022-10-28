class Product {
  final String name;
  final String plan;
  final int production;
  final String code;
  Product(this.name, this.plan, this.production, this.code);
  factory Product.fromMap(Map<String, dynamic> json) {
    return Product(
      json['name'],
      json['plan'],
      json['production'],
      json['code'],
    );
  }
}
/*
class Product {
  final String name;
  final String description;
  final int price;
  final String image;
  Product(this.name, this.description, this.price, this.image);
  factory Product.fromMap(Map<String, dynamic> json) {
    return Product(
      json['name'],
      json['description'],
      json['price'],
      json['image'],
    );
  }
}

 */