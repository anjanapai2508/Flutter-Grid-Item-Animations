import 'package:Hover_Animations/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GridItems extends StatefulWidget {
  final Data dataToDisplay;
  GridItems({Key key, this.dataToDisplay}) : super(key: key);

  @override
  _GridItemsState createState() => _GridItemsState();
}

class _GridItemsState extends State<GridItems> {
  CustomClipper blockClipper = RoundBorderClip();
  bool showAnimation = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        hoverColor: Colors.transparent,
        onTap: () {},
        onHover: (value) {
          if (value) {
            setState(() {
              blockClipper = EllipseClip();
              showAnimation = true;
            });
          } else {
            setState(() {
              blockClipper = RoundBorderClip();
              showAnimation = false;
            });
          }
        },
        child: Padding(
          padding: const EdgeInsets.only(right: 10, left: 10),
          child: Container(
            width: 200,
            height: 150,
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                if (showAnimation)
                  Container(
                      alignment: Alignment.topLeft,
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: 50,
                        child: Text(widget.dataToDisplay.initial),
                        decoration: BoxDecoration(
                            color: Colors.orange, shape: BoxShape.circle),
                      )),
                ClipPath(
                  clipper: blockClipper,
                  child: FittedBox(
                    child: Image.asset(widget.dataToDisplay.image),
                    fit: BoxFit.fill,
                  ),
                ),
                if (showAnimation)
                  Container(
                    alignment: Alignment.bottomCenter,
                    child: new Container(
                      height: 50.0,
                      width: 200,
                      child: Text(
                        widget.dataToDisplay.imageName,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.6),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20))),
                    ),
                  )
              ],
            ),
          ),
        ));
  }
}

class EllipseClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(size.width / 4, 0.0);
    path.lineTo(size.width - 20, 0.0);
    path.arcToPoint(Offset(size.width, 20), radius: Radius.circular(20));
    path.lineTo(size.width, size.height - 20);
    path.arcToPoint(Offset(size.width - 20, size.height),
        radius: Radius.circular(20));
    path.lineTo(20, size.height);
    path.arcToPoint(Offset(0.0, size.height - 20), radius: Radius.circular(20));
    path.lineTo(0.0, size.height / 2 - 10);
    path.quadraticBezierTo(80, 60, size.width / 4, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class RoundBorderClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(20.0, 0.0);
    path.lineTo(size.width - 20, 0.0);
    path.arcToPoint(Offset(size.width, 20), radius: Radius.circular(20));
    path.lineTo(size.width, size.height - 20);
    path.arcToPoint(Offset(size.width - 20, size.height),
        radius: Radius.circular(20));
    path.lineTo(20, size.height);
    path.arcToPoint(Offset(0.0, size.height - 20), radius: Radius.circular(20));
    path.lineTo(0.0, 20);
    path.arcToPoint(Offset(20.0, 0.0), radius: Radius.circular(20));
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
