import 'package:admob_flutter/admob_flutter.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_tex/flutter_tex.dart';
import 'package:flutterapp2/hemidi.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutterapp2/loading.dart';
import 'fine.dart';
import 'model/Dog.dart';
import 'part1_nombrs.dart';
import 'part2_nombrs.dart';
import 'part4_nombrs.dart';
//import 'package:flutter_localizations/flutter_localizations.dart';
import 'home_page.dart';




class part3 extends StatefulWidget {
  final info3 ;
  final file ;
  final data ;
  const part3({Key key ,this.file, this.info3 , this.data}) : super(key: key );
  @override
  _part3State createState() => _part3State();
}

class _part3State extends State<part3> {


  final myController = TextEditingController();
  AudioCache _audioCache;
  bool lod = false ;


  // ads
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();
  AdmobBannerSize bannerSize;
  AdmobInterstitial interstitialAd;
  AdmobReward rewardAd;
  final adse = ads();


  @override
  void initState() {
    super.initState();
    // create this only once
    _audioCache = AudioCache(prefix: "audio/", fixedPlayer: AudioPlayer()..setReleaseMode(ReleaseMode.STOP));
    Admob.initialize(adse.idapp());

  }


  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();

  }
  @override
  Widget build(BuildContext context) {
    bool cnt ;



    if (widget.data[3][1][0] == 'issues/images/prv.png'){cnt = false;}else{cnt = true;}
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

          title: Text('تحدي'),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.home ),
                tooltip: 'home',
                onPressed: () async  {
                  setState(()  {
                    lod = true ;
                  });
                  //Navigator.pop(context);
                  var a = await data_tout();
                  var info_tout = await a.data() ;
                  var parcent1 = await a.percent('info') ;
                  var parcent2 = await a.percent('info2') ;
                  var parcent3 = await a.percent('info3') ;
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => home_page(info_tout,parcent1,parcent2,parcent3)),
                        (Route<dynamic> route) => false,
                  );
                  //Navigator.pop(context);
                  //Navigator.pop(context);
                  //Navigator.pop(context);
                  //Navigator.pop(context);

                  setState(() {
                    lod = false ;
                  });
                },
              )
            ]

        ) ,
        body: _mybody3(myController,context , widget.info3 , widget.file, widget.data , cnt, _audioCache),
      ),
    );

  }


