class DataModel {
  String name;
  String location;
  String img;
  String decription;
  int people;
  int start;
  double price;
  int id;

  DataModel(
      {required this.name,
      required this.location,
      required this.img,
      required this.decription,
      required this.start,
      required this.people,
      required this.price,
      required this.id});

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
        id: json["id"],
        name: json["name"],
        location: json["location"],
        img: json["img"],
        decription: json["decription"],
        start: json["start"],
        people: json["people"],
        price: json["price"]);
  }
}
