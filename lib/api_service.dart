import 'package:covid/summary_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:http/http.dart' ;


class Service{
  
static Future<Summary> postService()async {
  String baseURL= "https://api.covid19api.com/summary";
  Response response= await http.get(baseURL);
  try{
  if(response.statusCode==200){
Summary result=summaryFromJson(response.body);
return result;
  }
  else{
return Summary();
  }
}catch(e){
  throw  "hata";
}
}
}


















/*class Service{
  
static Future<List<Post>> postService()async {
  String baseURL= "https://jsonplaceholder.typicode.com/posts";
  Response response= await http.get(baseURL);
  try{
  if(response.statusCode==200){
List<Post> result=postFromJson(response.body);
return result;
  }
  else{
return List<Post>();
  }
}catch(e){
  return  List<Post>();
}
}
}
*/