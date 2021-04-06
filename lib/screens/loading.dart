import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:country_flutter_app/services/country.dart';
import 'dart:async';
import 'package:flutter_svg/flutter_svg.dart';



class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  Future<List> serverData;


  @override
  void initState() {

    super.initState();

    serverData = getServerData();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Countries'),
        ),
        body: Container(
            child: Column(
              children: <Widget>[
                FutureBuilder<List>(
                  future: serverData, //sets serverData as the expected Future
                  builder: (context, snapshot) {

                    if (snapshot.hasData) { //checks for non-null return value from serverData
                      return getListView(snapshot.data, "server"); // snapshot.data is return value of serverData
                    }
                    else if (snapshot.hasError) { //checks if the response threw error
                      return Text("${snapshot.error}");
                    }
                    return CircularProgressIndicator();
                  },
                ),
              ],
            ),
        )
    );
  }
}


Widget getListView(List<dynamic> listData, mapKey) {
  return new Container(
    //color: Colors.white,
    height:600,
    padding: EdgeInsets.only( top: 10),
    child: ListView.separated(
      shrinkWrap:true,
      itemCount: listData.length,
      itemBuilder: (BuildContext context, int index) {
        String countryName = listData[index]['name'];
        String imageSrc = listData[index]['flag'];//the url to get flag
        String population = listData[index]['population'].toString();
        String capitalName = listData[index]['capital'];
        Country aCountry=Country(imageSrc,countryName,population,capitalName);//an obj to pass to next page if tap
        return Card(
          child: ListTile(
              title: Text('$countryName'),
              leading: ClipRRect(

                  child: SvgPicture.network(
                    imageSrc,
                    width: 70,
                    height: 40,
                    fit: BoxFit.cover,
                    placeholderBuilder: (BuildContext context) => Container(
                        //padding: const EdgeInsets.all(30.0),
                       child: const CircularProgressIndicator()
                  ),
                ),
              ),
        onTap: () {//print('Card Clicked');
        Navigator.pushNamed(context, '/country',arguments: {'aCountry':aCountry});
        },
        ),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    ),
  );
}



