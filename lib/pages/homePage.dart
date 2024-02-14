
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_home/pages/clockFormular.dart';
import 'package:flutter_home/util/optionsBox.dart';

class homePage extends StatefulWidget {

  @override
  State<homePage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<homePage> {

  final double horizontalPadding = 40;
  final double verticalPadding = 25;

  List optionsList = [
    ["Scanner", "assets/images/camera.png", true],
    ["Tracker", "assets/images/tracker.png", false],
    ["Maps", "assets/images/maps.png", false],
    ["Tickets", "assets/images/tickets.png", false],

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [

            //children start

            //BLUE BOX
            Container(
              height: 160,
              decoration: BoxDecoration(
                color: Color.fromARGB(92, 137, 212, 247),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20)
                ),
                
              ),
              
              //PROFILE + NAME
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  
                  Image.asset('assets/images/user.png', height: 100, alignment: Alignment.center,),
                  
                  Text('Name', textAlign: TextAlign.left,)
                  //name

              ]),
            ),
            
            //CLOCK
            /*Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding, 
                vertical: verticalPadding),
                child: Image.asset('/assets/images/placeholder.jpg', height: 80, alignment: Alignment.center,)
            ),*/

            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyForm()),
                );
              },
              child: Container(
                height: 180,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Image.asset(
                  'assets/images/placeholder.png',
                  alignment: Alignment.bottomCenter,
                ),
              ),
            ),


            //GRIDVIEW
            //distance from the blue boxes to the
            //const SizedBox(height:20),

            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding, 
                ),
                child: Text("")
                ),

                Expanded(
                  child: GridView.builder(
                    itemCount: optionsList.length,
                    padding: EdgeInsets.all(25),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        ),
                      itemBuilder: (context, index){
                        return GestureDetector(
                          onTap: (){
                            switch(index){
                              case 0:
                              Navigator.push(
                                context, 
                                MaterialPageRoute(builder: (context) => MyForm()),
                                );
                                break;

                              case 1:
                              Navigator.push(
                                context, 
                                MaterialPageRoute(builder: (context) => MyForm()),
                                );
                                break;

                              case 2:
                              Navigator.push(
                                context, 
                                MaterialPageRoute(builder: (context) => MyForm()),
                                );
                                break;

                              case 3:
                              Navigator.push(
                                context, 
                                MaterialPageRoute(builder: (context) => MyForm()),

                                );
                                break;
                            }
                          },  
                        
                          child: optionsBox(
                            optionsName: optionsList[index][0],
                            iconPath: optionsList[index][1],
                          )
                        );
                        
                      },
                  ),
                )

            //children end

          ],
        )

      )
    );
  }
}