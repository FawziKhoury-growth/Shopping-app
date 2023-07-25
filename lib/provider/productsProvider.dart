import 'package:flutter/material.dart';
import 'package:task4/Product.dart';
import 'package:task4/database_helpler.dart';
import 'package:task4/navigator/route_navigator.dart';


class listProductProvider with ChangeNotifier {
  List<Product> _listProduct = [];
  List<Product> _listUserProduct = [];

  
  List <Product> get listProduct => _listProduct;
  List <Product> get listUserProduct => _listUserProduct;

  void fetchProducts() async {
    if(_listProduct.isNotEmpty) return; 
    List<Product> products = await DatabaseHelper.getProducts();
    _listProduct=products;
   print("test");
    notifyListeners();
    
  }

  void onCheckOut() async{
    for(Product product in _listUserProduct){
      await DatabaseHelper.updateProduct(product);
    }
    await resetListUser();

      RouteNavigator.goToAndRemove('');
      notifyListeners();
  }
  
 Future <void> resetListUser()async{
    _listProduct.clear();
    _listUserProduct.clear();
  
 }
 

  void increment(String id){
    bool found = false;
    for (Product product in _listProduct) {
      if (product.id == id) {
        product.quantity++;
        for(Product x in _listUserProduct){
          if(x.id==product.id){
            found = true;
          }
        }
        if(!found){
          _listUserProduct.add(product);
        }
        
        notifyListeners();
        return;
      }
    }
  }
  
  void decrement(String id){
    
    for (Product product in _listProduct) {
      if (product.id == id) {
        product.quantity--;
        if(product.quantity==0){
          _listUserProduct.removeWhere((element) => element.id==product.id);
        }
        notifyListeners();
        return;
      }
    }
  }

}