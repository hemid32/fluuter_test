import 'dart:io';

import 'package:firebase_admob/firebase_admob.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp2/model/ponits.dart';
import 'package:path_provider/path_provider.dart';
import 'home_page.dart';
import 'part1_nombrs.dart';
import 'part2_nombrs.dart';
import 'part3_nombrs.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:path/path.dart';
import 'package:collection/collection.dart';
import 'model/Dog.dart';
import 'package:path/path.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart';

import 'package:flutter/services.dart' show rootBundle;
import 'model/Dog.dart';





void main() async{

  WidgetsFlutterBinding.ensureInitialized();


  var a = await data_tout();
  var info_tout = await a.data() ;
  var parcent1 = await a.percent('info') ;
  var parcent2 = await a.percent('info2') ;
  var parcent3 = await a.percent('info3') ;


  runApp(MaterialApp(

    title: 'Navigation Basics',
    localizationsDelegates: [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      const FallbackCupertinoLocalisationsDelegate(),

    ],
    supportedLocales: [
      Locale("ar", "AE"), // OR Locale('ar', 'AE') OR Other RTL locales
    ],
    home: home_page(info_tout , parcent1 , parcent2,parcent3)//login(title: 'Flutter Login'), //home_page(info_tout), // FirstRoute() // home_page
  ));
  //getdata();
  //data_partin1();



}
class FallbackCupertinoLocalisationsDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalisationsDelegate();

  @override
  bool isSupported(Locale locale) => true;

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      DefaultCupertinoLocalizations.load(locale);

  @override
  bool shouldReload(FallbackCupertinoLocalisationsDelegate old) => false;
}

