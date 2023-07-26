import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:uuid/uuid.dart';

import '../Product.dart';

class FireStoreHelper {
  static FireStoreHelper instance = FireStoreHelper();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static const String _collectionName = 'productInfo';

  List<Product> initProducts = [
    Product(
      id: Uuid().v1(),
      name: 'Sneakers',
      description: 'Comfortable Shoes',
      price: 59.99,
      availableQuantity: 20,
      imageUrl: 'https://cdn.thewirecutter.com/wp-content/media/2021/02/whitesneakers-2048px-4197.jpg?auto=webp&quality=75&width=1024',
    ),
    Product(
      id: Uuid().v1(),
      name: 'Smartphone',
      description: 'High-performance Device',
      price: 399.99,
      availableQuantity: 15,
      imageUrl: 'https://www.apple.com/newsroom/images/product/iphone/standard/Apple_iphone13_hero_09142021_inline.jpg.slideshow-medium_2x.jpg',
    ),
    Product(
      id: Uuid().v1(),
      name: 'Backpack',
      description: 'Waterproof Bag',
      price: 29.95,
      availableQuantity: 30,
      imageUrl: 'https://nwscdn.com/media/wysiwyg/2021/Family---Dry-Bags.jpg',
    ),
    Product(
      id: Uuid().v1(),
      name: 'Headphones',
      description: 'Wireless Earbuds',
      price: 79.99,
      availableQuantity: 25,
      imageUrl: 'https://961souq.com/cdn/shop/products/img_proxy_060930ff-76ab-4fd9-b9b7-b2e47d208560.jpg?v=1649415376',
    ),
    Product(
      id: Uuid().v1(),
      name: 'Watch',
      description: 'Elegant Timepiece',
      price: 149.99,
      availableQuantity: 12,
      imageUrl: 'https://www.luxemontwatches.com/cdn/shop/articles/Mens_Elegant_Watches_1024x1024.jpg?v=1531440176',
    ),
    Product(
      id: Uuid().v1(),
      name: 'Camera',
      description: 'Compact Shooter',
      price: 299.95,
      availableQuantity: 8,
      imageUrl: 'https://m.media-amazon.com/images/I/61BKYlNqH6L._AC_UF894,1000_QL80_.jpg',
    ),
    Product(
      id: Uuid().v1(),
      name: 'Laptop',
      description: 'Powerful Machine',
      price: 999.99,
      availableQuantity: 7,
      imageUrl: 'https://media.wired.com/photos/631bb97dd884b4dcc94164e3/1:1/w_1390,h_1390,c_limit/How-to-Choose-a-Laptop-Gear-GettyImages-1235728903.jpg',
    ),
    Product(
      id: Uuid().v1(),
      name: 'T-shirt',
      description: 'Cotton Fabric',
      price: 19.99,
      availableQuantity: 50,
      imageUrl: 'https://static.massimodutti.net/3/photos//2023/I/0/1/p/6823/540/251/6823540251_1_1_16.jpg?t=1659000423715&impolicy=massimodutti-itxmediumhigh&imwidth=500&imformat=chrome',
    ),
    Product(
      id: Uuid().v1(),
      name: 'Coffee Maker',
      description: 'Automatic Brewer',
      price: 89.95,
      availableQuantity: 10,
      imageUrl: 'https://m.media-amazon.com/images/I/71uLuTiXQlL._AC_SL1500_.jpg',
    ),
    Product(
      id: Uuid().v1(),
      name: 'Wireless Speaker',
      description: 'Portable Sound',
      price: 49.99,
      availableQuantity: 18,
      imageUrl: 'https://m.media-amazon.com/images/I/81XHG+FZGKL.jpg',
    ),
  ];

  // Method to check if the collection already exists in Firestore
  Future<bool> doesCollectionExist() async {
    try {
      final CollectionReference collectionRef =
          _firestore.collection(_collectionName);
      final QuerySnapshot snapshot = await collectionRef.limit(1).get();

      return snapshot.docs.isNotEmpty;
    } catch (e) {
      print("Error checking collection existence: $e");
      return false; // Assume the collection doesn't exist in case of an error
    }
  }

  // Method to create a new collection in Firestore
  Future<void> createCollection() async {
    try {
      for (Product x in initProducts) {
        insertProduct(x);
      }
      print('Collection created successfully.');
    } catch (e) {
      print("Error creating collection: $e");
    }
  }

  Future<void> insertProduct(Product product) async {
    try {
      final CollectionReference collectionRef =
          _firestore.collection(_collectionName);

      // Convert the Product object to a map using the `toJson` method
      Map<String, dynamic> productData = product.toMap();

      // Use the `add()` method to insert the map as a new document in the collection
      await collectionRef.doc(product.id).set(productData);

      print('Product inserted successfully.');
    } catch (e) {
      print("Error inserting product: $e");
    }
  }

  // Method to update a product in Firestore based on its ID
  Future<void> updateProduct(Product product) async {
    try {
      Product newProduct = Product(
          id: product.id,
          name: product.name,
          description: product.description,
          price: product.price,
          availableQuantity: product.availableQuantity - product.quantity,
          imageUrl: product.imageUrl);
      final CollectionReference collectionRef =
          _firestore.collection(_collectionName);

      // Get the reference to the specific document based on the product ID
      final DocumentReference productRef = collectionRef.doc(product.id);

      // Use the `update` method to update the fields with the new data
      await productRef.update(newProduct.toMap());

      print('Product updated successfully.');
    } catch (e) {
      print("Error updating product: $e");
    }
  }

  Future<List<Product>> getAllProducts() async {
    List<Product> productList = [];

    try {
      final CollectionReference collectionRef =
          _firestore.collection(_collectionName);

      final QuerySnapshot querySnapshot = await collectionRef.get();

      // Loop through the documents and convert each one to a Product object
      querySnapshot.docs.forEach((doc) {
        Product product = Product(
            id: doc['id'],
            name: doc['name'],
            description: doc['description'],
            price: doc['Price'],
            availableQuantity: doc['AvailableQuantity'],
            imageUrl: doc['imageUrl']);
        productList.add(product);
      });

      return productList;
    } catch (e) {
      print("Error getting all products: $e");
      return productList; // Return an empty list in case of an error
    }
  }
}
