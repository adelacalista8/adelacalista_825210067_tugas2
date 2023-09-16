import 'package:flutter/material.dart';
import 'countdown.dart';
import 'stopwatch.dart';

class About extends StatefulWidget {
  @override
  State createState() => AboutState();
}

class AboutState extends State<About> {

  void _movetocountdown(){
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => Countdown()),
    );
  }

  void _movetostopwatch(){
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => StopWatch()),
    );
  }

  Widget build(BuildContext context){
    return Scaffold(

      appBar: AppBar(
        title: Text("About"),
      ),

      body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 200,
                  height: 75,
                  child: Image.asset('assets/LogoSI.png'),
                ),
                Container(
                  width: 200,
                  height: 75,
                  child: Image.asset('assets/LogoFTI.png'),
                ),
                SizedBox(
                  height: 60,
                ),
                Text("Adela Calista",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30,)),
                Text("Sistem Informasi",
                    style: TextStyle(fontSize: 20,)),
                Text("825210067",
                    style: TextStyle(fontSize: 20,)),
              ],
            ),
          ]
      ),

      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: Colors.deepPurple.shade200,
        height: 70,
        child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  child: TextButton(
                    onPressed: _movetostopwatch,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.alarm, color: Colors.white,),
                        Text("Stopwatch", style: TextStyle(color: Colors.white))
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 100,
                  child: TextButton(
                    onPressed: _movetocountdown,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.hourglass_empty, color: Colors.white,),
                        Text("Timer", style: TextStyle(color: Colors.white))
                      ],
                    ),
                  ),
                ),
                Container(
                  color: Colors.deepPurple.shade200,
                  width: 100,
                  child: TextButton(
                    onPressed: null,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.person, color: Colors.white, size: 30,),
                        Text("About", style: TextStyle(color: Colors.white))
                      ],
                    ),
                  ),
                ),
              ],
            )
        ),
      ),
    );
  }
}