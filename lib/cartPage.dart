import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task4/Button/Button.dart';
import 'package:task4/Product.dart';
import 'package:task4/provider/productsProvider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  Widget productUI(Product product) {
    return Card(
      child: Container(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(product.imageUrl),
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
    List<Product> listUserProduct =
        Provider.of<listProductProvider>(context).listUserProduct;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('cart page'),
            CustomButton(
                title: "CheckOut",
                icon: Icon(Icons.done_all),
                color: Colors.blue,
                onPressed: () {
                  Provider.of<listProductProvider>(context, listen: false)
                      .onCheckOut();
                })
          ],
        ),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: (50 / 70),
          crossAxisCount: 2, // Two items in each row
          crossAxisSpacing: 5.0,
          mainAxisSpacing: 5.0,
        ),
        itemCount: listUserProduct.length,
        itemBuilder: (context, index) => productUI(listUserProduct[index]),
      ),
    );
  }
}
