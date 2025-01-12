import 'package:flutter/material.dart';
import 'package:intership_manager/Controllers/auth_controller.dart';
import 'package:intership_manager/components/custom_buttom.dart';
import 'package:intership_manager/screens/login_screen.dart';
import 'package:provider/provider.dart';

import 'home_screen.dart';


enum Gender { masculin, feminin }

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}


class _RegistrationScreenState extends State<RegistrationScreen> {
  Gender? _selectedGender;

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthController>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Inscription"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              child: TextField(
                //controller: emailController ,
                decoration: InputDecoration(
                    labelText: "Nom", border: OutlineInputBorder()),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              width: 300,
              child: TextField(
                decoration: InputDecoration(
                    labelText: "Prénom", border: OutlineInputBorder()),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              width: 300,
              child: TextField(
                controller: auth.emailController,
                decoration: InputDecoration(
                    labelText: "E-mail", border: OutlineInputBorder()),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              width: 300,
              child: TextField(
                controller: auth.passwordController,
                obscureText: true,
                obscuringCharacter: "*",
                decoration: InputDecoration(
                    labelText: "Mot de passe", border: OutlineInputBorder()),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Radio<Gender>(
                        value: Gender.masculin,
                        groupValue: _selectedGender,
                        onChanged: (Gender? value) {
                          setState(() {
                            _selectedGender = value;
                          });
                        }),
                    Text("Masculin")
                  ],
                ),
                Row(
                  children: [
                    Radio<Gender>(
                        value: Gender.feminin,
                        groupValue: _selectedGender,
                        onChanged: (Gender? value) {
                          setState(() {
                            _selectedGender = value;
                          });
                        }),
                    Text("Feminin")
                  ],
                )
              ],
            ),
            CustomButtom(
                elevetedButtonText: "S'incrire",
                fieldButtonText: "Déja un compte ? Se connecter",
                clickElevated: () => signUp(context),
                clickField: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                }),
          ],
        ),
      ),
    );
  }


  void signUp(context) async {

    final auth = Provider.of<AuthController>(context, listen: false);

    if(_selectedGender == null){
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text("Aucun genre selectionner"))
      );
      return;
    }
    try{
      await auth.createUserWithEmailAndPassword(
        auth.emailController.text.trim(),
        auth.passwordController.text.trim()
      ).then((user) async {
        if(user != null){
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text("Inscription réussi")
            ),
          );
          Navigator.push(context, MaterialPageRoute( builder: (context) => HomeScreen()));
        }else{
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text("Echec de l'inscription")
            ),
          );
        }
      });
    }catch(e){
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text("Erreur lors de la procédure d'inscription : $e"))
        );

      }
  }
}
