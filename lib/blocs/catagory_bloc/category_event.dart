import 'package:equatable/equatable.dart';

abstract class CategoryEvent extends Equatable{

  const CategoryEvent();

  @override
   List<Object> get props => [];

}

class SelectCategory extends CategoryEvent{

  final int category;

  const SelectCategory(this.category);

  @override
  List<Object> get props => [category];

}