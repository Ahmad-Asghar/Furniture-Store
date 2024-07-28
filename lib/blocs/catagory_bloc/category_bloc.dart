import 'package:bloc/bloc.dart';
import 'category_event.dart';
import 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(CategorySelected(0)) {
    on<SelectCategory>((event, emit) {
      emit(CategorySelected(event.category));
    });
  }
}
