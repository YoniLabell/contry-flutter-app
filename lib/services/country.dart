import 'package:http/http.dart';
import 'dart:convert';


class Country {

  String flag; // the url to get the flag
  String name;
  String population;
  String capitalName;

  Country(String flag,String name,String population,String capitalName)
  {
    this.flag=flag;
    this.name=name;
    this.population=population;
    this.capitalName=capitalName;


  }

}


Future<List> getServerData() async {
  String url = 'https://restcountries.eu/rest/v2/all';
  final response = await get(Uri.parse(url), headers: {"Accept": "application/json"});

  if (response.statusCode == 200) {
    print(response.body);
    return json.decode(response.body);
  }
  else {
    print("error from server : $response");
    throw Exception('Failed to load post');
  }
}

//not in use
Future<List<Country>> getContries() async {

  List<Country> allContries=[];
  try
  {
   Response response = await get(
   Uri.parse('https://restcountries.eu/rest/v2/all'));
   List body = json.decode(response.body) as List;
   //print(body[200]);
   for (int i=0;i< body.length;i++)
   {
     print(body[i]);
     allContries.add(Country(i.toString(),i.toString(),i.toString(),i.toString()));
     print(i.toString());

   }
  }
  finally
  {
    print(allContries.length);
    return allContries;
  }





}



