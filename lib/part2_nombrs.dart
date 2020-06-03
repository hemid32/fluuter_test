import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp2/part3_nombrs.dart';
import "dart:math";
import 'home_page.dart';
import 'package:flutterapp2/hemidi.dart';
import 'part1_nombrs.dart'  ;
import 'package:flutter_localizations/flutter_localizations.dart';
import 'model/Dog.dart';
final _random =  Random();
////

//var list_name_gnrl = ['jndfvj', 'benameur' , 'hakim' , 'hamza ' , 'ahmed'];
//var list_name_gnrl = [info2['qst'],info2['choi1'],info2['choi2'],info2['choi3'], info2['choi4']];
//var list_name = [list_name_gnrl[1],list_name_gnrl[2],list_name_gnrl[3],list_name_gnrl[4]];
//var crr = list_name[3] ;
//print(list_name_gnrl);
//final  new_list = list_ran(list_name);
// end data from  databese
var _hemidi = null ;




enum SingingCharacter { choi1, choi2 , choi3 , choi4 }
class Part2 extends StatefulWidget {
  final  info2 ;
  final  info3 ;
  final file ;
  final data ;

  //Part2(this.info2 , this.info3);

  const Part2({Key key,this.file , this.info2 , this.info3 , this.data}) : super(key: key );




  @override


  /*var list_name_gnrl = [info2['qst'],info2['choi1'],info2['choi2'],info2['choi3'], info2['choi4']];
  var list_name = [list_name_gnrl[1],list_name_gnrl[2],list_name_gnrl[3],list_name_gnrl[4]];
  var crr = list_name[3] ;
  //print(list_name_gnrl);
  final  new_list1 = list_ran(list_name);

  final  new_list = new_list1;*/
  _Part2State createState() => _Part2State();
  //Part2(this.info2 , this.info3);


}

class _Part2State extends State<Part2> {

  //var cnt = widget.data[3] ;






  //SingingCharacter _character = SingingCharacter.choi1;
  SingingCharacter _character = null;



  @override

  Widget build(BuildContext context)  {
    bool cnt  ;
    if (widget.data[3][1][0] == 'issues/images/prv.png'){cnt = false;}else{cnt = true;}

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

          title: Text('تعلم الرياضيات'),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.home ),
                //tooltip: 'home',
                onPressed: ()  {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
              )
            ]
        ) ,
        body: mybody(context , widget.info2 , widget.info3 ,widget.file , widget.data , cnt), // , widget.info2 , widget.info3
      ),
    );

}

