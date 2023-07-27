import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task4/provider/productsProvider.dart';

import 'Button/Button.dart';
import 'Product.dart';
import 'navigator/route_navigator.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({
    super.key,
  });

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  List<Product> listProduct = [];

  @override
  void initState() {
    super.initState();
    print('init');
  }

  Widget productUI(Product product) {
    return Card(
      child: Container(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  height: 120,
                  child: Image.network(product.imageUrl, fit: BoxFit.cover)),
              Column(
                children: [
                  Text("name: ${product.name}"),
                  Text("${product.description}"),
                ],
              ),
              Text("Price: ${product.price}"),
              Text("totalAvailable: ${product.availableQuantity}"),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                      title: "",
                      icon: Icon(Icons.remove),
                      color: Colors.red,
                      onPressed: () => {
                            if (product.quantity != 0)
                              {
                                Provider.of<listProductProvider>(context,
                                        listen: false)
                                    .decrement(product.id)
                              }
                          }),
                  SizedBox(
                    width: 10,
                  ),
                  Text("${product.quantity}"),
                  SizedBox(
                    width: 10,
                  ),
                  CustomButton(
                      title: "",
                      icon: Icon(Icons.add),
                      color: Colors.blue,
                      onPressed: () => {
                            if (product.quantity < product.availableQuantity)
                              {
                                Provider.of<listProductProvider>(context,
                                        listen: false)
                                    .increment(product.id)
                              }
                          }),
                ],
              )
            ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    listProduct = Provider.of<listProductProvider>(context).listProduct;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('product page'),
            IconButton(
                onPressed: () => RouteNavigator.goTo('cartPage'),
                icon: Icon(Icons.shopping_cart))
          ],
        ),
      ),
      body: StreamBuilder(
        stream: Provider.of<listProductProvider>(context).stream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error fetching products'),
            );
          } else {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: (50 / 70),
                crossAxisCount: 2, // Two items in each row
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 5.0,
              ),
              itemCount: snapshot.data!.docs.length,
               itemBuilder: (context, index) {
                Map<String, dynamic> data = snapshot.data!.docs[index].data()! as Map<String, dynamic>;
                Product product = Product.fromMap(data);
                return productUI(product);
              },
            );
          }
        },
      ),

      // Center(
      //     child: GridView.builder(
      //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //     childAspectRatio: (50 / 70),
      //     crossAxisCount: 2, // Two items in each row
      //     crossAxisSpacing: 5.0,
      //     mainAxisSpacing: 5.0,
      //   ),
      //   itemCount: listProduct.length,
      //   itemBuilder: (context, index) => productUI(listProduct[index]),
      // )),
    );
  }
}
