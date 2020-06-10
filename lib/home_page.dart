import 'dart:io';

//import 'package:firebase_image/firebase_image.dart';
//import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp2/loading.dart';
import 'package:flutterapp2/model/Dog.dart';
import 'package:flutterapp2/pgcd.dart';
import 'eq1.dart';
import 'eqt2.dart';
import 'part1_nombrs.dart';
import 'hemidi.dart';
import 'package:path/path.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:collection/collection.dart';
import 'package:sqflite/sqflite.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'abot.dart';

class home_page extends StatefulWidget {
  List<List> data ;
  //final ponits =  ;
  var info  ;
  var info2 ;
  var info3 ;
  var percent ;
  var percent2 ;
  var percent3 ;
  //var url ;


  home_page(this.data , this.percent , this.percent2 , this.percent3){
    data = this.data ;
    info = data[0];
    info2 = data[1];
    info3 = data[2];
    //url = data[3];
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
  bool lod = false  ;
  //final ref = FirebaseAuth.;


  @override


  Widget build(BuildContext context) {

    return lod ? loading() :  Scaffold(

      appBar: AppBar(
        title: Text('الصفحة الرئيسية' ,textAlign: TextAlign.center,),
          actions: <Widget>[
            /*
            FloatingActionButton(
              onPressed: ()=> exit(0),
              tooltip: 'Close app',
              backgroundColor: Colors.deepOrange[300],
              child: new Icon(Icons.exit_to_app , size:30,),
            ),*/
      IconButton(
      icon: const Icon(Icons.exit_to_app),
        tooltip: 'خروج',
        onPressed: () {
          exit(0);
        },)


          ]
    ),
      body: Container(

        child : ListView(
        children: <Widget>[

          Card(


              child : Container(
                  decoration: BoxDecoration(
                    color: Colors.lightBlueAccent,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),

                  //decoration: BoxDecoration( color: Colors.lightBlue,  ),
                  margin: EdgeInsets.only(top: 10),
                  padding: EdgeInsets.only(bottom: 10 , top: 10 , right: 5 , left: 5, ),
                  width: 500,
                  child : Container(
               //EdgeInsets.only(),

                    child : Text('الرياضيات للسنة الرابعة متوسط',textAlign:TextAlign.center ,style: TextStyle(
                      fontSize: 20,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 1
                        ..color = Colors.black,
                    ),
                    )

                  )
              )
          )
          ,
          Card(
              margin: EdgeInsets.only(top: 10, left: 5, right: 5,),
              child : Container(

                  child : Stack(children: [ ListTile(
                    title: Text('انشطة عددية ', textDirection: TextDirection.rtl,style: TextStyle(fontWeight: FontWeight.bold),),
                    leading: Icon(Icons.iso , size: 50,color: Colors.lightBlueAccent,),
                    onTap: () async {
                      setState(() {
                        lod = true ;
                      });
                      await Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => nombrs('info',widget.data)));
                      setState(() {
                        lod = false ;
                      });
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
                        center: Text(((widget.percent )*100).toStringAsFixed(0)+'%',style: TextStyle(fontWeight: FontWeight.bold),),))]))
          ),
          Card(
              margin: EdgeInsets.only(top: 10, left: 5, right: 5,),
              child : Container(

                  child : Stack(children: [ ListTile(
                    title: Text('الدوال و تنظيم المعطيات' , textDirection: TextDirection.rtl,style: TextStyle(fontWeight: FontWeight.bold),),
                    leading: Icon(Icons.blur_off , size: 50,color : Colors.lightBlueAccent,),
                    onTap: () async {
                      setState(() {
                        lod = true ;
                      });
                      await Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => nombrs('info2',widget.data)));
                      setState(() {
                        lod = false ;
                      });
                      },
                  ),Container(
                      margin: EdgeInsets.only(right: MediaQuery.of(context).size.width*0.80),
                      child : CircularPercentIndicator(

                        radius: 60.0,
                        lineWidth: 8.0,
                        percent: widget.percent2,
                        progressColor: color(widget.percent2),
                        //header: new Text("نسبة التقدم"),
                        center: Text(((widget.percent2 )*100).toStringAsFixed(0)+'%',style: TextStyle(fontWeight: FontWeight.bold),),))]))
          ),
          Card(
              margin: EdgeInsets.only(top: 10, left: 5, right: 5,),
              child : Container(

              child : Stack(children: [ ListTile(
            title: Text('انشطة هندسية' , textDirection: TextDirection.rtl,style: TextStyle(fontWeight: FontWeight.bold),),
            leading: Icon(Icons.signal_cellular_null , size: 50,color : Colors.lightBlueAccent,),

            onTap: (){
              setState(() {
                lod = true ;
              });

              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => nombrs('info3',widget.data),),);

              setState(() {
                lod = false ;
              });
              },
          ),Container(
                margin: EdgeInsets.only(right: MediaQuery.of(context).size.width*0.80),
                child : CircularPercentIndicator(

                  radius: 60.0,
                  lineWidth: 8.0,
                  percent: widget.percent3,
                  //progressColor: color(widget.percent3),
                  progressColor: color(widget.percent3),
                //header: new Text("نسبة التقدم"),
                center: Text(((widget.percent3 )*100).toStringAsFixed(0)+'%',style: TextStyle(fontWeight: FontWeight.bold),),))]))
          ),
          Card(
              margin: EdgeInsets.only(top: 10, left: 5, right: 5,),
              child : Container(

                  child : Stack(children: [

                    ListTile(
                    title: Text('حساب PGCD' , textDirection: TextDirection.rtl,style: TextStyle(fontWeight: FontWeight.bold),),

                      leading: Icon(Icons.add_to_photos , size: 50,color: Colors.lightBlueAccent,),
                      onTap: ()  {
                      //Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => abot())); //nombrs('info3',widget.data),),);
                      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => Pgcd(a:5 , b: 2))); //nombrs('info3',widget.data),),);
                      },
                  ),
                  ]))
          ),

         /* Container(
            
            //child ://Image.network(widget.url[0]),
          ),*/
          Card(
              margin: EdgeInsets.only(top: 10, left: 5, right: 5,),
              child : Container(

                  child : Stack(children: [

                    ListTile(
                      title: Text('حل معادلة من الدرجة 1' , textDirection: TextDirection.rtl,style: TextStyle(fontWeight: FontWeight.bold),),

                      leading: Icon(Icons.filter_1 , size: 50,color: Colors.lightBlueAccent,),
                      onTap: ()  {
                        //Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => abot())); //nombrs('info3',widget.data),),);
                        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => eq1())); //nombrs('info3',widget.data),),);
                      },
                    ),
                  ]))
          ),
          Card(
              margin: EdgeInsets.only(top: 10, left: 5, right: 5,),
              child : Container(

                  child : Stack(children: [

                    ListTile(
                      title: Text('حل معادلة من الدرجة 2' , textDirection: TextDirection.rtl,style: TextStyle(fontWeight: FontWeight.bold),),

                      leading: Icon(Icons.filter_2 , size: 50,color: Colors.lightBlueAccent,),
                      onTap: ()  {
                        //Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => abot())); //nombrs('info3',widget.data),),);
                        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => eqt2())); //nombrs('info3',widget.data),),);
                      },
                    ),
                  ]))
          ),

          Card(
              margin: EdgeInsets.only(top: 10, left: 5, right: 5,),
              child : Container(

                  child : Stack(children: [

                    ListTile(
                      title: Text('حول التطبيق' , textDirection: TextDirection.rtl,style: TextStyle(fontWeight: FontWeight.bold),),

                      leading: Icon(Icons.info_outline , size: 50,color: Colors.lightBlueAccent,),
                      onTap: ()  {
                        //Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => abot())); //nombrs('info3',widget.data),),);
                        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => abot())); //nombrs('info3',widget.data),),);
                      },
                    ),
                  ]))
          ),
          
          
          Container (
        margin: EdgeInsets.only(top: 30, left: 5, right: 5,),

          child :  CircularPercentIndicator(

            radius: 100.0,
    lineWidth: 10.0,
    percent:  (widget.percent + widget.percent3 + widget.percent2)/3,//percent_1(),
            progressColor: color((widget.percent + widget.percent3 + widget.percent2)/3),
    header: new Text("نسبة تقدمك في جميع الدروس",style: TextStyle(fontWeight: FontWeight.bold),),
    center: new Text((((widget.percent + widget.percent3 + widget.percent2)/3)*100).toStringAsFixed(0)+'%',style: TextStyle(fontWeight: FontWeight.bold),),))

        ],

      ),
      )
    );
  }
    Color color(n){
    //print('presentega $n');
      if(n<=0.3){return Colors.red ; }else if(n<0.5){return Colors.orange ; }else if(n>=0.5){return Colors.green;}
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



