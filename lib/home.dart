import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task4/Button/Button.dart';
import 'package:task4/Product.dart';
import 'package:task4/database_helpler.dart';
import 'package:task4/navigator/route_navigator.dart';
import 'package:task4/provider/productsProvider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<listProductProvider>(context, listen: false).fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            CustomButton(
              title: "Go to product Page",
              icon: Icon(Icons.arrow_forward),
              color: Colors.blue,
              onPressed: () {
                RouteNavigator.goTo('productPage');
              },
            ),
            // CustomButton(title: "Card", color: Colors.blue, onPressed: )
            CustomButton(
              title: "Go to Cart Page",
              icon: Icon(Icons.arrow_forward),
              color: Colors.blue,
              onPressed: () {
                RouteNavigator.goTo('cartPage');
              },
            ),
          ],
        ),
      ),
    );
  }
}
