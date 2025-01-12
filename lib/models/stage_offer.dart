class StageOffer {
  final String title;
  final String company;
  final String location;
  final String description;


  StageOffer({  required this.title, required this.company, required this.location , required this.description});

  static List<StageOffer> offerList = [
    StageOffer(title: "DEV FS", company: "Capegemini", location: "Dijon", description: "Lorem LoremLoremLoremLorem"),
    StageOffer(title: "DATASC", company: "Google", location: "NY", description: "LoremLoremLoremLoremLoremLoremLorem")

  ];

  }

