import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutterapp2/login.dart';
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
// nombrs()
/*
void main(){
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return nombrs() ; // home_page()
  }
}
*/
// hada 24/05/2020


void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  var a = await data_tout();
  var info_tout = await a.data() ;
  var parcent1 = await a.percent('info') ;
  var parcent2 = await a.percent('info2') ;
  var parcent3 = await a.percent('info3') ;
  //var nv = await a.get_nv('info');
  //print(nv);
  //List<double> parcent = [parcent1,parcent2,parcent3];

  //print('max qst is $p') ;
  //WidgetsFlutterBinding.ensureInitialized();
  /*

  var ponits_info =   await a.get_point('info');
  ///// info
  var parti1 = await a.data_parti1(ponits_info);
  var parti2 = await a.data_parti2(ponits_info);
  var parti3 = await a.data_parti3(ponits_info);
  List<Map> info = [parti1,parti2,parti3];

  var ponits_info2 =   await a.get_point('info2');
  ///// info2
  var info2_parti1 = await a.info2_data_parti1(ponits_info2);
  var info2_parti2 = await a.info2__parti2(ponits_info2);
  var info2_parti3 = await a.info2__parti3(ponits_info2);
  List<Map> info2 = [info2_parti1,info2_parti2,info2_parti3];

  var ponits_info3 =   await a.get_point('info3');
  ///// info3
  var info3_parti1 = await a.info3_data_parti1(ponits_info3);
  var info3_parti2 = await a.info3__parti2(ponits_info3);
  var info3_parti3 = await a.info3__parti3(ponits_info3);
  List<Map> info3 = [info3_parti1,info3_parti2,info3_parti3];
  // tout les  doné
  List<List> info_tout = [info,info2,info3];

    */

  //var info = info_tout[1];
  //print('hadi hia ta3 info tout :  $info_tout');
  //data_parti1(ponits);

  // test

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

// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
// testing
/*
data ()async{
  // Construct the path to the app's writable database file:
  var dbDir = await getDatabasesPath();
  var dbPath = join(dbDir, "info.db");

// Delete any existing database:
  await deleteDatabase(dbPath);

// Create the writable database file from the bundled demo database file:
  ByteData data = await rootBundle.load("issues/models/info.db");
  List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  await File(dbPath).writeAsBytes(bytes);
  var db = await openDatabase(dbPath);
  List<Map> list = await db.rawQuery('SELECT  *  FROM parti1');

  /*
  list.forEach((k) {
    print(k['def1']);
  }); */

  //List<String> likes;


  return list.toList()[0];;
}

*/



// info (انشطة عددية)
/*
data_parti1(ponits) async {

  //WidgetsFlutterBinding.ensureInitialized();

  var dbDir = await getDatabasesPath();
  var dbPath = join(dbDir, "info.db");

// Delete any existing database:
  /*
  await deleteDatabase(dbPath);

// Create the writable database file from the bundled demo database file:
  ByteData data = await rootBundle.load("issues/models/info.db");
  List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  await File(dbPath.toString()).writeAsBytes(bytes);

   */
  var db = await openDatabase(dbPath);
  List<Map> list = await db.rawQuery('SELECT  *  FROM parti1');
  //print(list[ponits]);

  
  return list[ponits -1];
}

data_parti2(ponits) async {
  var dbDir = await getDatabasesPath();
  var dbPath = join(dbDir, "info.db");

// Delete any existing database:
  /*
  await deleteDatabase(dbPath);

// Create the writable database file from the bundled demo database file:
  ByteData data = await rootBundle.load("issues/models/info.db");
  List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  await File(dbPath).writeAsBytes(bytes);

   */
  var db = await openDatabase(dbPath);
  List<Map> list = await db.rawQuery('SELECT  *  FROM parti2');
  //print(list[ponits]);
  /*
  list.forEach((k) {
    print(k['def1']);
  }); */
  return list[ponits - 1 ];
}



data_parti3(ponits) async {
  var dbDir = await getDatabasesPath();
  var dbPath = join(dbDir, "info.db");

// Delete any existing database:
  /*
  await deleteDatabase(dbPath);

// Create the writable database file from the bundled demo database file:
  ByteData data = await rootBundle.load("issues/models/info.db");
  List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  await File(dbPath).writeAsBytes(bytes);

   */
  var db = await openDatabase(dbPath);
  List<Map> list = await db.rawQuery('SELECT  *  FROM parti3');
  //print(list[ponits]);
  /*
  list.forEach((k) {
    print(k['def1']);
  }); */
  return list[ponits -1];
}

