import 'dart:convert';

import 'package:api_application/GetApi/getapi2/product_model.dart';
import 'package:http/http.dart' as http;
class ApiIntegration{
  Future<ProductListMode>productDataFetch() async{
    var url = Uri.parse('https://dummyjson.com/products');
 var response = await http.get(url);
 try{
   if(response.statusCode ==200){
     print(response.body);
     var data = json.decode(response.body);
     print(data);
     return ProductListMode.fromJson(jsonDecode(response.body));
   }
   else{
     throw Exception('Failed to load data');   }
 }
 catch(e){
   throw Exception(e);
 }
  }

}