var i = 0 ;
var  new_list ;
Widget mybody(context, info2 , info3,file  ,data , cnt) { //, info2 , info3
  // cett list from databese
  var list_name_gnrl ;
  //print('tafoooooooooooooooooooooooooh');
  var title ;
  if (file == 'info'){
    title = data[0][1];
    print(title);
  list_name_gnrl = [data[0][1]['qst'],data[0][1]['choi1'],data[0][1]['choi2'],data[0][1]['choi3'], data[0][1]['choi4']];
  }else if(file == 'info2'){
    title = data[1][1];
  list_name_gnrl = [data[1][1]['qst'],data[1][1]['choi1'],data[1][1]['choi2'],data[1][1]['choi3'], data[1][1]['choi4']];
  }else if(file == 'info3'){
    title = data[2][1];
    print(title);
  list_name_gnrl = [data[2][1]['qst'],data[2][1]['choi1'],data[2][1]['choi2'],data[2][1]['choi3'], data[2][1]['choi4']];
  }



  var list_name = [list_name_gnrl[1],list_name_gnrl[2],list_name_gnrl[3],list_name_gnrl[4]];
  var crr = list_name[3] ;

  //print(list_name_gnrl);
  i++ ;
  if(i == 1){
    new_list = list_ran(list_name);
  };
  //final  new_list = new_list1;

  if(file == 'info'){


    return Column(
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
                Text(title['title'], textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),),
            //padding: EdgeInsets.only(left:50),


                  Icon(Icons.assignment , )
              ]
            )  ,
          )
          ),

          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            child: Text(list_name_gnrl[0] , style: TextStyle(fontWeight: FontWeight.bold),),
          ),
      Container(

      child : Card( child : Column(
        children: <Widget>[

          Card(child  : ListTile(
            title:  Text(new_list[0]),
            leading: Radio(
              value: SingingCharacter.choi1,
              groupValue: _character,
              onChanged: (SingingCharacter value) {
                setState(() {
                  _character = value;
                  _hemidi = new_list[0];
                });
              },
            ),
          ),
          ),
          Card(child: ListTile(
            title:  Text(new_list[1]),
            leading: Radio(
              value: SingingCharacter.choi2,
              groupValue: _character,
              onChanged: (SingingCharacter value) {
                setState(() {
                  _character = value;
                  _hemidi = new_list[1];
                });
              },
            ),
          ),
          ),
          Card(child : ListTile(
            title: Text(new_list[2]),
            leading: Radio(
              value: SingingCharacter.choi3,
              groupValue: _character,
              onChanged: (SingingCharacter value) {
                setState(() {
                  _character = value;
                  _hemidi = new_list[2];
                });
              },
            ),
          ),
          ),
          Card(child : ListTile(
            title: Text(new_list[3]),
            leading: Radio(
              value: SingingCharacter.choi4,
              groupValue: _character,
              onChanged: (SingingCharacter value) {
                setState(() {
                  _character = value;
                  _hemidi = new_list[3];
                });
              },
            ),
          ),
          ),
        ],
      ),
      ),
    ),

          Container(
            margin: EdgeInsets.only(top: 20 , bottom: 10),
            child : Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(30.0),
            color: Color(0xff01A0C7),
            child: MaterialButton(
              minWidth: MediaQuery.of(context).size.width*0.5,
              padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),


              onPressed: () async  {
                //_text.text.isEmpty ? _validate = true : _validate = false;
                //pass.text.isEmpty ? _validate = true : _validate = false ;
                //imail.text.isEmpty ? _validate = true : _validate = false ;


                //print(_character);
                //data();
                //print(data());
                print(new_list);
                print(_hemidi);
                //Navigator.of(context).push(MaterialPageRoute(builder: (context) => Part2()));
                if(_hemidi == crr){
                  print('yessss');
                  showDialog(
                      context: context,
                      barrierDismissible: false,

                      builder: (BuildContext context) {
                        //onWillPop: () => Future.value(false);

                        return WillPopScope(
                            onWillPop: () {
                              return Future.value(true);

                            },
                            child:CupertinoAlertDialog(

                              title: Text('احسنت'),
                              content: Icon(Icons.check_circle , color: Colors.green,),

                              actions: <Widget>[
                                CupertinoDialogAction(

                                    isDefaultAction: true, child: Container(child: Text("اكمل")),


                                    onPressed: () {

                                      //Navigator.pop(context);
                                      Navigator.pop(context, 'Cancel');
                                      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) =>  part3(file:file,info3: info3,data: data,),),); })
                                      //Navigator.pop(context);
                              ],

                            ));
                      });



                } else{
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

                                    isDefaultAction: true, child: Container(child: Text("رجوع")),


                                    onPressed: () async {
                                      var a = await data_tout();
                                      var data_t = await a.data() ;
                                      //Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) =>  nombrs(file,data_t),),);
                                      //print('ol') ;
                                      Navigator.pop(context, 'Cancel');
                                      Navigator.pop(context);

                                    })

                              ],

                            ));
                      });
                }



              },
              child: Text("تحقق",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          ),
          )

        ]
  );
  }else if (file == 'info2') {

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
                      Text(title['title'], textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),),
                      //padding: EdgeInsets.only(left:50),


                      Icon(Icons.assignment , )
                    ]
                )  ,
              )
          ),

          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            child: Text(list_name_gnrl[0] , style: TextStyle(fontWeight: FontWeight.bold),),
          ),

          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            child: cnt ? Image.network(widget.data[3][0][2]) : Image.asset('issues/images/nct.jpg') , // Image.network(widget.data[3][0][2]),
          ),
          Container(

            child : Card( child : Column(
              children: <Widget>[

                Card(child  : ListTile(
                  title:  Text(new_list[0]),
                  leading: Radio(
                    value: SingingCharacter.choi1,
                    groupValue: _character,
                    onChanged: (SingingCharacter value) {
                      setState(() {
                        _character = value;
                        _hemidi = new_list[0];
                      });
                    },
                  ),
                ),
                ),
                Card(child: ListTile(
                  title:  Text(new_list[1]),
                  leading: Radio(
                    value: SingingCharacter.choi2,
                    groupValue: _character,
                    onChanged: (SingingCharacter value) {
                      setState(() {
                        _character = value;
                        _hemidi = new_list[1];
                      });
                    },
                  ),
                ),
                ),
                Card(child : ListTile(
                  title: Text(new_list[2]),
                  leading: Radio(
                    value: SingingCharacter.choi3,
                    groupValue: _character,
                    onChanged: (SingingCharacter value) {
                      setState(() {
                        _character = value;
                        _hemidi = new_list[2];
                      });
                    },
                  ),
                ),
                ),
                Card(child : ListTile(
                  title: Text(new_list[3]),
                  leading: Radio(
                    value: SingingCharacter.choi4,
                    groupValue: _character,
                    onChanged: (SingingCharacter value) {
                      setState(() {
                        _character = value;
                        _hemidi = new_list[3];
                      });
                    },
                  ),
                ),
                ),
              ],
            ),
            ),
          ),

          Container(
            margin: EdgeInsets.only(top: 20 , bottom: 10),
            child : Material(
              elevation: 5.0,
              borderRadius: BorderRadius.circular(30.0),
              color: Color(0xff01A0C7),
              child: MaterialButton(
                minWidth: MediaQuery.of(context).size.width*0.5,
                padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),


                onPressed: () async  {
                  //_text.text.isEmpty ? _validate = true : _validate = false;
                  //pass.text.isEmpty ? _validate = true : _validate = false ;
                  //imail.text.isEmpty ? _validate = true : _validate = false ;


                  //print(_character);
                  //data();
                  //print(data());
                  print(new_list);
                  print(_hemidi);
                  //Navigator.of(context).push(MaterialPageRoute(builder: (context) => Part2()));
                  if(_hemidi == crr){
                    print('yessss');
                    showDialog(
                        context: context,
                        barrierDismissible: false,

                        builder: (BuildContext context) {
                          //onWillPop: () => Future.value(false);

                          return WillPopScope(
                              onWillPop: () {
                                return Future.value(true);
                              },
                              child:CupertinoAlertDialog(

                                title: Text('احسنت'),
                                content: Icon(Icons.check_circle , color: Colors.green,),

                                actions: <Widget>[
                                  CupertinoDialogAction(

                                      isDefaultAction: true, child: Container(child: Text("اكمل")),


                                      onPressed: () {
                                        Navigator.pop(context, 'Cancel');
                                        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) =>   part3(file:file,info3: info3,data: data,),),); })

                                ],

                              ));
                        });




                  } else{
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

                                      isDefaultAction: true, child: Container(child: Text("رجوع")),


                                      onPressed: ()  {
                                        //var a = await data_tout();
                                        //var data_t = await a.data() ;
                                        //Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) =>  nombrs(file,data_t),),);
                                        //print('ol') ;
                                        Navigator.pop(context, 'Cancel');
                                        Navigator.pop(context);
                                      })

                                ],

                              ));
                        });
                  }



                },
                child: Text("تحقق",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ),
          )

        ]
    );

  }else if (file == 'info3'){
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
                      Text(title['title'], textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),),
                      //padding: EdgeInsets.only(left:50),


                      Icon(Icons.assignment , )
                    ]
                )  ,
              )
          ),

          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            child: Text(list_name_gnrl[0] , style: TextStyle(fontWeight: FontWeight.bold),),
          ),
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            child:  cnt ? Image.network(widget.data[3][1][2]) : Image.asset('issues/images/nct.jpg'),//Image.network(widget.data[3][1][2]),
          ),

          Container(

            child : Card( child : Column(
              children: <Widget>[

                Card(child  : ListTile(
                  title:  Text(new_list[0]),
                  leading: Radio(
                    value: SingingCharacter.choi1,
                    groupValue: _character,
                    onChanged: (SingingCharacter value) {
                      setState(() {
                        _character = value;
                        _hemidi = new_list[0];
                      });
                    },
                  ),
                ),
                ),
                Card(child: ListTile(
                  title:  Text(new_list[1]),
                  leading: Radio(
                    value: SingingCharacter.choi2,
                    groupValue: _character,
                    onChanged: (SingingCharacter value) {
                      setState(() {
                        _character = value;
                        _hemidi = new_list[1];
                      });
                    },
                  ),
                ),
                ),
                Card(child : ListTile(
                  title: Text(new_list[2]),
                  leading: Radio(
                    value: SingingCharacter.choi3,
                    groupValue: _character,
                    onChanged: (SingingCharacter value) {
                      setState(() {
                        _character = value;
                        _hemidi = new_list[2];
                      });
                    },
                  ),
                ),
                ),
                Card(child : ListTile(
                  title: Text(new_list[3]),
                  leading: Radio(
                    value: SingingCharacter.choi4,
                    groupValue: _character,
                    onChanged: (SingingCharacter value) {
                      setState(() {
                        _character = value;
                        _hemidi = new_list[3];
                      });
                    },
                  ),
                ),
                ),
              ],
            ),
            ),
          ),

          Container(
            margin: EdgeInsets.only(top: 20 , bottom: 10),
            child : Material(
              elevation: 5.0,
              borderRadius: BorderRadius.circular(30.0),
              color: Color(0xff01A0C7),
              child: MaterialButton(
                minWidth: MediaQuery.of(context).size.width*0.5,
                padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),


                onPressed: () async  {
                  //_text.text.isEmpty ? _validate = true : _validate = false;
                  //pass.text.isEmpty ? _validate = true : _validate = false ;
                  //imail.text.isEmpty ? _validate = true : _validate = false ;


                  //print(_character);
                  //data();
                  //print(data());
                  //print(new_list);
                  //print(_hemidi);
                  //Navigator.of(context).push(MaterialPageRoute(builder: (context) => Part2()));
                  if(_hemidi == crr){
                    //print('yessss');
                    showDialog(
                        context: context,
                        barrierDismissible: false,

                        builder: (BuildContext context) {
                          //onWillPop: () => Future.value(false);

                          return WillPopScope(
                              onWillPop: () {
                                return Future.value(true);
                              },
                              child:CupertinoAlertDialog(

                                title: Text('احسنت'),
                                content: Icon(Icons.check_circle , color: Colors.green,),

                                actions: <Widget>[
                                  CupertinoDialogAction(

                                      isDefaultAction: true, child: Container(child: Text("اكمل")),


                                      onPressed: () {
                                        Navigator.pop(context, 'Cancel');
                                        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) =>   part3(file:file,info3: info3,data: data,),),); })

                                ],

                              ));
                        });



                  } else{
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

                                      isDefaultAction: true, child: Container(child: Text("رجوع")),


                                      onPressed: ()  {
                                        Navigator.pop(context, 'Cancel');
                                        Navigator.pop(context);
                                        //var a = await data_tout();
                                        //var data_t = await a.data() ;
                                        //Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) =>  nombrs(file,data_t),),);
                                        //print('ol') ;
                                      })

                                ],

                              ));
                        });
                  }



                },
                child: Text("تحقق",
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
}

// return list choit random
list_ran(List list){
  var new_list = <String>[] ;
  while(new_list.length != list.length){
    var element = list[_random.nextInt(list.length)];
    if(!new_list.contains(element)){
      new_list.add(element);
    }

    }

  return new_list ;


}

