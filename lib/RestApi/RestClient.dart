
import 'dart:convert';
import 'dart:js';

import 'package:http/http.dart' as http;

import '../style.dart';


Future<List> GetProductData() async{
  var url = Uri.parse("https://crud.teamrabbil.com/api/v1/ReadProduct");
  var PostHeader= {"Content-Type": "application/json"};
  var response = await http.get(url, headers: PostHeader);
  var resultCode= response.statusCode;
  var resultBody= json.decode(response.body);
  // print(resultBody);

  if(resultCode== 200 && resultBody['status']== 'success'){

    return resultBody['data'];
  }else{
    return [];
  }
}




   Future<bool>  ProductCreateRequest(FormValues) async{

    var url = Uri.parse("https://crud.teamrabbil.com/api/v1/CreateProduct");

    var PostBody= json.encode(FormValues);
    var PostHeader= {"Content-Type": "application/json"};

    // Await the http get response, then decode the json-formatted response.
    var response = await http.post(url, headers: PostHeader, body: PostBody);
    var resultCode= response.statusCode;
    var resultBody= json.decode(response.body);

    if(resultCode== 200 && resultBody['status']== 'success'){

        // MySnackBar("Successfully added product", context);
        return true;
    }else{
      // MySnackBar("something went wrong", context);
        return false;
    }


}