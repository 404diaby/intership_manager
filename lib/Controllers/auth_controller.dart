
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intership_manager/screens/login_screen.dart';
import 'package:intership_manager/screens/welcome_screen.dart';

import '../screens/home_screen.dart';

class AuthController extends ChangeNotifier{
  final auth = FirebaseAuth.instance;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();


  Future<void> createUserWithEmailAndPassword(String email, String password, BuildContext context) async {

    if(email.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('E-mail obligatoire')),
      );
    }else if (password.length < 8){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Le mot de passe doit contenir au moins 8 caractères')),
      );
    } else{
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      notifyListeners();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Inscription réussie 👍 Connectez-vous !!!')),
      );
    }
  }


  Future<void> loginUserWithEmailAndPassword(String email, String password, BuildContext context) async {
    try{
      final credential = await auth.signInWithEmailAndPassword(email: email, password: password);
      notifyListeners();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Connexion réussie !')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('identifiant incorrect')),
      );
    }
  }


  Future<bool?> logOut(BuildContext context) async {
    try{
      await auth.signOut();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text("Déconnexion réussi")
        ),
      );
      Navigator.push(context, MaterialPageRoute( builder: (context) => WelcomeScreen()));
      return true;
    }catch(e){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Echec de la déconnexion")
        ),
        );
      print("Erreur: $e");
      return false;
    }
  }







  }


