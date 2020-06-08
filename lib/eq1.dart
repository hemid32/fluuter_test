import 'dart:io';
import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'dart:convert';

import 'model/Dog.dart';

/*
void main() {
  var pgcde = pgcd(9 , 7) ;
  print('pgcd(24,20)=$pgcde') ;
  //print(pp('ndbkdbv'));
}

 */

class eq1 extends StatefulWidget {

  @override
  _PgcdState1 createState() => _PgcdState1();
}

class _PgcdState1 extends State<eq1> {
  final a = TextEditingController();
  final b = TextEditingController();
  String rslt = '....';

  String at = 'a';
  String bt = 'b';
  String method = 'الطريقة';
  List <String> mdt = [];

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
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    a.dispose();
    b.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('ar', 'AE'), // OR Locale('ar', 'AE') OR Other RTL locales
      ],


      home: Scaffold(

        appBar: AppBar(

            title: Text('حل معادلة من الدرجة 1'),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.home),
                tooltip: 'home',
                onPressed: () async {
                  Navigator.pop(context);
                },
              )
            ]

        ),
        body: mybody(),
      ),
    );
  }

  Widget mybody() {
    return ListView(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      children: <Widget>[
        Card(
            child : Container(

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

              padding: EdgeInsets.only(top: 5 , left: 5 , right: 5 , bottom: 5),

              margin:EdgeInsets.only(top: 10 , left: 5 , right: 5),
              child : Row(

                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: <Widget>[
                    //width: 500,

                    Icon(Icons.border_color),
                    Text('aX + b = 0' , textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),),
                    //padding: EdgeInsets.only(left:50),


                    Icon(Icons.assignment , )
                  ]
              )  ,
            )
        ),
        Container(

            margin:  EdgeInsets.only(top: 15 ),
            child : AdmobBanner(
              adUnitId: adse.idbanner(),
              adSize: AdmobBannerSize.FULL_BANNER,

            )),

        Container(
          child: Column(

            children: <Widget>[
              Container(

                child: Text('اكتب العدد a ',style: TextStyle(fontWeight: FontWeight.bold)),
              ),

              Card(
                  color: Colors.white30,

                  child: TextField(
                    textAlign: TextAlign.center,
                    controller: a,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'اضغط هنا لكتابة العدد a ',

                    ),
                  )),
              Container(
                child: Text('اكتب العدد b ',style: TextStyle(fontWeight: FontWeight.bold)),
              ),

              Card(
                  color: Colors.white30,
                  child: TextField(
                    textAlign: TextAlign.center,
                    controller: b,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'اضغط هنا لكتابة العدد b',

                    ),
                  )),

              Card(

                child: Container(
                  width: 500,

                  child: Text('  X = $rslt \n  خطوات الحل \n $method ',style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,textDirection: TextDirection.ltr,),

                ),
              ),
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
                          setState(() {
                            method = ' ';
                          });
                          var av = double.parse(a.text.trim());
                          var bv = double.parse(b.text.trim());
                          var h ;

                          try {h = pgcd(av, bv); }catch(e){
                            h = 0 ;
                          };

                          setState(() {



                            at = a.text;
                            bt = b.text;
                            //String he = method ;
                            String  text_method  = ' '  ;

                            mdt.forEach((element) {text_method = text_method +   element   +'\n' ; }) ;
                            method = text_method ;


                            rslt = h.toString();
                          }



                          );
                          //print(mdt);
                        },
                        child: Text("احسب",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      )

                  )


              ),

            ],
          ),

        )


      ],
    );
  }

  double pgcd(var a, var b) {
    mdt = [];
    double x ;
    x = -(b)/a ;
    mdt.add('$a * x + $b = 0' );
    mdt.add('$a * x = -($b)'  );
    mdt.add('x = -($b)/$a'  );
    mdt.add('x = $x' );
    return x ;
  }




}



