import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutterapp2/fine.dart';
import 'package:flutterapp2/model/ponits.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:path/path.dart';
import 'package:collection/collection.dart';
import 'package:path/path.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart';


class data_tout {

  data() async {
    WidgetsFlutterBinding.ensureInitialized();
    var ponits_info  = await get_point('info');
    ///// info
    var parti1 = await data_parti1(ponits_info);
    var parti2 = await data_parti2(ponits_info);
    var parti3 = await data_parti3(ponits_info);
    List<Map> info = [parti1, parti2, parti3];

    var ponits_info2  = await get_point('info2');
    ///// info2
    var info2_parti1 = await info2_data_parti1(ponits_info2);
    var info2_parti2 = await info2__parti2(ponits_info2);
    var info2_parti3 = await info2__parti3(ponits_info2);
    List<Map> info2 = [info2_parti1, info2_parti2, info2_parti3];

    var ponits_info3  = await get_point('info3');
    ///// info3
    var info3_parti1 = await info3_data_parti1(ponits_info3);
    var info3_parti2 = await info3__parti2(ponits_info3);
    var info3_parti3 = await info3__parti3(ponits_info3);
    List<Map> info3 = [info3_parti1, info3_parti2, info3_parti3];
    // tout les  doné
    List<List> info_tout = [info, info2, info3];
    return info_tout;
    // [info , info1 , info3]
  }


  data_parti1(ponits) async {
    var dbDir = await getDatabasesPath();
    var dbPath = join(dbDir, "info.db");

// Delete any existing database:

  /*
    await deleteDatabase(dbPath);
// Create the writable database file from the bundled demo database file:
    ByteData data = await rootBundle.load("issues/models/info.db");
    List<int> bytes = data.buffer.asUint8List(
        data.offsetInBytes, data.lengthInBytes);
    await File(dbPath).writeAsBytes(bytes);

   */



    var db = await openDatabase(dbPath);
    List<Map> list = await db.rawQuery('SELECT  *  FROM parti1');
    //print(list[ponits]);
    /*
  list.forEach((k) {
    print(k['def1']);
  }); */
    return list[ponits - 1];
  }

  data_parti2(ponits) async {
    var dbDir = await getDatabasesPath();
    var dbPath = join(dbDir, "info.db");

// Delete any existing database:
    /*
    await deleteDatabase(dbPath);

// Create the writable database file from the bundled demo database file:
    ByteData data = await rootBundle.load("issues/models/info.db");
    List<int> bytes = data.buffer.asUint8List(
        data.offsetInBytes, data.lengthInBytes);
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
    List<int> bytes = data.buffer.asUint8List(
        data.offsetInBytes, data.lengthInBytes);
    await File(dbPath).writeAsBytes(bytes);

     */
    var db = await openDatabase(dbPath);
    List<Map> list = await db.rawQuery('SELECT  *  FROM parti3');
    //print(list[ponits]);
    /*
  list.forEach((k) {
    print(k['def1']);
  }); */
    return list[ponits - 1];
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
    List<int> bytes = data.buffer.asUint8List(
        data.offsetInBytes, data.lengthInBytes);
    await File(dbPath).writeAsBytes(bytes);

     */
    var db = await openDatabase(dbPath);
    List<Map> list = await db.rawQuery('SELECT  *  FROM parti1');
    //print(list[ponits]);
    /*
  list.forEach((k) {
    print(k['def1']);
  }); */
    return list[ponits - 1];
  }

  info2__parti2(ponits) async {
    var dbDir = await getDatabasesPath();
    var dbPath = join(dbDir, "info2.db");

// Delete any existing database:
    /*
    await deleteDatabase(dbPath);

// Create the writable database file from the bundled demo database file:
    ByteData data = await rootBundle.load("issues/models/info2.db");
    List<int> bytes = data.buffer.asUint8List(
        data.offsetInBytes, data.lengthInBytes);
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
    List<int> bytes = data.buffer.asUint8List(
        data.offsetInBytes, data.lengthInBytes);
    await File(dbPath).writeAsBytes(bytes);

     */
    var db = await openDatabase(dbPath);
    List<Map> list = await db.rawQuery('SELECT  *  FROM parti3');
    //print(list[ponits]);
    /*
  list.forEach((k) {
    print(k['def1']);
  }); */
    return list[ponits - 1];
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
    List<int> bytes = data.buffer.asUint8List(
        data.offsetInBytes, data.lengthInBytes);
    await File(dbPath).writeAsBytes(bytes);

     */
    var db = await openDatabase(dbPath);
    List<Map> list = await db.rawQuery('SELECT  *  FROM parti1');
    //print(list[ponits]);
    /*
  list.forEach((k) {
    print(k['def1']);
  }); */
    return list[ponits - 1];
  }

