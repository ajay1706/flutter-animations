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
Animation<Color> animation; //animation object has all the state, value and the position of the animations
// It doesn't know anything happening on screen as it is a abstract class
//To change the color we use Color than double
AnimationController animationController ; // Its another object which generates value & frames for the animations
 @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //vsync is argument which prevents off screen animations from consuming un necessary sources
    animationController =
             AnimationController(vsync: this, duration: Duration(milliseconds: 2500));


             //here we are using the Tween Animation to set the begin and end duration and you can use another like Curved too.
                 animation = ColorTween(begin: Colors.white , end: Colors.black87).animate(animationController);
   
   
   //Now we have two types of listeners for the animation.
   //ONe is .addListener() Property whuch shows the value for each frame in the animation.
     animation.addListener((){
       setState((){
print(animation.value.toString());
       });
     });

//Another way to add the listener to the animation is .addStatusListener() which gets the status of the animation.
 animation.addStatusListener((staus) => print(staus));


 animationController.forward();



  }
 
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 100.0,
        width:100.0,
        color:animation.value,
        child: FlutterLogo(),
      ),
      
    );
  }
}
