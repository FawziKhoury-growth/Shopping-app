import 'package:flutter/material.dart';

import '../cartPage.dart';
import '../home.dart';
import '../loadingScreen.dart';
import '../productsPage.dart';





class RouteGenerator{
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static Route<dynamic> generateRoute(RouteSettings settings){
    final args = settings.arguments;
    final String routeName = settings.name!;

    switch (routeName){
      case '/' :
        return MaterialPageRoute(builder: (_) => LoadingScreen());
      case '/home' :
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


