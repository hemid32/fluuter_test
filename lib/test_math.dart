import 'package:flutter/material.dart';
import 'package:flutter_tex/flutter_tex.dart';



class mathE extends StatefulWidget {
  @override
  _mathState createState() => _mathState();
}

class _mathState extends State<mathE> {
  var h = r"""<p> 
                                                           
                           When \(a \ne 0 \),  هههههههههه ههههه هههه اهلا بالعلم \(ax^2 + bx + c = 0\) and they are
                           $$x = {-b \pm \sqrt{b^2-4ac} \over 2a}.$$</p>""" ;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TeXView(
          child: TeXViewColumn(children: [
            TeXViewInkWell(
              id: "id_0",
              child: TeXViewColumn(children: [
                TeXViewDocument(r"""<h2>Flutter \( \rm\\TeX \)</h2>""",
                    style: TeXViewStyle(textAlign: TeXViewTextAlign.Center)),
                TeXViewContainer(
                  child: TeXViewImage.network(
                      'https://raw.githubusercontent.com/shah-xad/flutter_tex/master/example/assets/flutter_tex_banner.png'),
                  style: TeXViewStyle(
                    margin: TeXViewMargin.all(10),
                    borderRadius: TeXViewBorderRadius.all(20),
                  ),
                ),
                TeXViewDocument(h,
                    style: TeXViewStyle.fromCSS(
                        'padding: 15px; color: white; background: green'))
              ]),
            )
          ]),
          style: TeXViewStyle(
            elevation: 10,
            borderRadius: TeXViewBorderRadius.all(25),
            border: TeXViewBorder.all(TeXViewBorderDecoration(
                borderColor: Colors.blue,
                borderStyle: TeXViewBorderStyle.Solid,
                borderWidth: 5)),
            backgroundColor: Colors.white,
          ),
          loadingWidgetBuilder: (context) => Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircularProgressIndicator(),
                Text("Rendering...")
              ],
            ),
          ))
    );}
  }
