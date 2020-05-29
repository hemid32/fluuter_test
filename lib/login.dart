import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:email_validator/email_validator.dart';



class login extends StatefulWidget {
  login({Key key, this.title}) : super(key: key);
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.
  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  final String title;
  @override
  _loginState createState() => _loginState();
}
class _loginState extends State<login> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  final imail = TextEditingController();
  final pass = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _validate = false;



  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    imail.dispose();
    pass.dispose();
    super.dispose();
  }
  Widget build(BuildContext context) {

    final emailField = TextField(
      key: _formKey,
      controller: imail,
      obscureText: false,
      style: style,
      decoration: InputDecoration(

          errorText: _validate ? 'Value Can\'t Be Empty' : null,
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final passwordField = TextField(


      controller: pass,
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),


        onPressed: () async  {
            //_text.text.isEmpty ? _validate = true : _validate = false;
            //pass.text.isEmpty ? _validate = true : _validate = false ;
            //imail.text.isEmpty ? _validate = true : _validate = false ;
          var email = (imail.text).trim() ;
          print(EmailValidator.validate(email));
          var res = (await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: pass.text));
          //userData = (await _auth.signInWithEmailAndPassword(email: userName.trim(), password: userPassword)).user;
              if(res != null){print('yess');}else{print('noo');}




        },
        child: Text("Login",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(36.0),
              child:  ListView(
              //crossAxisAlignment: CrossAxisAlignment.center,
              //mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 155.0,
                  child: Image.asset(
                    "issues/images/prv.png",
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 45.0),
                emailField,
                SizedBox(height: 25.0),
                passwordField,

                SizedBox(
                  height: 35.0,
                ),
                loginButon,
                SizedBox(
                  height: 15.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}