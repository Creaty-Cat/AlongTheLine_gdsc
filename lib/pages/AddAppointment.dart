import 'package:flutter/material.dart';
import 'package:flutter_home/pages/dateAndTime.dart';
import 'package:flutter_home/pages/dateAndTime.dart';


class AddAppointment extends StatefulWidget {
  @override
  State <AddAppointment> createState() => MyAppointment();
}

class MyAppointment extends State<AddAppointment>{
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40),
        child: AppBar(
          title: Text('New Appointment'),
          backgroundColor: Color.fromARGB(92, 137, 212, 247),
        ),
      ),
      body: SafeArea(

        //Add Symbol
        
        child: Align(
          alignment: FractionalOffset.bottomRight,
          child: Container(
            padding: EdgeInsets.all(10),
            alignment: Alignment.bottomRight,
            height: 80,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DateTimePicker()),
                );
                },
                customBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                splashColor: const Color.fromARGB(255, 170, 212, 247),
            child: Image.asset(
              'assets/images/add.png',
              height: 50,
            ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
