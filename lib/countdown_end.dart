import 'package:flutter/material.dart';
import 'countdown.dart';

class CountdownEnd extends StatefulWidget {
  @override
  State createState() => EndState();
}

class EndState extends State<CountdownEnd> {

  void _movetocountdown(){
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => Countdown()),
    );
  }


  Widget build(BuildContext context){
    return Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    "Back To Timer!",
                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(onPressed: _movetocountdown,
                    child: Text("Back")),

    ],
            )
          ],
        )
    );
  }
}