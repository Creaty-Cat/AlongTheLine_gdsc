// ignore_for_file: prefer_const_constructors, prefer_final_fields, library_private_types_in_public_api

import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimePicker extends StatefulWidget {
  @override
  _DateTimePickerState createState() => _DateTimePickerState();
}

class _DateTimePickerState extends State<DateTimePicker> {
  double _height = 0.0;
  double _width = 0.0;
  String _setTime = '';
  String _setDate = '';
  String _hour = '';
  String _minute = '';
  String _time = '';
  String dateTime = '';

  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay(hour: 00, minute: 00);

  final _formKey = GlobalKey<FormState>();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _timeController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _detailsController = TextEditingController();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      initialDatePickerMode: DatePickerMode.day,
      firstDate: DateTime(2010),
      lastDate: DateTime(2100),
    );
    if (picked != null)
      setState(() {
        selectedDate = picked;
        _dateController.text = DateFormat.yMd().format(selectedDate);
      });
  }

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null)
      setState(() {
        selectedTime = picked;
        _hour = selectedTime.hour.toString();
        _minute = selectedTime.minute.toString();
        _time = _hour + ' : ' + _minute;
        _timeController.text = _time;
        _timeController.text = formatDate(
          DateTime(2019, 08, 1, selectedTime.hour, selectedTime.minute),
          [hh, ':', nn, " ", am],
        ).toString();
      });
  }

  @override
  void initState() {
    _dateController.text = DateFormat.yMd().format(DateTime.now());
    _timeController.text = formatDate(
      DateTime(2019, 08, 1, DateTime.now().hour, DateTime.now().minute),
      [hh, ':', nn, " ", am],
    ).toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    dateTime = DateFormat.yMd().format(DateTime.now());
    return Scaffold(
      appBar: AppBar(
        title: Text('Appointments'),
        backgroundColor: Color.fromARGB(92, 137, 212, 247),
      ),
      body: Container(
        width: _width,
        height: _height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[

            //APPOINTMENT NAME
            Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Appointment Name',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      
                    }
                    return null;
                  },
                ),
              ),

            //DATE  
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[                  
                  Text(
                    'Choose A Date',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5,
                        ),
                  ),
                  InkWell(
                    onTap: () {
                      _selectDate(context);
                    },
                    child: Container(
                      width: _width / 2 ,
                      height: _height / 10,
                      margin: EdgeInsets.only(top: 10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(92, 137, 212, 247),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      
                      child: TextFormField(
                        style: TextStyle(fontSize: 30),
                        textAlign: TextAlign.center,
                        enabled: false,
                        keyboardType: TextInputType.text,
                        controller: _dateController,
                        onSaved: (String? val) {
                          _setDate = val!;
                        },
                        decoration: InputDecoration(
                            disabledBorder:
                                UnderlineInputBorder(borderSide: BorderSide.none),
                            // labelText: 'Time',
                            contentPadding: EdgeInsets.all(5)),
                      
                      ),
                    ),
                  ),
                ],
              ),
            ),

            //TIME
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    'Choose A Time',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5),
                  ),
                  InkWell(
                    onTap: () {
                      _selectTime(context);
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 10),
                      width: _width / 2,
                      height: _height / 10,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(92, 137, 212, 247),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                      child: TextFormField(
                        style: TextStyle(fontSize: 30),
                        textAlign: TextAlign.center,
                        onSaved: (String? val) {
                          _setTime = val!;
                        },
                        enabled: false,
                        keyboardType: TextInputType.text,
                        controller: _timeController,
                        decoration: InputDecoration(
                            disabledBorder:
                                UnderlineInputBorder(borderSide: BorderSide.none),
                            // labelText: 'Time',
                            contentPadding: EdgeInsets.all(5)),
                      ),
                    ),
                  ),
              
                ],
              ),
            ),

            //DETAILS
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 20.0),
              child: TextFormField(
                controller: _detailsController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Add additional details',
                  hintStyle: TextStyle(color: Color.fromARGB(234, 153, 153, 153)
                  ),
                ),                  
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0),
              child: ElevatedButton(
                  
                style: ElevatedButton.styleFrom(
                    //crossAxisAlignment: CrossAxisAlignment.center
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    /*Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddAppointment()),
                    );*/
                  }                    
                },
                child: Text('Submit', textAlign: TextAlign.center,),
                  
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  @override
  void dispose() {
    _nameController.dispose();
    _dateController.dispose();
    _timeController.dispose();
    super.dispose();
  }
}