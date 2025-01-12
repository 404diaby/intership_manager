import 'package:flutter/material.dart';
import 'package:intership_manager/screens/login_screen.dart';
import 'package:intership_manager/screens/registration_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/logo-UB.png",width: 140,),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Bienvenue sur l'application LPMI - Manager",
              textAlign: TextAlign.center ,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute( builder: (context) => RegistrationScreen()) ),
                child: Text("S'incricre")
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute( builder: (context) => LoginScreen()) ),
                child: Text("Se connecter")
            )
          ],
        ),
      ),

    );
  }


}
