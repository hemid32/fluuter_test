import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'hemidi.dart';
import 'model/Dog.dart';
import 'part2_nombrs.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'home_page.dart';
import 'dart:convert' ;

class nombrs extends StatelessWidget {
  var data  ;
  var info ;
  var title ;
  var info2 ;
  var info3 ;
  var file ;
  var url ;
  //Map info1 ;
  nombrs(this.file,this.data){
    data = this.data ;
    info = this.data[0];
    info2 = this.data[1] ;
    info3 = this.data[2] ;
    //print(this.data.toString());
    //print(info3);
    //print(this.data);
    url = this.data[3]; // url = [[pinfo2.jpg , ginfo2.jpg] ,[pinfo3.jpg , ginfo3.jpg] ]
    //print(url);
    //info2 = this.info[1];
    //info = json.decode(this.info[0]);
    //info1 = json.decode(info);
    //title = info['title'];
    file = this.file;
    //print(info) ;
  }

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
        appBar: AppBar(

            title: Text('تعلم الرياضيات', textDirection: TextDirection.rtl),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.home ),
                tooltip: 'home',
                onPressed: () async {
                  var a = await data_tout();
                  var info_tout = await a.data() ;
                  var parcent1 = await a.percent('info') ;
                  var parcent2 = await a.percent('info2') ;
                  var parcent3 = await a.percent('info3') ;
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => home_page(info_tout,parcent1,parcent2,parcent3)));
                  //Navigator.of(context).push(MaterialPageRoute(builder: (context) => home_page(0)));
                },
              )
            ]
        ) ,
        body: _mybody(context,info , info2 , info3 , file , url , data),
      ),
    );

  }
}
var h = 1 ;

