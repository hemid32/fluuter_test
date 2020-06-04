
import 'package:flutter/material.dart';
import 'package:flutterapp2/model/Dog.dart';
import 'fine.dart';
import 'hemidi.dart';
import 'part2_nombrs.dart';
import 'part1_nombrs.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'home_page.dart';
import 'package:async_loader/async_loader.dart';

class part4 extends StatefulWidget {
  final file ;
  const part4({Key key ,this.file}) : super(key: key );
  @override
  _part4State createState() => _part4State();
}

class _part4State extends State<part4> {
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
        body: _mybody(context,widget.file),
      ),
    );

  }
}


Widget _mybody(context,file){
  return Column(
    children: <Widget>[
      Center(child : Container(
        margin: EdgeInsets.only(top: 90 ),
      child : Text('احسنت انت تبدي جيدا' , textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold)),
      )
      ),
      Center(child : Container(
        padding: EdgeInsets.only(top: 60),
      child : Image.asset('issues/images/prv.png')
      )
      ),
      Center(
        child: Container(
            margin: EdgeInsets.only( top: 150 ),
            child : RaisedButton(
            padding: EdgeInsets.only(top: 10 , bottom: 10 ,right: 70 , left: 70),
            color: Colors.tealAccent,


            child: Text('متابغة'),
            onPressed: () async {
            //print('hemidi love');

              var a = await data_tout() ;
              var data = await a.data();
              //Navigator.pop(context);

              Navigator.pop(context);
              Navigator.pop(context);
              Navigator.pop(context);
              Navigator.pop(context);
              Navigator.pop(context);
              //Navigator.pop(context);

              await Navigator.of(context).push(MaterialPageRoute(builder: (context) => nombrs(file,data)));
              //Navigator.pop(context);

            }
                  ),
      )
      )
    ],
  );
  //return
}