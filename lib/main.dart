import 'package:expensemanager/authentication/signup_screen.dart';
import 'package:expensemanager/navigation/app_navigation.dart';
import 'package:expensemanager/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

//This app flows feature wise development architecture
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ 
        //auth
        ChangeNotifierProvider(create:(_) => AuthProvider(),)
      ],
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Consumer<AuthProvider>(
        builder: (context, authProvider, _) {
          return authProvider.isAuthenticated ?const AppNavigation() :const SignupScreen();
        },
      ),
      ),
    );
  }
}

