import 'package:flutter/material.dart';
import 'package:tic_quitar/games/power_code_game_page.dart';

class FingersPage extends StatefulWidget {
  const FingersPage({Key? key}) : super(key: key);

  @override
  _FingersPageState createState() => _FingersPageState();
}

class _FingersPageState extends State<FingersPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(itemBuilder: (ctx, idx){
          if(idx == 0){
            return Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(height: 10),
                    Center(child: Text("파워 코드 암기 ★☆☆☆☆", style: TextStyle(fontSize: 16),)),
                    InkWell(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        height: 50,
                        child: Center(child: Text("파워코드 암기", style: TextStyle(fontSize: 16),)),
                        decoration: BoxDecoration(
                            color: Colors.orangeAccent,
                            borderRadius: BorderRadius.circular(10)
                        ),
                      ),
                      onTap: () async {
                        await Navigator.of(context).push(
                            MaterialPageRoute(builder: (ctx)=>PowerCodeGamePage())
                        );
                      },
                    ),
                  ],
                )
            );
          }

          return Container();
        },
          itemCount: 3,
        )
    );
  }
}
