import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.tealAccent,
      child: Center(
        child: SpinKitFadingCircle(
          color: Colors.black38,
          size: 50.0,

        ),
      ),
    );
  }
}
