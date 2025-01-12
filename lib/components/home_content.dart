import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intership_manager/models/company_offer.dart';
import 'package:intership_manager/models/stage_offer.dart';
import 'package:sidebarx/sidebarx.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final SidebarXController controller;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        switch (controller.selectedIndex) {
          case 0:
            return Dashboard();
          case 1:
            return Offers();
          case 2:
            return Companies();
          case 3:
            return Placeholder();
          default:
            return Text('Not found page');
        }
      },
    );
  }
}



class Dashboard extends StatelessWidget {
  Dashboard({super.key});

  @override
  Widget build(BuildContext context) {

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            child: SizedBox(
              width: 300,
              height: 100,
              child: Center(
                child: ListTile(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Click sur tout offre de stage ')
                      ),
                    );
                  },
                  leading: Icon(Icons.newspaper),
                  title: Text('Nombre d\'offres de stage: ${StageOffer.offerList.length}'),
                ),
                ),
              ),
            ),
          Card(
            child: SizedBox(
              width: 300,
              height: 100,
              child: Center(
                child: ListTile(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Click sur toutes les entreprises ')
                        ),
                      );
                    },
                  leading: Icon(Icons.apartment),
                    title: Text('Nombre d\'entrepises: ${CompanyOffer.companiesList.length}')
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Offers extends StatelessWidget {
  const Offers({super.key});


  @override
  Widget build(BuildContext context) {
    final stageList = StageOffer.offerList;
    return ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text('Vous avez ${stageList.length} offres de stage:'),

          ),
          for( var stage in stageList)
            Padding(
              padding: const EdgeInsets.all(10),
              child:  ListTile(
                leading: Icon(Icons.newspaper),
                title: Text(stage.title),
                subtitle: Text('Par ${stage.company} - A ${stage.location}'),
                tileColor: Colors.red.withOpacity(0.5),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Click sur une offre de stage ')
                      ),
                  );
                },
              ),
            ),
        ]
    );

  }
}


class Companies extends StatelessWidget {
  Companies({super.key});
  @override
  Widget build(BuildContext context) {
    final companiesList = CompanyOffer.companiesList;
    return ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text('Vous avez ${companiesList.length} entreprise :'),

          ),
          for( var company in companiesList)
            Padding(
              padding: const EdgeInsets.all(10),
              child:  ListTile(
                leading: Icon(Icons.apartment),
                title: Text(company.name),
                subtitle: Text(company.location),
                tileColor: Colors.red.withOpacity(0.5),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Click sur une entreprise ')
                    ),
                  );
                },
              ),
            ),
        ]
    );
  }
}


class Settings extends StatelessWidget {
  Settings({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Your body app ( setting )"),
    );
  }
}


String getTitleByIndex(int index) {
  switch (index) {
    case 0:
      return 'Tableau de bord';
    case 1:
      return 'Offres de stage';
    case 2:
      return 'Liste d\'entrpise';
    case 3:
      return 'Paramètre';
    default:
      return 'Not found page';
  }
}