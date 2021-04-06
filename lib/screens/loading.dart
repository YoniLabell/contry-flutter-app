import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:async';
import 'package:country_flutter_app/services/country.dart';




class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setup() async {
    Future<List> serverData;
    serverData = getServerData();
    await serverData;
    Navigator.pushNamed(context, '/home',arguments: {'allCountries':serverData});
    //Navigator.

  }

  @override
  void initState() {

    super.initState();
    setup();



  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[300],
      body: Center(

        child: SpinKitFadingCircle(
          color: Colors.blue[50],
          size: 100.0,
        ),

      ),
    );
  }
}






