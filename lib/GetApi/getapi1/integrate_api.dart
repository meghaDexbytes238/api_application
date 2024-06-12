import 'dart:convert';
import 'package:http/http.dart' as http;
import 'model_employe.dart';

class ApiIntegrate{
  /// for model using
  Future <EmployeModel>fetchData() async{
    var url = Uri.parse('https://dummy.restapiexample.com/api/v1/employees');
    var response = await http.get(url);
    try{
      if(response.statusCode == 200){
        print(response.body);
        // var data = json.decode(response.body);
        // var data1 = jsonDecode(response.body);
        // print(data);
        // String str = data['status'];
        // print(str);
        // String MSG = data1['message'];
        // print(MSG);
        return EmployeModel.fromJson(jsonDecode(response.body));
      }else{
        throw Exception('Failed to load data');
      }
    }
    catch(e){
      throw Exception('$e');
      //   print(e);
    }
  }
  /// for model list using
 /* Future <List<Data>>fetchData1() async{
    var url = Uri.parse('https://dummy.restapiexample.com/api/v1/employees');
    var response = await http.get(url);
    try{
      if(response.statusCode == 200){
        print(response.body);
        List<Data> model = List<Data>.from(
            json.decode(response.body)['data'].map((x) => Data.fromJson(x)));
        return  model;
        // return List<Data>.
        // from(json.decode(response.body)['data'].map((x) => Data.fromJson(x)));
      }else{
        throw Exception('Failed to load data');
      }
    }
    catch(e){
      throw Exception('$e');
      //   print(e);
    }
  }*/
  /// direct list send from model
 /*Future<List<Data>?>fetchData2() async{
    var url = Uri.parse('https://dummy.restapiexample.com/api/v1/employees');
    var response = await http.get(url);
    try{
      if(response.statusCode == 200){
        print(response.body);

   //  EmployeModel emp = EmployeModel.fromJson(jsonDecode(response.body)).data;
     print('${EmployeModel.fromJson(jsonDecode(response.body)).data}');
        return EmployeModel.fromJson(jsonDecode(response.body)).data;
      }else{
        throw Exception('Failed to load data');
      }
    }
    catch(e){
      throw Exception('$e');
      //   print(e);
    }
  }*/
}