bool fff = false  ;
Widget _mybody3(myController,context , info3,file , data, cnt , _audioCache){
  // qstion from data

  if (file == 'info'){



  var  methode = data[0][2]['methode'];
  var  qs = data[0][2]['qst'] ;
  var crr = data[0][2]['crr'] ;
  return  ListView(
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
                    Text(data[4][0]+'-'+' '+data[0][2]['title'] , textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),),
                    //padding: EdgeInsets.only(left:50),


                    Icon(Icons.assignment , )
                  ]
              )  ,
            )
        ),
        Container(

            margin:  EdgeInsets.only(top: 15 , bottom:  15),
            child : AdmobBanner(
              adUnitId: adse.idbanner(),
              adSize: AdmobBannerSize.FULL_BANNER,

            )),

        Card(
            color: Colors.orange[200],
            child : Container(
          //margin: EdgeInsets.only(top: 20),
          padding: EdgeInsets.all(10),
          child: Text(methode,style: TextStyle(fontWeight: FontWeight.bold),),
        )
        )
        ,
        Card(

            child: Container(
              width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(top: 20),
          child: datas1('info', 1),
          //Text(qs,style: TextStyle(fontWeight: FontWeight.bold),),
        )
        )
        ,
        Card(
            color: Colors.white30,

            child : Container(
                width: MediaQuery.of(context).size.width*0.6,

            child: TextField(
              textAlign: TextAlign.center,
              controller: myController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'اكتب الاجابة هنا' ,

              ),
            )
        )
        ),
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

                //print(myController.text);
                //Navigator.of(context).push(MaterialPageRoute(builder: (context) => Part2()));
                if(myController.text == crr){
                  _audioCache.play('yes.mp3');

                  showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) {
                        //onWillPop: () => Future.value(false);

                        return WillPopScope(
                            onWillPop: () {
                              return Future.value(true);
                            },
                            child: CupertinoAlertDialog(

                              title: Text('احسنت'),
                              content: Icon(Icons.check_circle , color: Colors.green,),

                              actions: <Widget>[
                                CupertinoDialogAction(

                                    isDefaultAction: true, child: Container(child: Text("اكمل")),

                                    onPressed: () async {
                                      //Navigator.pop(context, 'Cancel');
                                      var a = await data_tout() ;
                                      var update_ponint = await a.update_point(file);
                                      var point = await a.get_point(file);
                                      //print('point ===  $point');
                                      var p = await a.max_qastion_(file) ;
                                      var  max_point = p ;
                                      if (point > max_point  ){
                                        var point_if_complite = a.update_point_if_complite(file) ;
                                        //Navigator.pop(context, 'Cancel');
                                        //Navigator.pop(context);
                                        //Navigator.pop(context);
                                        //Navigator.pop(context);
                                        await Navigator.of(context).push(MaterialPageRoute(builder: (context) => fine(file: file,)));
                                      }else if((point - 1 ) % 4 == 0   ){
                                        await Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => part4(file:file),)



                                          //var data = await a.data();

                                          ,);

                                      }else {
                                        //Navigator.pop(context, 'Cancel');
                                        //Navigator.pop(context);
                                        //Navigator.pop(context);
                                        //Navigator.pop(context);


                                        setState(() {

                                          lod = true ;
                                        });

                                        var a = await data_tout();
                                        var b = await  a.data() ;

                                        setState(() {
                                          data = b ;
                                        });



                                        Navigator.pop(context);

                                        await Navigator.pop(context);
                                        await Navigator.pop(context);
                                        await Navigator.pop(context);
                                        //var a = await data_tout();
                                        //var info_tout3 = await a.data() ;

                                        //Navigator.pop(context);

                                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => nombrs(file,data)));


                                        setState(() {
                                          lod = false ;
                                        });
                                      }
                                      /*Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) =>  part3(),),);*/ }
                                        )

                              ],

                            )
                        );
                      }
                  )
                  ;} else{
                  _audioCache.play('non.mp3');

                  showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) {

                        return WillPopScope(
                            onWillPop: () {
                              return Future.value(true);
                              //Navigator.pop(context);
                            },
                            child: CupertinoAlertDialog(
                              title: Text('خطأ'),
                              content: Icon(Icons.cancel , color: Colors.red,),

                              actions: <Widget>[
                                CupertinoDialogAction(

                                    isDefaultAction: true, child: Container(child: Text("عودة الي التعريف")),


                                    onPressed: ()  {
                                      Navigator.pop(context, 'Cancel');
                                      Navigator.pop(context);
                                      Navigator.pop(context);

                                      //var a = await data_tout();
                                      //var data_t = await a.data() ;
                                      //Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) =>  nombrs(file,data_t),),);

                                      //Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => nombrs(),),);
                                    })

                              ],

                            ));
                      });
                }


              },
              child: Text("متابعة",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          ),
        )

      ]

  );
  }else if (file == 'info2' || file == 'info3'){
    var  methode ;
    var  qs  ;
    var crr  ;
    var title ;
    var url ;
    print(file);
    if(file == 'info2'){
      methode = data[1][2]['methode'];
      qs = data[1][2]['qst'] ;
      crr = data[1][2]['crr'] ;
      title = data[4][1]+'-'+' '+data[1][2]['title'];
      url = data[3][0][1];


    }else if (file == 'info3'){
      methode = data[2][2]['methode'];
      qs = data[2][2]['qst'] ;
      crr = data[2][2]['crr'] ;
      title = data[4][2]+'-'+' '+data[2][2]['title'];
      url = data[3][1][1];

    }

    return ListView(
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
                      Text(title , textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),),
                      //padding: EdgeInsets.only(left:50),


                      Icon(Icons.assignment , )
                    ]
                )  ,
              )
          ),
          Container(

              margin:  EdgeInsets.only(top: 15 , bottom:  15),
              child : AdmobBanner(
                adUnitId: adse.idbanner(),
                adSize: AdmobBannerSize.FULL_BANNER,

              )),

          Card(
              color: Colors.orange[200],
              child : Container(
                //margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.all(10),
                child: Text(methode,style: TextStyle(fontWeight: FontWeight.bold),),
              )
          )
          ,
          Card(

              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(top: 20),
                child: datas1(file, 1),


                //Text(qs,style: TextStyle(fontWeight: FontWeight.bold),),
              )
          )
          ,
          Card(

              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(top: 20),
                child: cnt ? Image.network(url) : Center(


                    child : Container(

                      padding: EdgeInsets.only(top: 50 , bottom: 50),
                      child: SpinKitRing(
                        color: Colors.blue,
                        size: 50.0,

                      ),
                    )

                ),//Image.network(url),
              )
          ),
          Card(
              color: Colors.white30,

              child : Container(
                  width: MediaQuery.of(context).size.width*0.6,

                  child: TextField(
                    textAlign: TextAlign.center,
                    controller: myController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'اكتب الاجابة هنا' ,

                    ),
                  )
              )
          ),
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

                  //
                  // print(myController.text);
                  //Navigator.of(context).push(MaterialPageRoute(builder: (context) => Part2()));
                  if(myController.text == crr){
                    _audioCache.play('yes.mp3');


                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          //onWillPop: () => Future.value(false);

                          return WillPopScope(
                              onWillPop: () {
                                return Future.value(false);
                              },
                              child: CupertinoAlertDialog(

                                title: Text('احسنت'),
                                content: Icon(Icons.check_circle , color: Colors.green,),

                                actions: <Widget>[
                                  CupertinoDialogAction(

                                      isDefaultAction: true, child: Container(child: Text("اكمل")),

                                      onPressed: () async {
                                        //Navigator.pop(context, 'Cancel');
                                        var a = await data_tout() ;
                                        var update_ponint = await a.update_point(file);
                                        var point = await a.get_point(file);
                                        //print('point ===  $point');
                                        var p = await a.max_qastion_(file) ;
                                        var  max_point = p  ;
                                        if (point > max_point  ){
                                          var point_if_complite = a.update_point_if_complite(file) ;
                                          //Navigator.pop(context, 'Cancel');
                                          //Navigator.pop(context);
                                          //Navigator.pop(context);
                                          //Navigator.pop(context);
                                          await Navigator.of(context).push(MaterialPageRoute(builder: (context) => fine(file: file,)));
                                        }else if((point - 1 )  % 4 ==  0   ){
                                          await Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => part4(file:file),)



                                          //var data = await a.data();

                                            ,);

                                        }else {
                                          //Navigator.pop(context, 'Cancel');
                                          //Navigator.pop(context);
                                          //Navigator.pop(context);
                                          //Navigator.pop(context);


                                          setState(() {

                                            lod = true ;
                                          });

                                          var a = await data_tout();
                                          var b = await  a.data() ;

                                          setState(() {
                                            data = b ;
                                          });



                                          Navigator.pop(context);

                                          await Navigator.pop(context);
                                          await Navigator.pop(context);
                                          await Navigator.pop(context);
                                          //var a = await data_tout();
                                          //var info_tout3 = await a.data() ;

                                          //Navigator.pop(context);

                                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => nombrs(file,data)));


                                          setState(() {
                                            lod = false ;
                                          });

                                        }
                                        /*Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) =>  part3(),),);*/ }
                                  )

                                ],

                              )
                          );
                        }
                    )
                    ;} else{
                    _audioCache.play('non.mp3');

                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {

                          return WillPopScope(
                              onWillPop: () {
                                return Future.value(true);
                              },
                              child: CupertinoAlertDialog(
                                title: Text('خطأ'),
                                content: Icon(Icons.cancel , color: Colors.red,),

                                actions: <Widget>[
                                  CupertinoDialogAction(

                                      isDefaultAction: true, child: Container(child: Text("عودة الي التعريف")),


                                      onPressed: () {
                                        Navigator.pop(context, 'Cancel');
                                        Navigator.pop(context);
                                        Navigator.pop(context);

                                        //var a = await data_tout();
                                        //var data_t = await a.data() ;
                                        //Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) =>  nombrs(file,data_t),),);

                                        //Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => nombrs(),),);
                                      })

                                ],

                              ));
                        });
                  }


                },
                child: Text("متابعة",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ),
          )

        ]

    );


  }

}
  Container datas1(fl , nombre_definition   ){
  var data = widget.data ;
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
              data[k][2]['def'+ def +'1'], style: TextStyle(fontWeight: FontWeight.bold)),
          TeXView(

              child: TeXViewColumn(children: [

                TeXViewDocument(data[k][2]['eq' + def +  '1'],
                )
              ])),
          Text(
              data[k][2]['def' + def +  '2'], style: TextStyle(fontWeight: FontWeight.bold)),
          TeXView(

              child: TeXViewColumn(children: [

                TeXViewDocument(data[k][2]['eq'+ def + '2'],
                )
              ])),
          Text(
              data[k][2]['def'+def + '3'], style: TextStyle(fontWeight: FontWeight.bold)),
          TeXView(

              child: TeXViewColumn(children: [

                TeXViewDocument(data[k][2]['eq'+ def + '3'],
                )
              ])),
          Text(
              data[k][2]['def'+ def + '4'], style: TextStyle(fontWeight: FontWeight.bold)),
          TeXView(

              child: TeXViewColumn(children: [

                TeXViewDocument(data[k][2]['eq'+ def + '4'],
                )
              ])),
          Text(
              data[k][2]['def'+ def + '5'], style: TextStyle(fontWeight: FontWeight.bold)),
          TeXView(

              child: TeXViewColumn(children: [

                TeXViewDocument(data[k][2]['eq'+ def + '5'],
                )
              ])),

        ],



      ),




    );




  }

}