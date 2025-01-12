import 'package:flutter/material.dart';
import 'package:intership_manager/screens/welcome_screen.dart';
import 'package:provider/provider.dart';
import 'package:sidebarx/sidebarx.dart';

import '../Controllers/auth_controller.dart';

class MySidebarX extends StatelessWidget {
  const MySidebarX({
    Key? key,
    required SidebarXController controller,
  })  : _controller = controller,
        super(key: key);

  final SidebarXController _controller;

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthController>(context, listen: false);
    return SidebarX(
      controller: _controller,
      headerBuilder: (context, extended) {
        return SizedBox(
          height: 100,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset('assets/logo-UB.png'),
          ),
        );
      },
      items: [
        SidebarXItem(
          icon: Icons.home,
          label: 'Accueil',
        ),
        SidebarXItem(
          icon: Icons.search,
          label: 'Offres',

        ),
        const SidebarXItem(
          icon: Icons.apartment,
          label: 'Entreprises',
        ),
        SidebarXItem(
          icon: Icons.settings,
          label: 'Paramètres',

        ),
        SidebarXItem(
          icon: Icons.power_settings_new,
          label: 'Déconnexion',
          onTap: () => auth.logOut(context),
        ),
      ],
    );
  }


  }






