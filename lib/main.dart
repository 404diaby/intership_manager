import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intership_manager/Controllers/auth_controller.dart';
import 'package:intership_manager/screens/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'package:intership_manager/screens/home_screen.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => AuthController())],
        child: MaterialApp(
          title: 'Application de recherche de stage',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),

          home:  AuthWrapper(),

        ) ,
    );

  }
}

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthController>(context, listen: false);
    return StreamBuilder<User?>(
      stream: auth.auth.authStateChanges(),
      builder: (context, snapshot) {

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        // Si l'utilisateur est connecté, on affiche HomeScreen
        if (snapshot.hasData) {
          print('Connecter');
          return HomeScreen();
        }
        else{
        // Si l'utilisateur est déconnecté, on affiche WelcomeScreen
          print('Non connecté');
          return WelcomeScreen();
          }
        },
    );
  }
}
