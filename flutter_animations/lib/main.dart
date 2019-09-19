import 'package:flutter/material.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
home: HomePage(),      
    );
  }
}

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  //firstly write this animation class
//This is where animation starts(It will do all the stuff with values.)
Animation<double> animation; //animation object has all the state, value and the position of the animations
// It doesn't know anything happening on screen as it is a abstract class

AnimationController animationController ; // Its another object which generates value & frames for the animations
 @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //vsync is argument which prevents off screen animations from consuming un necessary sources
    animationController =
             AnimationController(vsync: this, duration: Duration(milliseconds: 500));


             //here we are using the Tween Animation to set the begin and end duration adn you can use another like Curved too.
                 animation = Tween<double>(begin: 0.0 , end: 1.0).animate(animationController);
   
   
   //Now we have two types of listeners for the animation.
   //ONe is .addListener() Property whuch shows the value for each frame in the animation.
     animation.addListener((){
       setState((){
animation.value;
       });
     });

//Another way to add the listener to the animation is .addStatusListener() which gets the status of the animation.
 animation.addStatusListener((staus) => print(staus));


 animationController.forward();



  }
 
  @override
  Widget build(BuildContext context) {
    return Center(
      
    );
  }
}
