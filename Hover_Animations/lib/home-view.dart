import 'package:Hover_Animations/data.dart';
import 'package:Hover_Animations/grid-items.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  HomeView({Key key}) : super(key: key);

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  List<Data> dataToDisplay = Data.getTestData();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Hover Over Grid View List"),
        ),
        body: Center(
            child: Container(
          alignment: Alignment.center,
          height: 150,
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: dataToDisplay.length,
              itemBuilder: (context, index) {
                return GridItems(dataToDisplay: dataToDisplay[index]);
              }),
        )));
  }
}
