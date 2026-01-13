import 'dart:convert';
import 'package:http/http.dart'as http;
class ProductApi{
  static Future<List<String>> fetchProducts() async{
    final url = Uri.parse('https://dummyjson.com/products');
    final response = await http.get(url);
    if(response.statusCode == 200){
      final data = jsonDecode(response.body);
      final List list = data['products'];
      return list.map((e) => e['title'].toString()).toList();
    }
    else{
      throw Exception('Unable to load the products');
    }
  }
}