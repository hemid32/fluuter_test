import 'dart:io';

import 'package:firebase_admob/firebase_admob.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp2/loading.dart';
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
    home: wilcom(), //home_page(info_tout , parcent1 , parcent2,parcent3)//login(title: 'Flutter Login'), //home_page(info_tout), // FirstRoute() // home_page
  ));
  //getdata();
  //data_partin1();


  //runApp(wilcom());



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

// add wilcom page

class wilcom extends StatefulWidget {
  @override
  _part4State createState() => _part4State();
}

class _part4State extends State<wilcom> {
  bool lod = false ;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale("ar", "AE"), // OR Locale('ar', 'AE') OR Other RTL locales
      ],
      home: Scaffold(
        body: _mybody(context),
      ),
    );
  }


  Widget _mybody(context) {
    return lod ? loading() : Column(
      children: <Widget>[
        Center(child: Container(
          margin: EdgeInsets.only(top: 90),
          child: Text('مرحبا بك عزيزي التلميذ',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold)),
        )
        ),
        Center(child: Container(
            width: 250,
            height: 250,
            padding: EdgeInsets.only(top: 60),
            child: Image.asset('issues/images/logo.png')
        )
        ),
        Center(
            child: Container(
              margin: EdgeInsets.only(top: 150),
              child: RaisedButton(
                  padding: EdgeInsets.only(
                      top: 10, bottom: 10, right: 70, left: 70),
                  color: Colors.tealAccent,


                  child: Text('الصفحة الرئيسية'),
                  onPressed: () async {
                    //print('hemidi love');
                    setState(() {
                      lod = true ;
                    });

                    var a = await data_tout();
                    var info_tout = await a.data();
                    var parcent1 = await a.percent('info');
                    var parcent2 = await a.percent('info2');
                    var parcent3 = await a.percent('info3');
                    Navigator.pop(context);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            home_page(
                                info_tout, parcent1, parcent2, parcent3)));
                    //Navigator.pop(context);
                    setState(() {
                      lod = false ;
                    });


                  }
              ),
            )
        )
      ],
    );
    //return
  }
}