import 'package:equatable/equatable.dart';
import '../../models/items_model.dart';

abstract class ItemsState extends Equatable {
  const ItemsState();

  @override
  List<Object> get props => [];
}

class ItemsLoading extends ItemsState {}

class ItemsLoaded extends ItemsState {
  final List<ItemModel> items;

  const ItemsLoaded(this.items);

  @override
  List<Object> get props => [items];
}

class ItemsError extends ItemsState {
  final String error;

  const ItemsError(this.error);

  @override
  List<Object> get props => [error];
}
