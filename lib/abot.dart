import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


class abot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return   MaterialApp(

        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          Locale("ar", "AE"), // OR Locale('ar', 'AE') OR Other RTL locales
        ],

        home: Scaffold(
        appBar: AppBar(

        title: Text('حول التطبيق'),
    actions: <Widget>[
    IconButton(
    icon: const Icon(Icons.home ),
    tooltip: 'home',
    onPressed: ()  {
    //Navigator.pop(context);

    Navigator.pop(context);
    },
    )
    ]

    ) ,



      body : ListView(
      children: <Widget>[
        
        Center(

          child : Container (
            width: 250,
          height:  250,
          
          child:  Image.asset('issues/images/logo.png'),
        ) )
        ,
        Container(
          child: Row(
            children: <Widget>[
              Text('النسخة',style: TextStyle(fontWeight: FontWeight.bold),),
              Text('0.01',style: TextStyle(fontWeight: FontWeight.bold),),
            ],
          ),

        ),
        Card(
          child : Container(
            padding: EdgeInsets.all(5),
         child :  Text('هذا التطبيق تم تصميمه ليساعد طلبة سنة رابعة متوسط في المراجعة و التمرن على حل المسائل و التمارين بطريقة ممتعة و محفزة يحتوى التطبيقة على جميع الدروس الموجودة في الكتاب المدرسي للجيل الثاني بطريقة مختصرة التطبيق مجاني في جالة وجود اي مشكل او خطأ ما يرجا التواصل معنا عبر الايميل التالي benameurhemidi10@gmail.com'  , style: TextStyle(fontWeight: FontWeight.bold),),
          )),
        Container(
          margin: EdgeInsets.only(top: 20),
          child : Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(30.0),
            color: Color(0xff01A0C7),
            child: MaterialButton(
              minWidth: MediaQuery.of(context).size.width*0.5,
              padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),


              onPressed: ()   {
                Navigator.pop(context);

                //await Navigator.of(context).push(MaterialPageRoute(builder: (context) => Part2(file: file,info2: info2,info3: info3,data:data)));

              },
              child: Text("رجوع",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          ),


        ),


      ],



    )
        )
    );
  }
}
