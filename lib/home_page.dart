import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp2/model/Dog.dart';
import 'part1_nombrs.dart';
import 'hemidi.dart';
import 'package:path/path.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:collection/collection.dart';
import 'package:sqflite/sqflite.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:percent_indicator/percent_indicator.dart';


class home_page extends StatefulWidget {
  List<List> data ;
  //final ponits =  ;
  var info  ;
  var info2 ;
  var info3 ;
  var percent ;
  var percent2 ;
  var percent3 ;


  home_page(this.data , this.percent , this.percent2 , this.percent3){
    data = this.data ;
    info = data[0];
    info2 = data[1];
    info3 = data[2];
    percent = this.percent ;
    //print('perecnt home : $percent');
    percent2 = this.percent2 ;
    percent3 = this.percent3 ;
    //percent3 = this.percent[2] ;
    //print(ponits);

  }


  @override
  _home_pageState createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {


  @override


  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(

        title: Text(' تعلم الرياضيات' , textDirection: TextDirection.rtl),
          actions: <Widget>[
            IconButton(
            icon: const Icon(Icons.home ),
            tooltip: 'home',
            onPressed: () async {
              //var a = await data_tout();
              //var info_tout = await a.data() ;
              //Navigator.of(context).push(MaterialPageRoute(builder: (context) => home_page(info_tout)));
            },
            )
          ]
    ),
      body: Container(

        child : Column(
        children: <Widget>[

          Card(


              child : Container(
                  decoration: BoxDecoration( color: Colors.lightBlueAccent, border: Border.all(color: Theme.of(context).accentColor,) ),
                  margin: EdgeInsets.only(top: 10),
                  padding: EdgeInsets.only(bottom: 10 , top: 10 , right: 5 , left: 5, ),
                  width: 500,
                  child : Container(
               //EdgeInsets.only(),

                    child : Text('الرياضيات للسنة الرابعة متوسط',textAlign:TextAlign.center ,),

                  )
              )
          )
          ,
          Card(
              margin: EdgeInsets.only(top: 10, left: 5, right: 5,),
              child : Container(

                  child : Stack(children: [ ListTile(
                    title: Text('انشطة عددية ', textDirection: TextDirection.rtl),
                    leading: Icon(Icons.iso , size: 50,color: Colors.lightBlueAccent,),
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => nombrs('info',widget.data)));
                      //print(info);
                    },
                  ),Container(
                      margin: EdgeInsets.only(right: MediaQuery.of(context).size.width*0.80),
                      child : CircularPercentIndicator(

                        radius: 60.0,
                        lineWidth: 8.0,
                        percent: widget.percent,
                        progressColor: color(widget.percent),
                        //header: new Text("نسبة التقدم"),
                        center: new Icon(
                          Icons.person_pin,
                          size: 30.0,
                          color: Colors.lightBlue,
                        ),))]))
          ),
          Card(
              margin: EdgeInsets.only(top: 10, left: 5, right: 5,),
              child : Container(

                  child : Stack(children: [ ListTile(
                    title: Text('الدوال و تنظيم المعطيات' , textDirection: TextDirection.rtl),
                    leading: Icon(Icons.blur_off , size: 50,color : Colors.lightBlueAccent,),
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => nombrs('info2',widget.data)));
                    },
                  ),Container(
                      margin: EdgeInsets.only(right: MediaQuery.of(context).size.width*0.80),
                      child : CircularPercentIndicator(

                        radius: 60.0,
                        lineWidth: 8.0,
                        percent: widget.percent2,
                        progressColor: color(widget.percent2),
                        //header: new Text("نسبة التقدم"),
                        center: new Icon(
                          Icons.person_pin,
                          size: 30.0,
                          color: Colors.lightBlue ,
                        ),))]))
          ),
          Card(
              margin: EdgeInsets.only(top: 10, left: 5, right: 5,),
              child : Container(

              child : Stack(children: [ ListTile(
            title: Text('انشطة هندسية' , textDirection: TextDirection.rtl),
            leading: Icon(Icons.signal_cellular_null , size: 50,color : Colors.lightBlueAccent,),
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => nombrs('info3',widget.data),),);
            },
          ),Container(
                margin: EdgeInsets.only(right: MediaQuery.of(context).size.width*0.80),
                child : CircularPercentIndicator(

                radius: 60.0,
                lineWidth: 8.0,
                percent: widget.percent3,
                  progressColor: color(widget.percent3),
                //header: new Text("نسبة التقدم"),
                center: new Icon(
                  Icons.person_pin,
                  size: 30.0,
                  color: Colors.lightBlue,
                ),))]))
          ),
          Card(
              margin: EdgeInsets.only(top: 10, left: 5, right: 5,),
              child : Container(

                  child : Stack(children: [ ListTile(
                    title: Text('حول التطبيق' , textDirection: TextDirection.rtl,textAlign: TextAlign.center,),
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => nombrs('info3',widget.data),),);
                    },
                  ),]))
          ),

    Container (
        margin: EdgeInsets.only(top: 30, left: 5, right: 5,),

          child :  CircularPercentIndicator(

            radius: 100.0,
    lineWidth: 10.0,
    percent:  (widget.percent + widget.percent3 + widget.percent2)/3,//percent_1(),
            progressColor: color((widget.percent + widget.percent3 + widget.percent2)/3),
    header: new Text("نسبة تقدمك في جميع الدروس"),
    center: new Icon(
    Icons.person_pin,
    size: 50.0,
    color: Colors.lightBlue ,
    ),))

        ],

      ),
      )
    );
  }
    Color color(n){
      if(n<0.3){return Colors.red ; }else if(n<0.5){return Colors.deepOrange ; }else if(n>0.5){return Colors.green;}
   }
  double percent_2(){
    return 1 ;
  }
  double percent_3(){
    return 1 ;
  }
}


Future<int>  get_point() async {
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
  return  t;

}