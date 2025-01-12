class CompanyOffer {
  final String name;
  final String location;
  final String domain;
  final String description;
  //TODO : Ajouter plusd de propriété


  CompanyOffer({  required this.name, required this.location, required this.domain , required this.description});

  static List<CompanyOffer> companiesList = [
    CompanyOffer(name: "Capegemini", location: "Dijon",domain: 'GAFAM' , description: "Lorem LoremLoremLoremLorem"),
    CompanyOffer(name: "Google", location: "NY",domain: 'Tech', description: "LoremLoremLoremLoremLoremLoremLorem")

  ];


}