  info3__parti2(ponits) async {
    var dbDir = await getDatabasesPath();
    var dbPath = join(dbDir, "info3.db");

// Delete any existing database:
    /*
    await deleteDatabase(dbPath);

// Create the writable database file from the bundled demo database file:
    ByteData data = await rootBundle.load("issues/models/info3.db");
    List<int> bytes = data.buffer.asUint8List(
        data.offsetInBytes, data.lengthInBytes);
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

// Delete any existing database:
    /*
    await deleteDatabase(dbPath);

// Create the writable database file from the bundled demo database file:
    ByteData data = await rootBundle.load("issues/models/info3.db");
    List<int> bytes = data.buffer.asUint8List(
        data.offsetInBytes, data.lengthInBytes);
    await File(dbPath).writeAsBytes(bytes);

     */
    var db = await openDatabase(dbPath);
    List<Map> list = await db.rawQuery('SELECT  *  FROM parti3');
    //print(list[ponits]);
    /*
  list.forEach((k) {
    print(k['def1']);
  }); */
    return list[ponits - 1];
  }


  Future<int> get_point(file) async {
    String file1 = file + '.db' ;
    var dbDir = await getDatabasesPath();
    var dbPath = join(dbDir, file1);

// Delete any existing database:
    /*
    await deleteDatabase(dbPath);

// Create the writable database file from the bundled demo database file:
    ByteData data = await rootBundle.load("issues/models/info.db");
    List<int> bytes = data.buffer.asUint8List(
        data.offsetInBytes, data.lengthInBytes);
    await File(dbPath).writeAsBytes(bytes);

     */
    var db = await openDatabase(dbPath);
    List<Map> list = await db.rawQuery('SELECT  ponits  FROM point');
    int t = list[0]['ponits'];
    return t;
  }
  Future<int> get_nv(file) async {
    String file1 = file + '.db' ;
    var dbDir = await getDatabasesPath();
    var dbPath = join(dbDir, file1);

// Delete any existing database:
    /*
    await deleteDatabase(dbPath);

// Create the writable database file from the bundled demo database file:
    ByteData data = await rootBundle.load("issues/models/info.db");
    List<int> bytes = data.buffer.asUint8List(
        data.offsetInBytes, data.lengthInBytes);
    await File(dbPath).writeAsBytes(bytes);

     */
    var db = await openDatabase(dbPath);
    List<Map> list = await db.rawQuery('SELECT  niveu  FROM point');
    int t = list[0]['niveu'];
    return t;
  }


// Update some record
  update_point(file) async {
    String file1 = file + '.db' ;
    var dbDir = await getDatabasesPath();
    var dbPath = join(dbDir, file1);
    print(dbPath);

// Delete any existing database:
    //await deleteDatabase(dbPath);
    var db = await openDatabase(dbPath);
    List<Map> list = await db.rawQuery('SELECT  ponits  FROM point');
    int t = list[0]['ponits'] ;
    var db_update = await openDatabase(dbPath);
    int count = await db_update.rawUpdate(
        'UPDATE point SET ponits = ? WHERE ponits = ?',
        [t+1 , t]);
    print('updated: $count');
    List<Map> list2 = await db.rawQuery('SELECT  ponits  FROM point');
    int t2 = list2[0]['ponits']  ;
    print('valur vv: $t2');
    await db_update.close();

  }
  update_point_if_complite (file) async {
    String file1 = file + '.db' ;
    var dbDir = await getDatabasesPath();
    var dbPath = join(dbDir, file1);
    print(dbPath);

// Delete any existing database:
    //await deleteDatabase(dbPath);
    var db = await openDatabase(dbPath);
    List<Map> list = await db.rawQuery('SELECT  ponits  FROM point');
    int t = list[0]['ponits'] ;
    var db_update = await openDatabase(dbPath);
    int count = await db_update.rawUpdate(
        'UPDATE point SET ponits = ? WHERE ponits = ?',
        [1 , t]);
    int count2 = await db_update.rawUpdate(
        'UPDATE point SET niveu = ? WHERE niveu = ?',
        [1 , 0]);
    //print('updated: $count');
    List<Map> list2 = await db.rawQuery('SELECT  ponits  FROM point');
    int t2 = 1  ;
    //print('valur vv: $t2');
    await db_update.close();
    //return 'c'

  }
   max_qastion_(file) async {
    String file1 = file + '.db' ;

    var dbDir = await getDatabasesPath();
    var dbPath = join(dbDir, file1);
    //print(dbPath);

// Delete any existing database:
    //await deleteDatabase(dbPath);
    var db = await openDatabase(dbPath);
    List<Map> list = await db.rawQuery('SELECT  *  FROM parti1');


    //await db_update.close();
    var list2 = list.length;
    return list2 ;


  }
  Future<double> percent(file) async {

    var nv = await get_nv(file);
    if (nv == 0) {
      var pr = await data_tout();
      var point = await pr.get_point(file);
      var max_qst = await pr.max_qastion_(file);
      var prst = (point / max_qst);

      return prst;
    }else {
      return 1 ;

    }
  }
}