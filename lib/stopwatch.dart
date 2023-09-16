import 'dart:async';
import 'package:flutter/material.dart';
import 'about.dart';
import 'countdown.dart';


class StopWatch extends StatefulWidget {
  @override
  State createState() => StopWatchState();
}

class StopWatchState extends State<StopWatch> {
  bool isTicking = true;
  int seconds = 0;
  late Timer timer;
  int milliseconds = 0;
  final laps = <int>[];

  void _onTick(Timer timer){
    setState(() {
      milliseconds += 100;
    });
  }

  // String _secondsString() => seconds == 1 ? 'second' : 'seconds';
  String _secondsString(int milliseconds) {
    final seconds = milliseconds / 1000;
    return '$seconds seconds';
  }

  void dispose(){
    timer.cancel();
    super.dispose();
  }

  void _startTimer(){
    timer = Timer.periodic(Duration(milliseconds: 100), _onTick);

    setState(() {
      milliseconds = 0;
      isTicking = true;
      laps.clear();
    });
  }

  void _stopTimer(){
    setState(() {
      timer.cancel();
      isTicking = false;
    });
  }

  void _resetTimer(){
    setState(() {
      milliseconds = 0;
    });
  }

  void _lap (){
    setState(() {
      laps.add(milliseconds);
      _resetTimer();
    });
  }

  void _movetoabout(){
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => About()),
    );
  }

  void _movetocountdown(){
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => Countdown()),
    );
  }

  Widget build(BuildContext context){
    return Scaffold(

      appBar: AppBar(
        title: Text("Stopwatch"),
      ),

      body: Column(
          children: <Widget>[
            Expanded(child: buildCounter(context)),
            Expanded(child: _buildLapDisplay()),
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
                  color: Colors.deepPurple.shade200,
                  width: 100,
                  child: TextButton(
                    onPressed: null,
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
                  width: 100,
                  child: TextButton(
                    onPressed: _movetoabout,
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

  Widget buildCounter(BuildContext context) {
    return Container(
        color: Colors.deepPurple.shade200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Lap ${laps.length + 1}',
              style: Theme.of(context).textTheme.labelSmall?.copyWith(color: Colors.white),
            ),
            Text(
              _secondsString(milliseconds),
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(
                width: 20
            ),
            buildControls(),
            SizedBox(
                width: 20
            ),


          ],
        )
    );
  }

  Row buildControls() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),

            ),
            onPressed: () => _startTimer(),
            child: Text(
                'Start'
            ),
          ),

          SizedBox(
              width: 20
          ),

          TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              onPressed: isTicking ? _stopTimer : null,
              child: Text(
                  'Stop'
              )
          ),

          SizedBox(
              width: 20
          ),

          TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              onPressed: () => _lap(),
              child: Text(
                  'Lap'
              )
          )
        ]
    );


  }
  Widget _buildLapDisplay() {
    return Scrollbar (
      child: ListView.builder(
          itemCount: laps.length,
          itemBuilder: (context, index) {
            final milliseconds = laps[index];

            return ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 50),
              title: Text('Lap ${index + 1}'),
              trailing: Text(_secondsString(milliseconds)),
            );
          }
      ),
    );

  }
}