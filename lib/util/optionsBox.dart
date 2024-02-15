import 'package:flutter/material.dart';
import 'package:flutter_home/pages/cameraPage.dart';


class OptionsBox extends StatelessWidget {

  final String optionsName;
  final String iconPath;

 const OptionsBox({
  Key? key, 
  required this.optionsName, 
  required this.iconPath,
}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => TextDetectionPage()),
  );
      },
      child: Padding( 
        padding: const EdgeInsets.all(15.0),
        child: Container(
          width: 100,
          height: 100,
        decoration: BoxDecoration(
          color: Color.fromARGB(92, 137, 212, 247),
          borderRadius: BorderRadius.circular(24),
          ),
        padding: EdgeInsets.symmetric(vertical: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

          //icon
            Image.asset(
              iconPath,
              height: 90
              ),

          //name
            Row(
              children: [
                Expanded(child: Text(
                  optionsName, 
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                  ))),
              ],
            )
          ],
          )
        ),
      ),
    );
    
  }
}