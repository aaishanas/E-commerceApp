class Grocery {
  final String? title;
  final double? price;
  final String? description;
  final String? image;
  Grocery({this.title, this.price, this.description, this.image});
  factory Grocery.fromJson(dynamic json) {
    return Grocery(
        title: json['title'] as String,
        price: json['price'] as double,
        description: json['description'] as String,
        image: json['image'] as String);
  }

  static List<Grocery> groceryFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Grocery.fromJson(data);
    }).toList();
  }
}
