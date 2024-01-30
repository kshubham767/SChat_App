import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:s_chat/screens/login_screen.dart';
import 'package:s_chat/screens/registration_screen.dart';
import 'package:s_chat/components/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';
  const WelcomeScreen({Key? key}) : super(key: key);
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin{
  late AnimationController controller;
  late Animation animation;
  @override
  void initState() {
    super.initState();
    controller=AnimationController(
    duration: Duration(seconds: 3),
        vsync: this,
    );

    //Used to create a curved animation type
    //animation =CurvedAnimation(parent: controller, curve: Curves.easeIn);

    animation = ColorTween(begin: Colors.red,end: Colors.blue).animate(controller);
    //Proceed forward
    controller.forward();
    controller.addListener(() {setState(() {});});

    //Loop back and forth

    // controller.addStatusListener((status) {
    //   if(status==AnimationStatus.completed){
    //     controller.reverse(from: 1.0);
    //   }
    //   else if(status==AnimationStatus.dismissed){
    //     controller.forward();
    //   }
    // });


  }
  //Dispose the animation when screen is off so resources are not waste
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60,
                  ),
                ),
                AnimatedTextKit(
                  animatedTexts:[TypewriterAnimatedText('Chat',textStyle:const TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                ),)],
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(title:'Log In'
    ,color: Colors.lightBlueAccent,onPressed: () {
      //Go to login screen.
      setState(() {
        Navigator.pushNamed(context,LoginScreen.id);
      });}
    ),
            RoundedButton(title: 'Register', color: Colors.blueAccent, onPressed: () {
        //Go to registration screen.
        setState(() {
      Navigator.pushNamed(context, RegistrationScreen.id);
    });
    },),
          ],
        ),
      ),
    );
  }
}
