import 'package:real_estate_app/src/ui/estate_list.dart';
import 'package:real_estate_app/src/resources/estate_repository.dart';
import 'package:real_estate_app/src/blocs/estate_bloc.dart';

class EstateAssembly {

  EstateListWidget module() {
    final repository = EstateRepositoryImpl();
    final bloc = EstateBlocImpl(repository);
    final state = EstateListState(bloc);
    return EstateListWidget(state);
  }

}