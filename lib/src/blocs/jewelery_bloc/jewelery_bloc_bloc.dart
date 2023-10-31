import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/products_model.dart';
import '../../repositories/products_repo.dart';

part 'jewelery_bloc_event.dart';
part 'jewelery_bloc_state.dart';

class JeweleryBloc extends Bloc<JeweleryBlocEvent, JeweleryBlocState> {
  final ProductsRepo _productsRepo = ProductsRepo();
  JeweleryBloc() : super(JeweleryBlocInitialState()) {
    on<JeweleryBlocEvent>((event, emit) async {
      List<ProductsModel> jeweleryData = await _productsRepo.getJeweleries();
      emit(JeweleryBlocLoadedState(jeweleryData: jeweleryData));
    });

    add(JeweleryInitialEvent());
  }
}
