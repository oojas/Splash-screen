import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

import 'animation.dart';


 class splash extends StatefulWidget {
   @override
   _splashState createState() => _splashState();
 }
 
 class _splashState extends State<splash> {
   @override
   Widget build(BuildContext context) {
     return Center(
       child: SplashScreen(

         seconds: 9,
         backgroundColor: Color(0xFF000000),
         image: Image.asset("lib/images/loading.gif",),
        photoSize: 200,
         navigateAfterSeconds: animation(),
         loaderColor: Colors.black,
         title: Text("Your Flutter Friend",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.amberAccent,fontStyle: FontStyle.italic),),


       //  styleTextUnderTheLoader: TextStyle(fontSize:18,fontWeight: FontWeight.bold,color:Colors.white),
        // onClick: Text("Animations"),


       ),
     );
   }
 }
 