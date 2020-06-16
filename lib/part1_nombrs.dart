import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_tex/flutter_tex.dart';
import 'hemidi.dart';
import 'model/Dog.dart';
import 'part2_nombrs.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
//import 'package:firebase_admob/firebase_admob.dart';
import 'package:admob_flutter/admob_flutter.dart';

import 'home_page.dart';
import 'dart:convert' ;

import 'loading.dart';

class nombrs extends StatefulWidget {
  var data  ;
  var info ;
  var info2 ;
  var info3 ;
  var file ;
  var url ;
  var img_typ  ;
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
    //print(url[1][0]);
    if(url[1][0] == 'issues/images/prv.png'){
      //print('hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh');
      img_typ = false;
    }else{img_typ = true ; }

    //print(url);
    //info2 = this.info[1];
    //info = json.decode(this.info[0]);
    //info1 = json.decode(info);
    //title = info['title'];
    file = this.file;
    //print(info) ;
  }

  @override
  _nombrsState createState() => _nombrsState();
}

class _nombrsState extends State<nombrs> {







  var title;

  bool lod = false;


  // ads
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();
  AdmobBannerSize bannerSize;
  AdmobInterstitial interstitialAd;
  AdmobReward rewardAd;
  final adse = ads();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Admob.initialize(adse.idapp());
    interstitialAd = AdmobInterstitial(
      adUnitId: adse.idInterstitial_Video(),
      listener: (AdmobAdEvent event, Map<String, dynamic> args) {
        if (event == AdmobAdEvent.closed) interstitialAd.load();
        print('load ads intirersrsr');
      },

    );
    interstitialAd.load();


  }

  @override
  void dispose() {
    interstitialAd.dispose();
    //rewardAd.dispose();
    super.dispose();
  }




  @override
  Widget build(BuildContext context) {
    //final ProgressDialog pr = ProgressDialog(context);


    return lod ? loading() : MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale("ar", "AE"), // OR Locale('ar', 'AE') OR Other RTL locales
      ],
      home: Scaffold(
        appBar: AppBar(

            title: Text('معارف', textDirection: TextDirection.rtl),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.home),
                tooltip: 'home',
                onPressed: () async {
                  setState(() {
                    lod = true;
                  });
                  var a = await data_tout();
                  var info_tout = await a.data();
                  var parcent1 = await a.percent('info');
                  var parcent2 = await a.percent('info2');
                  var parcent3 = await a.percent('info3');
                  //Navigator.of(context).pop();
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          home_page(info_tout, parcent1, parcent2, parcent3)));

                  setState(() {
                    lod = false;
                  });
                  //Navigator.of(context).push(MaterialPageRoute(builder: (context) => home_page(0)));
                  /*
                  setState(() {
                    lod = true ;
                  });
                  await Navigator.of(context).pop();
                  setState(() {
                    lod = false ;
                  });

                   */

                },
              )
            ]
        ),
        body: _mybody(
            context,
            widget.info,
            widget.info2,
            widget.info3,
            widget.file,
            widget.url,
            widget.data,
            widget.img_typ),
      ),
    );
  }

  var h = 1;

  Widget _mybody(context, info, info2, info3, file, url, data, img_typ) {
    //print(info3);

    if (file == 'info') {
      var title1 = data[4][0]+'-'+' '+info[0]['title'];
      var difinition_title = info[0]['def1'];
      var difinition_title2 = info[0]['def2'];
      var difinition1 = info[0]['deftp'];
      var difinition2 = info[0]['def2p'];
      var exemple = info[0]['exmpl'];
      var exempl_cont = info[0]['exmplp'];
      return ListView(
        children: <Widget>[

          Card(
              child: Container(
                decoration: BoxDecoration(
                  //color: Colors.lightBlueAccent,
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

                padding: EdgeInsets.only(top: 5, left: 5, right: 5, bottom: 5),

                margin: EdgeInsets.only(top: 10, left: 5, right: 5),
                child: Row(

                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: <Widget>[
                      //width: 500,

                      Icon(Icons.border_color),
                      Text(title1, textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),),
                      //padding: EdgeInsets.only(left:50),


                      Icon(Icons.assignment,)
                    ]
                ),
              )
          ),
          Card(
              color: Colors.lime[200],
              margin: EdgeInsets.only(top: 10),
              child: Container(child: Text(difinition_title,
                  style: TextStyle(fontWeight: FontWeight.bold)),
                padding: EdgeInsets.only(
                    left: 300, top: 5, right: 5, bottom: 5),
              )
          ),
          Card(
              //color: Colors.orange[200],
              margin: EdgeInsets.only(top: 10, left: 5, right: 5, bottom: 5),
              child: Container(child: datas1('info', 1) ,

              /* Text(
                difinition1, style: TextStyle(fontWeight: FontWeight.bold),),
                margin: EdgeInsets.only(top: 5, left: 5, right: 5, bottom: 5,),*/


              )
          ),
          // ads banner



          AdmobBanner(
            adUnitId: adse.idbanner(),
            adSize: AdmobBannerSize.FULL_BANNER,

          ),




          Card(
              color: Colors.lime[200],
              margin: EdgeInsets.only(top: 10),
              child: Container(child: Text(difinition_title2,
                  style: TextStyle(fontWeight: FontWeight.bold)),
                //padding: EdgeInsets.only(left:300 , top: 5 , right: 5, bottom: 5),
              )
          ),
          Card(
              //color: Colors.orange[200],
              margin: EdgeInsets.only(top: 10, left: 5, right: 5, bottom: 5),
              child: Container(child: datas1('info', 2) ,

                /*Text(
                difinition2, style: TextStyle(fontWeight: FontWeight.bold),),
                margin: EdgeInsets.only(top: 5, left: 5, right: 5, bottom: 5,), */


              )
          ),



          Card(
              color: Colors.lime[200],
              margin: EdgeInsets.only(top: 10),
              child: Container(child: Text(
                  exemple, style: TextStyle(fontWeight: FontWeight.bold)),
                padding: EdgeInsets.only(
                    left: 300, top: 5, right: 5, bottom: 5),
              )
          ),

          Card(
              //color: Colors.orange[200],
              margin: EdgeInsets.only(top: 10, left: 5, right: 5, bottom: 5),
              child: Container(child: datas1('info', 3) ,

              /* Text(
                exempl_cont, textDirection: TextDirection.rtl,
                style: TextStyle(fontWeight: FontWeight.bold),),
                margin: EdgeInsets.only(top: 5, left: 5, right: 5, bottom: 5,),

               */


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
            margin: EdgeInsets.only(top: 20, bottom: 20),
            child: Material(
              elevation: 5.0,
              borderRadius: BorderRadius.circular(30.0),
              color: Color(0xff01A0C7),
              child: MaterialButton(
                minWidth: MediaQuery
                    .of(context)
                    .size
                    .width * 0.5,
                padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),


                onPressed: () async {
                  //print('hemidi love');
                  //ads
                  var a = await data_tout();
                  var point = await a.get_point(file);
                  //var max_point = await a.max_qastion_(file);
                  if(point % 3 == 0 ){
                    interstitialAd.show() ;
                  }


                  //fine ads



                  await Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          Part2(file: file,
                              info2: info2,
                              info3: info3,
                              data: data)));
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
    } else if (file == 'info2') {
      //print(info3);
      var title1 = data[4][1]+'-'+' '+info2[0]['title'];
      var difinition_title = info2[0]['def1'];
      var difinition_title2 = info2[0]['def2'];
      var difinition1 = info2[0]['deftp'];
      var difinition2 = info2[0]['def2p'];
      var exemple = info2[0]['exmpl'];
      var exempl_cont = info2[0]['exmplp'];


      return ListView(

        children: <Widget>[
          Card(
              child: Container(
                decoration: BoxDecoration(
                  //color: Colors.lightBlueAccent,
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

                padding: EdgeInsets.only(top: 5, left: 5, right: 5, bottom: 5),

                margin: EdgeInsets.only(top: 10, left: 5, right: 5),
                child: Row(

                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: <Widget>[
                      //width: 500,

                      Icon(Icons.border_color),
                      Text(title1, textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),),
                      //padding: EdgeInsets.only(left:50),


                      Icon(Icons.assignment,)
                    ]
                ),
              )
          ),



          Card(
              color: Colors.lime[200],
              margin: EdgeInsets.only(top: 10),
              child: Container(child: Text(difinition_title,
                  style: TextStyle(fontWeight: FontWeight.bold)),
                padding: EdgeInsets.only(
                    left: 300, top: 5, right: 5, bottom: 5),
              )
          ),
          Card(
              color: Colors.orange[200],
              margin: EdgeInsets.only(top: 10, left: 5, right: 5, bottom: 5),
              child: Container(child: datas1('info2', 1) ,
              /* Text(
                difinition1, style: TextStyle(fontWeight: FontWeight.bold),),
                margin: EdgeInsets.only(top: 5, left: 5, right: 5, bottom: 5,),

               */


              )
          ),


          AdmobBanner(
            adUnitId: adse.idbanner(),
            adSize: AdmobBannerSize.FULL_BANNER,

          ),
          Card(
              color: Colors.lime[200],
              margin: EdgeInsets.only(top: 10),
              child: Container(child: Text(difinition_title2,
                  style: TextStyle(fontWeight: FontWeight.bold)),
                //padding: EdgeInsets.only(left:300 , top: 5 , right: 5, bottom: 5),
              )
          ),

          Card(

              color: Colors.white30,
              margin: EdgeInsets.only(top: 10, left: 5, right: 5, bottom: 5),

              child: Container(

                child: img_typ ? Image.network(url[0][0]) : Center(


                    child: Container(

                      padding: EdgeInsets.only(top: 50, bottom: 50),
                      child: SpinKitRing(
                        color: Colors.blue,
                        size: 50.0,

                      ),
                    )

                ),
                margin: EdgeInsets.only(top: 5, left: 5, right: 5, bottom: 5,),


              )

          ),

          Card(
              color: Colors.lime[200],
              margin: EdgeInsets.only(top: 10),
              child: Container(child: datas1('info2', 3) ,
              /*Text(
                  exemple, style: TextStyle(fontWeight: FontWeight.bold)),
                padding: EdgeInsets.only(
                    left: 300, top: 5, right: 5, bottom: 5),

               */

              )
          ),

          Card(
              color: Colors.orange[200],
              margin: EdgeInsets.only(top: 10, left: 5, right: 5, bottom: 5),
              child: Container(child: Text(
                exempl_cont, style: TextStyle(fontWeight: FontWeight.bold),),
                margin: EdgeInsets.only(top: 5, left: 5, right: 5, bottom: 5,),


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
            margin: EdgeInsets.only(top: 20, bottom: 20),
            child: Material(
              elevation: 5.0,
              borderRadius: BorderRadius.circular(30.0),
              color: Color(0xff01A0C7),
              child: MaterialButton(
                minWidth: MediaQuery
                    .of(context)
                    .size
                    .width * 0.5,
                padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),


                onPressed: () async {
                  //ads
                  //ads
                  var a = await data_tout();
                  var point = await a.get_point(file);
                  //var max_point = await a.max_qastion_(file);
                  if(point % 3 == 0 ){
                    interstitialAd.show() ;
                  }


                  //fine ads
                  //ads fine

                  await Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          Part2(file: file,
                              info2: info2,
                              info3: info3,
                              data: data)));
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
    } else if (file == 'info3') {
      //print(info3);
      var title1 = data[4][2]+'-'+' '+info3[0]['title'];
      var difinition_title = info3[0]['def1'];
      var difinition_title2 = info3[0]['def2'];
      var difinition1 = info3[0]['deftp'];
      var difinition2 = info3[0]['def2p'];
      var exemple = info3[0]['exmpl'];
      var exempl_cont = info3[0]['exmplp'];


      return ListView(

        children: <Widget>[

          Card(
              child: Container(
                decoration: BoxDecoration(
                  //color: Colors.lightBlueAccent,
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

                padding: EdgeInsets.only(top: 5, left: 5, right: 5, bottom: 5),

                margin: EdgeInsets.only(top: 10, left: 5, right: 5),
                child: Row(

                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: <Widget>[
                      //width: 500,

                      Icon(Icons.border_color),
                      Text(title1, textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),),
                      //padding: EdgeInsets.only(left:50),


                      Icon(Icons.assignment,)
                    ]
                ),
              )
          ),
          Card(
              color: Colors.lime[200],
              margin: EdgeInsets.only(top: 10),
              child: Container(child: Text(difinition_title,
                  style: TextStyle(fontWeight: FontWeight.bold)),
                padding: EdgeInsets.only(
                    left: 300, top: 5, right: 5, bottom: 5),
              )
          ),
          Card(
              color: Colors.orange[200],
              margin: EdgeInsets.only(top: 10, left: 5, right: 5, bottom: 5),
              child: Container(child: datas1('info3', 1) ,
              /* Text(
                difinition1, style: TextStyle(fontWeight: FontWeight.bold),),
                margin: EdgeInsets.only(top: 5, left: 5, right: 5, bottom: 5,),

               */


              )
          ),

          AdmobBanner(
            adUnitId: adse.idbanner(),
            adSize: AdmobBannerSize.FULL_BANNER,

          ),

          Card(
              color: Colors.lime[200],
              margin: EdgeInsets.only(top: 10),
              child: Container(child: Text(difinition_title2,
                  style: TextStyle(fontWeight: FontWeight.bold)),
                //padding: EdgeInsets.only(left:300 , top: 5 , right: 5, bottom: 5),
              )
          ),
          Card(
              color: Colors.white30,
              margin: EdgeInsets.only(top: 10, left: 5, right: 5, bottom: 5),
              child: Container(
                child: img_typ ? Image.network(url[1][0]) : Center(


                    child: Container(

                      padding: EdgeInsets.only(top: 50, bottom: 50),
                      child: SpinKitRing(
                        color: Colors.blue,
                        size: 50.0,

                      ),
                    )

                ),
                margin: EdgeInsets.only(top: 5, left: 5, right: 5, bottom: 5,),


              )
          ),


          Card(
              color: Colors.lime[200],
              margin: EdgeInsets.only(top: 10),
              child: Container(child: datas1('info3', 3) ,
              /* Text(
                  exemple, style: TextStyle(fontWeight: FontWeight.bold)),
                padding: EdgeInsets.only(
                    left: 300, top: 5, right: 5, bottom: 5),

               */
              )
          ),

          Card(
              color: Colors.orange[200],
              margin: EdgeInsets.only(top: 10, left: 5, right: 5, bottom: 5),
              child: Container(child: Text(
                exempl_cont, style: TextStyle(fontWeight: FontWeight.bold),),
                margin: EdgeInsets.only(top: 5, left: 5, right: 5, bottom: 5,),


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
            margin: EdgeInsets.only(top: 20, bottom: 20),
            child: Material(
              elevation: 5.0,
              borderRadius: BorderRadius.circular(30.0),
              color: Color(0xff01A0C7),
              child: MaterialButton(
                minWidth: MediaQuery
                    .of(context)
                    .size
                    .width * 0.5,
                padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),


                onPressed: () async {
                  //ads
                  //ads
                  var a = await data_tout();
                  var point = await a.get_point(file);
                  //var max_point = await a.max_qastion_(file);
                  if(point % 3 == 0 ){
                    interstitialAd.show() ;
                  }


                  //fine ads
                  //fin ads



                  await Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          Part2(file: file,
                              info2: info2,
                              info3: info3,
                              data: data)));
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
  Container datas1(fl , nombre_definition){
    var target_st = nombre_definition ;

    var k ;
    if(fl == 'info'){k=0;}else if(fl == 'info2'){k = 1;}else if(fl == 'info3'){k=2;}


    var def ;
    if(target_st == 1){
      def = '1';
    }else if(target_st == 2){
      def = '2' ;
    }else if(target_st == 3){
      def = 'ex';
    }


    //var target = widget.data[k][0][target_st];
    return Container(
      child: Column(
        children: <Widget>[
          Text(
              widget.data[k][0]['def'+ def +'1'], style: TextStyle(fontWeight: FontWeight.bold)),
          TeXView(

              child: TeXViewColumn(children: [

                TeXViewDocument(widget.data[k][0]['eq' + def +  '1'],
                )
              ])),
          Text(
              widget.data[k][0]['def' + def +  '2'], style: TextStyle(fontWeight: FontWeight.bold)),
          TeXView(

              child: TeXViewColumn(children: [

                TeXViewDocument(widget.data[k][0]['eq'+ def + '2'],
                )
              ])),
          Text(
              widget.data[k][0]['def'+ def + '3'], style: TextStyle(fontWeight: FontWeight.bold)),
          TeXView(

              child: TeXViewColumn(children: [

                TeXViewDocument(widget.data[k][0]['eq'+ def + '3'],
                )
              ])),
          Text(
              widget.data[k][0]['def'+ def + '4'], style: TextStyle(fontWeight: FontWeight.bold)),
          TeXView(

              child: TeXViewColumn(children: [

                TeXViewDocument(widget.data[k][0]['eq'+ def + '4'],
                )
              ])),
          Text(
              widget.data[k][0]['def'+ def + '5'], style: TextStyle(fontWeight: FontWeight.bold)),
          TeXView(

              child: TeXViewColumn(children: [

                TeXViewDocument(widget.data[k][0]['eq'+ def + '5'],
                )
              ])),

        ],



      ),




    );




  }


}