part of 'electronics_bloc_bloc.dart';

abstract class ElectronicsBlocState {}

final class ElectronicsBlocInitialState extends ElectronicsBlocState {}

final class ElectronicsBlocLoadedState extends ElectronicsBlocState {
  final List<ProductsModel> electronicsData;
  ElectronicsBlocLoadedState({required this.electronicsData});
}
