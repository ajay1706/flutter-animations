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
//To change the color we use Color than double
AnimationController animationController ; // Its another object which generates value & frames for the animations
 @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //vsync is argument which prevents off screen animations from consuming un necessary sources
    animationController =
             AnimationController(vsync: this, duration: Duration(milliseconds: 4000));


             //here we are using the Tween Animation to set the begin and end duration and you can use another like Curved too.
                 animation = Tween<double>(begin: 0.0 , end:1.0).animate(animationController);
   
   
   //Now we have two types of listeners for the animation.
   //ONe is .addListener() Property whuch shows the value for each frame in the animation.
//      animation.addListener((){    //delete this part after creating the AnimatedLogo class
//        setState((){
// print(animation.value.toString());
//        });
//      });

//Another way to add the listener to the animation is .addStatusListener() which gets the status of the animation.
 animation.addStatusListener((staus) => print(staus));


 animationController.forward();



  }
 
  @override
  Widget build(BuildContext context) {
    return Center(
      child:AnimatedLogo(
        animation: animation,
      )
      
    );
  }
}
//AnimatedWidget help in creating and setting states of aimation here rather than thier in the UI and logic part
//The Purpose of using this as now we don't need the setState or addListener method
class AnimatedLogo extends AnimatedWidget{
final Tween<double> _sizeAnim = Tween<double>(begin:0.0,end: 400);
  AnimatedLogo(
{Key key, Animation animation}): 
super(key:key , listenable:animation);

  @override
  Widget build(BuildContext context) {
    final  Animation<double> animation = listenable;
    // TODO: implement build
    return 
    
    // Opacity( 
      // opacity: animation.value,
     
     //Transform.rotate roates your widget
     //angle takes up the angle values....
     // we change the begin to 30 and end to 180
      // child:
       Transform.scale(
        scale:_sizeAnim.evaluate(animation) ,
            
          child: FlutterLogo(),
       
      // ),
    );
  }

}