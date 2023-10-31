part of 'jewelery_bloc_bloc.dart';

abstract class JeweleryBlocState {}

final class JeweleryBlocInitialState extends JeweleryBlocState {}

final class JeweleryBlocLoadedState extends JeweleryBlocState {
  final List<ProductsModel> jeweleryData;
  JeweleryBlocLoadedState({required this.jeweleryData});
}
