class DataModel{
  String name;
  String img;
  String description;
  String price;
  int rating;
  String location;
  DataModel({
    required this.name,
    required this.img,
    required  this.description,
    required this.price,
    required this.rating,
    required this.location
  });
   factory DataModel.fromJson(Map<String, dynamic> json){
     return DataModel(name: json['name'], img: json['image'], description: json['description'], price: json['Price'], rating: json['rating'], location: json['location']);
   }
}