import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sidebarx/sidebarx.dart';

import '../Controllers/auth_controller.dart';
import '../components/home_content.dart';
import '../components/my_sidebar_x.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final _controller = SidebarXController(selectedIndex: 0, extended: false);
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthController>(context, listen: false);
    final Future<User?> user = auth.getCurrentUser();

    return  Builder(
          builder: (context) {
            return Scaffold(
              appBar: AppBar(
                title: FutureBuilder<User?>(
                  future: user, // Appel asynchrone
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text('Chargement...');
                    } else if (snapshot.hasData) {
                      return Text('Bienvenue ${snapshot.data?.email}');
                    } else {
                      return Text('Utilisateur non connecté');
                    }
                  },
                ),
              ),
              drawer: MySidebarX(
                controller: _controller ,
              ),
              body: Row(
                children: [
                  Expanded(
                      child: Center(
                        child: HomeContent(
                          controller: _controller,
                        ),
                      ),
                  )
                ],
              ) ,
            );
          }
        );
      }

  }








