import 'dart:async';
import 'package:real_estate_app/src/resources/estate_repository.dart';
import 'package:real_estate_app/src/models/estate_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class EstateBloc {
  Stream<List<EstateModel>> loadEstates();
}

class EstateBlocImpl implements EstateBloc {
  final EstateRepository _repository;
  EstateBlocImpl(this._repository);

  @override
  Stream<List<EstateModel>> loadEstates() {
    return _repository.getEstates().transform(transformToModel);
  }

  final transformToModel = StreamTransformer<QuerySnapshot, List<EstateModel>>.fromHandlers(handleData: (snapshot, sink) {
    final models = List<EstateModel>();
    snapshot.documents.forEach((document) => models.add(EstateModel.fromSnapshot(document)));
    sink.add(models);
  });

}


