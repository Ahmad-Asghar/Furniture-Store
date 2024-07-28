
import 'package:equatable/equatable.dart';

abstract class ItemsEvent extends Equatable {
  const ItemsEvent();
}

class OnItemUpdate extends ItemsEvent {
  final int index;
  final Map<String, dynamic> updatedAttributes;

  const OnItemUpdate(this.index, this.updatedAttributes);

  @override
  List<Object> get props => [index, updatedAttributes];
}


