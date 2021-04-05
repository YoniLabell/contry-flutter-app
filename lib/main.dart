import 'package:flutter/material.dart';
import 'package:country_flutter_app/screens/home.dart';
import 'package:country_flutter_app/screens/choose_country.dart';
import 'package:country_flutter_app/screens/loading.dart';



void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/':(context)=>Loading(),
    '/home':(context)=> Home(),
    '/country':(context)=> ChooseCountry(),
  },

));


