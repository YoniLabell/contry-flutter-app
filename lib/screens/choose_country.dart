import 'package:flutter/material.dart';
import 'package:country_flutter_app/services/country.dart';
import 'package:flutter_svg/flutter_svg.dart';
class ChooseCountry extends StatefulWidget {
  @override
  _ChooseCountryState createState() => _ChooseCountryState();
}

class _ChooseCountryState extends State<ChooseCountry> {


  Map data = {};


  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    Country aCountry=data['aCountry'];

    return Scaffold(
      backgroundColor: Colors.grey[150],
      appBar: AppBar(
        backgroundColor: Colors.blue[300],
        title: Text(aCountry.name),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
            children: <Widget>[
              Flexible(
                flex:1,
               // alignment: Alignment.topCenter,
                child: SvgPicture.network(
                  aCountry.flag,
                  fit:BoxFit.fill,
                ),
              ),
            
            Flexible(
              flex:2,
              child: Text('Population: '+aCountry.population+'\n'+'Capital: '+aCountry.capitalName,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            )

            ],
          ),

       );


  }
}
