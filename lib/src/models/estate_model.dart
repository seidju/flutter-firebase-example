import 'package:cloud_firestore/cloud_firestore.dart';

class EstateModel {

 String _id;
 int _price;
 int _roomCount;
 String _phone;
 List<String> _photos;
 String _description;
 Address _address;


 EstateModel.fromSnapshot(DocumentSnapshot snapshot) {
   final json = snapshot.data;
   _id = snapshot.documentID;
   _price = json["price"];
   _address = Address.fromSnapshot(snapshot);
   _roomCount = json["roomCount"];
   _phone = json["phone"];
   _description = json["description"];
   _photos = List.from(json["photos"]);
 }

 String get id => _id;
 int get price => _price;
 int get roomCount => _roomCount;
 String get phone => _phone;
 List<String> get photos => _photos;
 String get description => _description;
 Address get address => _address;
}

class Address {
  String _apartment;
  String _city;
  String _district;
  String _street;

  Address.fromSnapshot(DocumentSnapshot snapshot) {
    final json = snapshot.data;
    final addressJson = json["address"];
    _apartment = addressJson["apartment"];
    _city = addressJson["city"];
    _district = addressJson["district"];
    _street = addressJson["street"];
  }

  String get apartment => _apartment;
  String get city => _city;
  String get district => _district;
  String get street => _street;
}