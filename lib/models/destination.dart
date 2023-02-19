// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Destination {
  String title;
  String imageURl;
  double rate;
  double price;
  List<String> categories;
  int tourNumber;
  int capacity;
  Destination({
    required this.title,
    required this.imageURl,
    required this.rate,
    required this.price,
    required this.categories,
    required this.tourNumber,
    required this.capacity,
  });

  String toJson() {
    final Map<String, dynamic> data = {
      'title': title,
      'imageURl': imageURl,
      'rate': rate,
      'price': price,
      'categories': categories,
      'tourNumber': tourNumber,
      'capacity': capacity,
    };
    return json.encode(data);
  }

  factory Destination.fromJson(Map<String, dynamic> jsonData) {
    return Destination(
        title: jsonData['title'],
        imageURl: jsonData['imageURl'],
        rate: jsonData['rate'],
        price: jsonData['price'],
        categories: jsonData['categories'],
        tourNumber: jsonData['tourNumber'],
        capacity: jsonData['capacity']);
  }
}
