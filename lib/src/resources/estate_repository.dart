import 'package:cloud_firestore/cloud_firestore.dart';


abstract class EstateRepository {
  Stream<QuerySnapshot> getEstates();
}

class EstateRepositoryImpl implements EstateRepository {

  @override
  Stream<QuerySnapshot> getEstates() {
    return Firestore.instance.collection("/estates").snapshots();
  }

}