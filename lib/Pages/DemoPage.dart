import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class DemoPage extends StatelessWidget {
  const DemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator( 
      onRefresh: () async{
        Future.delayed(Duration(seconds: 1));

      },child: Scaffold(
      appBar: AppBar(),
        body: ListView(
      children: [
        Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.red,
          ),
          height: 200,
          child: Row(children: []),
        ),
        Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.red,
          ),
          height: 200,
          child: Row(children: []),
        ),
        Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.red,
          ),
          height: 200,
          child: Row(children: []),
        ),
        Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.red,
          ),
          height: 200,
          child: Row(children: []),
        ),
        Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.red,
          ),
          height: 200,
          child: Row(children: []),
        ),
        ],
      ), 
        ),);
  }
}
