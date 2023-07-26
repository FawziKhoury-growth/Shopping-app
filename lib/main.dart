import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:task4/provider/productsProvider.dart';

import 'firebase/firebase_options.dart';
import 'navigator/route_generator.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  // await DatabaseHelper.initDatabase();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  
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

