// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_home/pages/maps.dart';

class NextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight + 30),
        child: Container(
          color: Color.fromARGB(92, 137, 212, 247),
          padding: EdgeInsets.only(top: 25),
          child: AppBar(
            title: Row(
              children: [
                Text(
                  'Bus ',
                  style: TextStyle(fontSize: 30),
                ),
                SizedBox(width: 30),
                Flexible(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Enter a number',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
            leading: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  iconSize: 40,
                ),
              ],
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(20),
        child: Center(
          child: Container(
            width: 500,
            height: 400,
            child: CustomPaint(
              size: Size.fromHeight(400),
              painter: BusSchedulePainter(),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 35),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, size: 35),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite, size: 35),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings, size: 35),
            label: 'Settings',
          ),
        ],
        currentIndex: 0,
        onTap: (int index) {
          // bottom navigation
        },
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.blue[900],
      ),
    );
  }
}


class BusSchedulePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double margin = 20;
    final double graphWidth = size.width - 2 * margin;
    final double graphHeight = size.height - 2 * margin;

    final double startTime = 9.5; 
    final double endTime = 10.4; 

    final double timeRange = endTime - startTime;
    final double unitWidth = graphWidth / timeRange;

    final List<BusInfo> buses = [
      BusInfo(departureTime: 9.5, arrivalTime: 10.2, color: Colors.blue),
      BusInfo(departureTime: 10.0, arrivalTime: 10.3, color: Colors.green),
      BusInfo(departureTime: 10.1, arrivalTime: 10.4, color: Colors.red),
    ];

    final Paint linePaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 4;

    final Paint busPaint = Paint()..style = PaintingStyle.fill;

    final TextStyle textStyle = TextStyle(
      color: Colors.black,
      fontSize: 15,
    );

    // y-axis 
    canvas.drawLine(Offset(margin, margin), Offset(margin, size.height - margin), linePaint);

    // y-axis labels 
    final double yInterval = graphHeight / 3;
    for (int i = 0; i < 3; i++) {
      final double y = margin + (3 - i) * yInterval;
      final label = 'Bus ${i + 1}';
      TextSpan span = TextSpan(text: label, style: textStyle);
      TextPainter tp = TextPainter(text: span, textAlign: TextAlign.right, textDirection: TextDirection.ltr);
      tp.layout();
      tp.paint(canvas, Offset(margin - tp.width - 15, y - 0.5 * tp.height)); 
    }

    // Draw x-axis line
    canvas.drawLine(Offset(margin, size.height - margin), Offset(size.width - margin, size.height - margin), linePaint);

    for (var bus in buses) {
      final double startX = margin + (bus.departureTime - startTime) * unitWidth;
      final double endX = margin + (bus.arrivalTime - startTime) * unitWidth;
      final double y = margin + (3 - buses.indexOf(bus)) * yInterval; 
      
      //  bus line
      linePaint.color = bus.color;
      canvas.drawLine(Offset(startX, y), Offset(endX, y), linePaint);

      // bus circles
      busPaint.color = bus.color;
      canvas.drawCircle(Offset(startX, y), 6, busPaint);
      canvas.drawCircle(Offset(endX, y), 6, busPaint);

      // departure time 
      TextSpan departureText = TextSpan(
        text: '${bus.departureTime.toStringAsFixed(1)}',
        style: textStyle,
      );
      TextPainter departurePainter = TextPainter(
        text: departureText,
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      );
      departurePainter.layout();
      departurePainter.paint(canvas, Offset(startX - departurePainter.width / 2, y + 10));

      // arrival time 
      TextSpan arrivalText = TextSpan(
        text: '${bus.arrivalTime.toStringAsFixed(1)}',
        style: textStyle,
      );
      TextPainter arrivalPainter = TextPainter(
        text: arrivalText,
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      );
      arrivalPainter.layout();
      arrivalPainter.paint(canvas, Offset(endX - arrivalPainter.width / 2, y + 10));
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class BusInfo {
  final double departureTime;
  final double arrivalTime;
  final Color color;

  BusInfo({required this.departureTime, required this.arrivalTime, required this.color});
}