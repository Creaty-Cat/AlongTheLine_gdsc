import 'package:flutter/material.dart';



class optionsBox extends StatelessWidget {

  final String optionsName;
  final String iconPath;

  const optionsBox({
    super.key, 
    required this.optionsName, 
    required this.iconPath
    });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        //Handle
      },
      child: Padding( 
        padding: const EdgeInsets.all(15.0),
        child: Container(
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
              height: 50
              ),

          //name
            Row(
              children: [
                Expanded(child: Text(
                  optionsName, 
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14
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