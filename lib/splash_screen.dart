import "dart:async";
import "package:expensemanager/authentication/signup_screen.dart";
import "package:expensemanager/utils/constant.dart";
import "package:flutter/material.dart";

class SplashScreen extends StatefulWidget {

  const SplashScreen({super.key});

  @override
  State createState()=>_SplashState();
}

class _SplashState extends State{

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(
        const Duration(milliseconds: 2500),
        () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const SignupScreen()),
            ));
  }
   @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Column( 
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [ 
          const SizedBox(
            height: 20,
          ),
          Center( 
            child: TweenAnimationBuilder(
              tween: Tween<double>(begin: 0,end: 200),
              duration: const Duration(milliseconds: 1500),
              builder: (context, value, child) {
            
                return Container( 
                height: value,
                width: value,
                decoration: BoxDecoration( 
                  borderRadius: BorderRadius.circular(100),
                  color:const  Color.fromRGBO(234, 238, 235, 1),
                ),
                child: child,
              );
              },
            child: Center( 
                  child: Image.asset(
                    logo,
                    height: 90,
                    width: 90,
                  ),
                ),
            ),
          ),
         const  Text( 
            "Expense Manager",
            style: TextStyle( 
              fontSize: 18,
              fontWeight: FontWeight.w800,
            ),
          )
        ],
      ),
    );
  }
}