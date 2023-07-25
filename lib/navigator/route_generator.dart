import 'package:flutter/material.dart';
import 'package:task4/cartPage.dart';
import 'package:task4/home.dart';
import 'package:task4/productsPage.dart';
import '../main.dart';



class RouteGenerator{
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static Route<dynamic> generateRoute(RouteSettings settings){
    final args = settings.arguments;
    final String routeName = settings.name!;

    switch (routeName){
      case '/' :
        return MaterialPageRoute(builder: (_) => Home());
      case '/productPage' : 
        return MaterialPageRoute(builder: (_) => ProductsPage());
      case '/cartPage' : 
        return MaterialPageRoute(builder: (_) => CartPage());
      default:
        return MaterialPageRoute(builder: (_) => errorRoute());
    }
  }
}

class errorRoute extends StatelessWidget {
  const errorRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('404 Not Found')),
      body: Center(child: Text('Page not found')),
    );
  }
}


