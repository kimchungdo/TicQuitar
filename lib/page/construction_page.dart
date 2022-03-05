import 'package:flutter/material.dart';
import 'package:tic_quitar_2/data/color.dart';

class ConstructionPage extends StatelessWidget {
  const ConstructionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Container(child: Image.asset("assets/images/livey_mainlogo.png"), height: 100, width: 100),
                const Divider(height: 5, color: Colors.transparent),
                const Text("COMING SOON", style: TextStyle(fontSize: 20, color: Colors.black),),
                const Divider(height: 5, color: Colors.transparent),
                const Text("This page is under construction", style: TextStyle(fontSize: 16, color: darkGreyColor),),
                const Text("We are working on it", style: TextStyle(fontSize: 16, color: darkGreyColor),),
                Container(height: 150)
              ],
            )));
  }
}