import 'package:flutter/material.dart';
import 'package:intership_manager/Controllers/auth_controller.dart';
import 'package:intership_manager/components/custom_buttom.dart';
import 'package:intership_manager/screens/registration_screen.dart';
import 'package:intership_manager/screens/home_screen.dart';
import 'package:provider/provider.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}


class _LoginScreenState extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthController>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text("Connexion"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              child: TextField(
                controller:  auth.emailController,
                decoration: InputDecoration(labelText: "E-mail", border: OutlineInputBorder() ),
              ),
            ),
            SizedBox(height: 15,),
            SizedBox(
              width: 300,
              child: TextField(
                controller: auth.passwordController,
                obscureText: true,
                obscuringCharacter: "*",
                decoration: InputDecoration(labelText: "Mot de passe", border: OutlineInputBorder() ),
              ),
            ),
            CustomButtom(
                elevetedButtonText: "Se connecter",
                fieldButtonText: "Pas de compte ? S'incrire",
                clickElevated: () {
                  auth.loginUserWithEmailAndPassword(
                      auth.emailController.text.trim(),
                      auth.passwordController.text.trim(),
                      context);
                },
                clickField: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegistrationScreen()),
                  );
                }
            ),
          ],
        ),
      ),
    );
  }

}
