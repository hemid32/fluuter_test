import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.brown[100],
      child: Center(
        child: SpinKitRotatingPlain(
          color: Colors.blue,
          size: 50.0,

        ),
      ),
    );
  }
}
