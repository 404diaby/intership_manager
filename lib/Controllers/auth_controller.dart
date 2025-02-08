
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


  Future<void> createUserWithEmailAndPassword(String email, String password,String firstName,String lastName, BuildContext context) async {

    // Vérification des champs requis
    if (firstName.isEmpty || lastName.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Nom et prénom obligatoires')),
      );
      return;
    }

    if (email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('E-mail obligatoire')),
      );
      return;
    }
/*
    if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(email)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Format d'email invalide")),
      );
      return;
    }*/

    if (password.length < 8) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Le mot de passe doit contenir au moins 8 caractères')),
      );
      return;
    }


    try {
      // Tentative de création de compte
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      await userCredential.user?.updateDisplayName("$firstName $lastName");
      await userCredential.user?.reload();

      // Redirection vers l'écran de connexion
      notifyListeners();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Inscription réussie 👍 Connectez-vous !!!')),
      );
    } on FirebaseAuthException catch (e) {
      String errorMessage = "Une erreur est survenue";

      if (e.code == 'email-already-in-use') {
        errorMessage = "Cet e-mail est déjà utilisé. Essayez de vous connecter.";
      } else if (e.code == 'invalid-email') {
        errorMessage = "L'adresse e-mail est mal formée.";
      } else if (e.code == 'weak-password') {
        errorMessage = "Le mot de passe est trop faible.";
      } else if (e.code == 'operation-not-allowed') {
        errorMessage = "L'inscription avec e-mail/mot de passe est désactivée.";
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Erreur inconnue : ${e.toString()}")),
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


