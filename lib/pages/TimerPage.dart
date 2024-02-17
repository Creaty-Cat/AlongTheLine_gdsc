import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show SchedulerBinding, SchedulerBindingState;

class TimePickerValue extends StatefulWidget {
  @override
  _TimePickerValueState createState() => _TimePickerValueState();
}

class _TimePickerValueState extends State<TimePickerValue> {
  TimeOfDay? _beginTime;
  TimeOfDay? _endTime;
  TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _beginTime = TimeOfDay(hour: 9, minute: 0);
    _endTime = TimeOfDay(hour: 17, minute: 0);

    SchedulerBinding.instance!.addPostFrameCallback((_) {
      _showBeginTimePicker();
    });
  }

  void _showBeginTimePicker() {
    showTimePicker(
      context: context,
      initialTime: _beginTime!,
    ).then((selectedTime) {
      if (selectedTime != null) {
        setState(() {
          _beginTime = selectedTime;
        });
        _showEndTimePicker();
      }
    });
  }

  void _showEndTimePicker() {
    showTimePicker(
      context: context,
      initialTime: _endTime!,
    ).then((selectedTime) {
      if (selectedTime != null) {
        setState(() {
          _endTime = selectedTime;
        });
      }
    });
  }

  String _calculateDuration() {
    if (_beginTime != null && _endTime != null) {
      final beginHour = _beginTime!.hour;
      final beginMinute = _beginTime!.minute;
      final endHour = _endTime!.hour;
      final endMinute = _endTime!.minute;

      final durationHour = endHour - beginHour;
      final durationMinute = endMinute - beginMinute;

      return '$durationHour hours $durationMinute minutes';
    }
    return '';
  }

  void _saveAndNavigateBack() {
    // Saving data logic here
    final duration = _calculateDuration();
    final name = _nameController.text;

    print('Name: $name, Duration: $duration');

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Time Picker')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Selected Begin Time: ${_beginTime!.format(context)}',
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(height: 20),
              Text(
                'Selected End Time: ${_endTime!.format(context)}',
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(height: 20),
              Text(
                'Duration: ${_calculateDuration()}',
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(height: 30),
              Container(
  width: 250, 
  child: TextField(
    controller: _nameController,
    decoration: InputDecoration(
      labelText: 'Enter the tracked task',
    ),
  ),
),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: _saveAndNavigateBack,
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
