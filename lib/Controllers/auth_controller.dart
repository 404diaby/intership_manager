
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthController extends ChangeNotifier{
  final auth = FirebaseAuth.instance;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();


  Future<User?> createUserWithEmailAndPassword(String email, String password) async {
    try{
      final credential = await auth.createUserWithEmailAndPassword(email: email, password: password);
      notifyListeners();

      return credential.user;
    }catch(e){
      print("Erreur lors de l'inscription");
    }
    return null;

  }


  Future<User?> loginUserWithEmailAndPassword(String email, String password) async {
    try{

      final credential = await auth.signInWithEmailAndPassword(email: email, password: password);
      return credential.user;
    }catch(e){
      print("Erreur lors de la connexion");
    }

    return null;

  }


  Future<bool> logOut() async {
    try{
      await auth.signOut();
      print("Déconnexion réussie");
      return true;
    }catch(e){
      print("Echec de la deconnexion");
      return false;
    }

  }

  Future<User?> getCurrentUser() async{
     try {
       final credential = auth.currentUser;
       print(credential);
       return credential;
     } catch (e) {
       return null;
     }
   }





  }


