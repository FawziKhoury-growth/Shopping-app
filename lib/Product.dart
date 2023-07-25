class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final int availableQuantity;
  final String imageUrl;
  int quantity;

  Product(
      {required this.id,
      required this.name,
      required this.description,
      required this.price,
      required this.availableQuantity,
      required this.imageUrl,
      this.quantity=0,
      });


factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      price: map['Price'],
      availableQuantity: map['AvailableQuantity'],
      imageUrl: map['imageUrl']
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'Price': price,
      'AvailableQuantity': availableQuantity,
      'imageUrl': imageUrl,
    };
  }


}