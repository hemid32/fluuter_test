import 'dart:async';
import 'dart:io';
import 'package:collection/collection.dart';
import 'package:path/path.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';


class ponits  {
  //final ponist = null ;
  get_point() async {
    var dbDir = await getDatabasesPath();
    var dbPath = join(dbDir, "models/info.db");

// Delete any existing database:
    await deleteDatabase(dbPath);

// Create the writable database file from the bundled demo database file:
    ByteData data = await rootBundle.load("issues/models/info.db");
    List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    await File(dbPath).writeAsBytes(bytes);
    var db = await openDatabase(dbPath);
    List<Map> list = await db.rawQuery('SELECT  ponits  FROM point');
    int t = list[0]['ponits'] ;

    return t;

  }

}