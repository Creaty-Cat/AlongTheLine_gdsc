import 'package:flutter/material.dart';
import 'dart:async';


class LiveLocationPage extends StatefulWidget {
  @override
  _LiveLocationPageState createState() => _LiveLocationPageState();
}

class _LiveLocationPageState extends State<LiveLocationPage> {
  String _name = '';
  Stopwatch _stopwatch = Stopwatch();


  void _saveData(String time) {
    print({'name': _name, 'time': time});
    Navigator.pop(context, {'name': _name, 'time': time});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Live Location'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            StopwatchWidget(
              stopwatch: _stopwatch,
              onSave: _saveData, 
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Name', 
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  _name = value;
                });
              },
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: _stopwatch.isRunning || _name.isEmpty
                  ? null
                  : () {
                      String time = _StopwatchWidgetState()._formatTime(_stopwatch.elapsed);
                      _saveData(time); 
                    },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}

class StopwatchWidget extends StatefulWidget {
  final Stopwatch stopwatch;
  final Function(String) onSave; 

  StopwatchWidget({required this.stopwatch, required this.onSave});

  @override
  _StopwatchWidgetState createState() => _StopwatchWidgetState();
}

class _StopwatchWidgetState extends State<StopwatchWidget> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 280,
              height: 280,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.85),
                    offset: Offset(-10, -10),
                    blurRadius: 10,
                  ),
                  BoxShadow(
                    color: Colors.black38,
                    offset: Offset(-10, -10),
                    blurRadius: 10,
                  ),
                ],
              ),
            ),
            Positioned(
              top: 20,
              child: Icon(Icons.timer, size: 90, color: Colors.grey.shade900),
            ),
            Positioned(
              bottom: 60,
              child: Text(
                _formatTime(widget.stopwatch.elapsed),
                style: TextStyle(fontSize: 40),
              ),
            ),
          ],
        ),
        SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (widget.stopwatch.isRunning) {
                    widget.stopwatch.stop();
                  } else {
                    widget.stopwatch.start();
                  }
                });
              },
              style: ElevatedButton.styleFrom(
                primary: widget.stopwatch.isRunning ? Colors.red : Colors.green,
              ),
              child: Text(widget.stopwatch.isRunning ? 'Stop' : 'Start'),
            ),
            SizedBox(width: 10),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  widget.stopwatch.reset();
                });
              },
              child: Text('Reset'),
            ),
          ],
        ),
      ],
    );
  }

  String _formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return '${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds';
  }

}
