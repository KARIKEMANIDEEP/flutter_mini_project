import 'package:flutter/material.dart';
import 'package:mini_project_flutter/features/products/product_api.dart';
class ProductProvider extends ChangeNotifier{
  bool isLoading = false;
  String error = '';
  List<String> products = [];
  Future<void> loadProducts() async{
    isLoading = true;
    error = '';
    notifyListeners();
    try{
      products = await ProductApi.fetchProducts();
    }catch(e){
      error = e.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}