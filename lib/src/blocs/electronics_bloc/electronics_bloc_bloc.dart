import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_bloc_app/src/repositories/products_repo.dart';

import '../../models/products_model.dart';

part 'electronics_bloc_event.dart';
part 'electronics_bloc_state.dart';

class ElectronicsBloc extends Bloc<ElectronicsBlocEvent, ElectronicsBlocState> {
  final ProductsRepo _productsRepo = ProductsRepo();
  ElectronicsBloc() : super(ElectronicsBlocInitialState()) {
    on<ElectronicsBlocEvent>((event, emit) async {
      List<ProductsModel> electronicsData =
          await _productsRepo.getElectronics();
      emit(ElectronicsBlocLoadedState(electronicsData: electronicsData));
    });

    add(ElectronicsInitialEvent());
  }
}
