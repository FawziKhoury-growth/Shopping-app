import 'package:flutter/material.dart';
import 'package:task4/firebase/firestore_helper.dart';
import 'package:task4/navigator/route_navigator.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}



class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initDatabase();
    
  }

  void initDatabase() async {
    bool exist =await FireStoreHelper.instance.doesCollectionExist();
    if(!exist){
      await FireStoreHelper.instance.createCollection();
      
    }
    RouteNavigator.goToAndRemove('home');
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.network(
          'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c7/Target_%282018%29.svg/800px-Target_%282018%29.svg.png',
          // width: MediaQuery. of(context). size. width ,
          // height: MediaQuery. of(context). size. height,
          ),
      ),
    );
  }
}