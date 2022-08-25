import 'dart:html';

import 'package:http/http.dart' as http;
class ProductApi{
  static Future getProducts(){
    Uri p='http://10.0.2.2:3000/products' as Uri;
    return http.get(p);
  }

  static Future getProductsByCategoryId(int categoryId){
    Uri p='http://10.0.2.2:3000/products?categoryId=$categoryId' as Uri;
    return http.get(p);
  }
}