// info2 (الدوال)

info2_data_parti1(ponits) async {
  var dbDir = await getDatabasesPath();
  var dbPath = join(dbDir, "info2.db");

// Delete any existing database:
  /*
  await deleteDatabase(dbPath);

// Create the writable database file from the bundled demo database file:
  ByteData data = await rootBundle.load("issues/models/info2.db");
  List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  await File(dbPath).writeAsBytes(bytes);

   */
  var db = await openDatabase(dbPath);
  List<Map> list = await db.rawQuery('SELECT  *  FROM parti1');
  //print(list[ponits]);
  /*
  list.forEach((k) {
    print(k['def1']);
  }); */
  return list[ponits -1];
}

info2__parti2(ponits) async {
  var dbDir = await getDatabasesPath();
  var dbPath = join(dbDir, "info2.db");

// Delete any existing database:
  /*
  await deleteDatabase(dbPath);

// Create the writable database file from the bundled demo database file:
  ByteData data = await rootBundle.load("issues/models/info2.db");
  List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  await File(dbPath).writeAsBytes(bytes);

   */
  var db = await openDatabase(dbPath);
  List<Map> list = await db.rawQuery('SELECT  *  FROM parti2');
  //print(list[ponits]);
  /*
  list.forEach((k) {
    print(k['def1']);
  }); */
  return list[ponits - 1 ];
}



info2__parti3(ponits) async {
  var dbDir = await getDatabasesPath();
  var dbPath = join(dbDir, "info2.db");

// Delete any existing database:
  /*
  await deleteDatabase(dbPath);

// Create the writable database file from the bundled demo database file:
  ByteData data = await rootBundle.load("issues/models/info2.db");
  List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  await File(dbPath).writeAsBytes(bytes);

   */
  var db = await openDatabase(dbPath);
  List<Map> list = await db.rawQuery('SELECT  *  FROM parti3');
  //print(list[ponits]);
  /*
  list.forEach((k) {
    print(k['def1']);
  }); */
  return list[ponits -1];
}

// info2 (الدوال)

info3_data_parti1(ponits) async {
  var dbDir = await getDatabasesPath();
  var dbPath = join(dbDir, "info3.db");

// Delete any existing database:
  /*
  await deleteDatabase(dbPath);

// Create the writable database file from the bundled demo database file:
  ByteData data = await rootBundle.load("issues/models/info3.db");
  List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  await File(dbPath).writeAsBytes(bytes);

   */
  var db = await openDatabase(dbPath);
  List<Map> list = await db.rawQuery('SELECT  *  FROM parti1');
  //print(list[ponits]);
  /*
  list.forEach((k) {
    print(k['def1']);
  }); */
  return list[ponits -1];
}

info3__parti2(ponits) async {
  var dbDir = await getDatabasesPath();
  var dbPath = join(dbDir, "info3.db");

// Delete any existing database:
  /*
  await deleteDatabase(dbPath);

// Create the writable database file from the bundled demo database file:
  ByteData data = await rootBundle.load("issues/models/info3.db");
  List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  await File(dbPath).writeAsBytes(bytes);

   */
  var db = await openDatabase(dbPath);
  List<Map> list = await db.rawQuery('SELECT  *  FROM parti2');
  //print(list[ponits]);
  /*
  list.forEach((k) {
    print(k['def1']);
  }); */
  return list[ponits - 1 ];
}



info3__parti3(ponits) async {
  var dbDir = await getDatabasesPath();
  var dbPath = join(dbDir, "info3.db");
/*
// Delete any existing database:
  await deleteDatabase(dbPath);

// Create the writable database file from the bundled demo database file:
  ByteData data = await rootBundle.load("issues/models/info3.db");
  List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  await File(dbPath).writeAsBytes(bytes);

 */
  var db = await openDatabase(dbPath);
  List<Map> list = await db.rawQuery('SELECT  *  FROM parti3');
  //print(list[ponits]);
  /*
  list.forEach((k) {
    print(k['def1']);
  }); */
  return list[ponits -1];
}




Future<int>  get_point() async {
  var dbDir = await getDatabasesPath();
  var dbPath = join(dbDir, "info.db");

// Delete any existing database:
  //await deleteDatabase(dbPath);

// Create the writable database file from the bundled demo database file:

  var db = await openDatabase(dbPath);
  List<Map> list = await db.rawQuery('SELECT  ponits  FROM point');
  int t = list[0]['ponits'] ;
  print(t);
  return  t;

}

*/