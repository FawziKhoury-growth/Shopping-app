import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task4/database_helpler.dart';
import 'package:task4/navigator/route_generator.dart';
import 'package:task4/provider/productsProvider.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseHelper.initDatabase();
  
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => listProductProvider()),
        
      ],
      child: MyApp()
      )
    );
}




class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyCard',
      initialRoute: '/',
      navigatorKey: RouteGenerator.navigatorKey,
      onGenerateRoute: RouteGenerator.generateRoute,
      
    );
  }
}