Widget _mybody(context, info , info2 , info3 , file , url , data ){
  //print(info3);

  if(file == 'info' ){
    var title1 = info[0]['title'];
    var difinition_title =info[0]['def1'];
    var difinition_title2 = info[0]['def2'];
    var difinition1 = info[0]['deftp'];
    var difinition2 = info[0]['def2p'];
    var exemple = info[0]['exmpl'];
    var exempl_cont = info[0]['exmplp'];
    return ListView(
      children: <Widget>[

        Card(
            child : Container(

              padding: EdgeInsets.only(top: 5 , left: 5 , right: 5 , bottom: 5),

              margin:EdgeInsets.only(top: 10 , left: 5 , right: 5),
              child : Row(

                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: <Widget>[
                    //width: 500,

                    Icon(Icons.border_color),
                    Text(title1 , textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),),
                    //padding: EdgeInsets.only(left:50),


                    Icon(Icons.assignment , )
                  ]
              )  ,
            )
        ),
        Card(
            color: Colors.cyan,
            margin: EdgeInsets.only(top:10),
            child : Container(child : Text(difinition_title,style: TextStyle(fontWeight: FontWeight.bold) ),
              padding: EdgeInsets.only(left:300 , top: 5 , right: 5, bottom: 5),
            )
        ),
        Card(
            color: Colors.lightGreenAccent,
            margin: EdgeInsets.only(top:10 , left: 5 , right: 5 , bottom: 5),
            child : Container(child : Text(difinition1),
              margin: EdgeInsets.only(top: 5 , left: 5 , right: 5 , bottom: 5 , ) ,


            )
        ),
        Card(
            color: Colors.cyan,
            margin: EdgeInsets.only(top:10),
            child : Container(child : Text(difinition_title2,style: TextStyle(fontWeight: FontWeight.bold) ),
              padding: EdgeInsets.only(left:300 , top: 5 , right: 5, bottom: 5),
            )
        ),
        Card(
            color: Colors.lightGreenAccent,
            margin: EdgeInsets.only(top:10 , left: 5 , right: 5 , bottom: 5),
            child : Container(child : Text(difinition2),
              margin: EdgeInsets.only(top: 5 , left: 5 , right: 5 , bottom: 5 , ) ,


            )
        ),

        Card(
            color: Colors.orange,
            margin: EdgeInsets.only(top:10),
            child : Container(child : Text(exemple,style: TextStyle(fontWeight: FontWeight.bold) ),
              padding: EdgeInsets.only(left:300 , top: 5 , right: 5, bottom: 5),
            )
        ),

        Card(
            color: Colors.greenAccent,
            margin: EdgeInsets.only(top:10 , left: 5 , right: 5 , bottom: 5),
            child : Container(child : Text(exempl_cont , textDirection: TextDirection.rtl),
              margin: EdgeInsets.only(top: 5 , left: 5 , right: 5 , bottom: 5 , ) ,


            )
        ),
        /*
        Container(
            margin: EdgeInsets.only( top: 20 ),
            child : RaisedButton(
              padding: EdgeInsets.only(top: 10 , bottom: 10 ,right: 70 , left: 70),
              color: Colors.tealAccent,
              child: Text('متابغة'),
              onPressed: (){
                print('hemidi love');
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Part2(info2: info2,info3: info3,)));
              },
            ),
        ),*/
        Container(
          //width: MediaQuery.of(context).size.width*0.01,
          margin: EdgeInsets.only(top: 20 , bottom: 20),
          child : Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(30.0),
            color: Color(0xff01A0C7),
            child: MaterialButton(
              minWidth: MediaQuery.of(context).size.width*0.5,
              padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),


              onPressed: () async  {

                //print('hemidi love');
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Part2(file: file,info2: info2,info3: info3,data:data)));


              },
              child: Text("متابعة",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          ),
        )



      ],
    );
  } else if (file == 'info2'){
    //print(info3);
    var title1 = info2[0]['title'];
    var difinition_title =info2[0]['def1'];
    var difinition_title2 = info2[0]['def2'];
    var difinition1 = info2[0]['deftp'];
    var difinition2 = info2[0]['def2p'];
    var exemple = info2[0]['exmpl'];
    var exempl_cont = info2[0]['exmplp'];


    return ListView(

      children: <Widget>[

        Card(
            child : Container(

              padding: EdgeInsets.only(top: 5 , left: 5 , right: 5 , bottom: 5),

              margin:EdgeInsets.only(top: 10 , left: 5 , right: 5),
              child : Row(

                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: <Widget>[
                    //width: 500,

                    Icon(Icons.border_color),
                    Text(title1 , textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),),
                    //padding: EdgeInsets.only(left:50),


                    Icon(Icons.assignment , )
                  ]
              )  ,
            )
        ),
        Card(
            color: Colors.cyan,
            margin: EdgeInsets.only(top:10),
            child : Container(child : Text(difinition_title,style: TextStyle(fontWeight: FontWeight.bold) ),
              padding: EdgeInsets.only(left:300 , top: 5 , right: 5, bottom: 5),
            )
        ),
        Card(
            color: Colors.lightGreenAccent,
            margin: EdgeInsets.only(top:10 , left: 5 , right: 5 , bottom: 5),
            child : Container(child : Text(difinition1),
              margin: EdgeInsets.only(top: 5 , left: 5 , right: 5 , bottom: 5 , ) ,


            )
        ),
        Card(
            color: Colors.cyan,
            margin: EdgeInsets.only(top:10),
            child : Container(child : Text(difinition_title2,style: TextStyle(fontWeight: FontWeight.bold) ),
              padding: EdgeInsets.only(left:300 , top: 5 , right: 5, bottom: 5),
            )
        ),
        Card(
            color: Colors.lightGreenAccent,
            margin: EdgeInsets.only(top:10 , left: 5 , right: 5 , bottom: 5),
            child : Container(child : Image.network(url[0][0]),
              margin: EdgeInsets.only(top: 5 , left: 5 , right: 5 , bottom: 5 , ) ,


            )
        ),

        Card(
            color: Colors.orange,
            margin: EdgeInsets.only(top:10),
            child : Container(child : Text(exemple,style: TextStyle(fontWeight: FontWeight.bold) ),
              padding: EdgeInsets.only(left:300 , top: 5 , right: 5, bottom: 5),
            )
        ),

        Card(
            color: Colors.greenAccent,
            margin: EdgeInsets.only(top:10 , left: 5 , right: 5 , bottom: 5),
            child : Container(child : Text(exempl_cont),
              margin: EdgeInsets.only(top: 5 , left: 5 , right: 5 , bottom: 5 , ) ,


            )
        ),
        /*
        Container(
            margin: EdgeInsets.only( top: 20 ),
            child : RaisedButton(
              padding: EdgeInsets.only(top: 10 , bottom: 10 ,right: 70 , left: 70),
              color: Colors.tealAccent,
              child: Text('متابغة'),
              onPressed: (){
                print('hemidi love');
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Part2(info2: info2,info3: info3,)));
              },
            ),
        ),*/
        Container(
          //width: MediaQuery.of(context).size.width*0.01,
          margin: EdgeInsets.only(top: 20 , bottom: 20),
          child : Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(30.0),
            color: Color(0xff01A0C7),
            child: MaterialButton(
              minWidth: MediaQuery.of(context).size.width*0.5,
              padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),


              onPressed: () async  {

                //print('hemidi love');
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Part2(file: file,info2: info2,info3: info3,data:data)));


              },
              child: Text("متابعة",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          ),
        )



      ],
    );


  }else if (file == 'info3'){
    //print(info3);
    var title1 = info3[0]['title'];
    var difinition_title =info3[0]['def1'];
    var difinition_title2 = info3[0]['def2'];
    var difinition1 = info3[0]['deftp'];
    var difinition2 = info3[0]['def2p'];
    var exemple = info3[0]['exmpl'];
    var exempl_cont = info3[0]['exmplp'];


    return ListView(

      children: <Widget>[

        Card(
            child : Container(

              padding: EdgeInsets.only(top: 5 , left: 5 , right: 5 , bottom: 5),

              margin:EdgeInsets.only(top: 10 , left: 5 , right: 5),
              child : Row(

                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: <Widget>[
                    //width: 500,

                    Icon(Icons.border_color),
                    Text(title1 , textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),),
                    //padding: EdgeInsets.only(left:50),


                    Icon(Icons.assignment , )
                  ]
              )  ,
            )
        ),
        Card(
            color: Colors.cyan,
            margin: EdgeInsets.only(top:10),
            child : Container(child : Text(difinition_title,style: TextStyle(fontWeight: FontWeight.bold) ),
              padding: EdgeInsets.only(left:300 , top: 5 , right: 5, bottom: 5),
            )
        ),
        Card(
            color: Colors.lightGreenAccent,
            margin: EdgeInsets.only(top:10 , left: 5 , right: 5 , bottom: 5),
            child : Container(child : Text(difinition1),
              margin: EdgeInsets.only(top: 5 , left: 5 , right: 5 , bottom: 5 , ) ,


            )
        ),
        Card(
            color: Colors.cyan,
            margin: EdgeInsets.only(top:10),
            child : Container(child : Text(difinition_title2,style: TextStyle(fontWeight: FontWeight.bold) ),
              padding: EdgeInsets.only(left:300 , top: 5 , right: 5, bottom: 5),
            )
        ),
        Card(
            color: Colors.lightGreenAccent,
            margin: EdgeInsets.only(top:10 , left: 5 , right: 5 , bottom: 5),
            child : Container(child : Image.network(url[1][0]),
              margin: EdgeInsets.only(top: 5 , left: 5 , right: 5 , bottom: 5 , ) ,


            )
        ),

        Card(
            color: Colors.orange,
            margin: EdgeInsets.only(top:10),
            child : Container(child : Text(exemple,style: TextStyle(fontWeight: FontWeight.bold) ),
              padding: EdgeInsets.only(left:300 , top: 5 , right: 5, bottom: 5),
            )
        ),

        Card(
            color: Colors.greenAccent,
            margin: EdgeInsets.only(top:10 , left: 5 , right: 5 , bottom: 5),
            child : Container(child : Text(exempl_cont),
              margin: EdgeInsets.only(top: 5 , left: 5 , right: 5 , bottom: 5 , ) ,


            )
        ),
        /*
        Container(
            margin: EdgeInsets.only( top: 20 ),
            child : RaisedButton(
              padding: EdgeInsets.only(top: 10 , bottom: 10 ,right: 70 , left: 70),
              color: Colors.tealAccent,
              child: Text('متابغة'),
              onPressed: (){
                print('hemidi love');
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Part2(info2: info2,info3: info3,)));
              },
            ),
        ),*/
        Container(
          //width: MediaQuery.of(context).size.width*0.01,
          margin: EdgeInsets.only(top: 20 , bottom: 20),
          child : Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(30.0),
            color: Color(0xff01A0C7),
            child: MaterialButton(
              minWidth: MediaQuery.of(context).size.width*0.5,
              padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),


              onPressed: () async  {

                //print('hemidi love');
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Part2(file: file,info2: info2,info3: info3,data:data)));


              },
              child: Text("متابعة",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          ),
        )



      ],
    );


  }
  //return

}

