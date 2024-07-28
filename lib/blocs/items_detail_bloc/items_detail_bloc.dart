import 'package:bloc/bloc.dart';
import '../../models/items_model.dart';
import 'items_detail_event.dart';
import 'items_detail_state.dart';

class ItemsBloc extends Bloc<ItemsEvent, ItemsState> {
  ItemsBloc() : super(ItemsLoaded(items)) {
    on<OnItemUpdate>(_onUpdateItem);
  }

  void _onUpdateItem(OnItemUpdate event, Emitter<ItemsState> emit) {
    if (state is ItemsLoaded) {
      final List<ItemModel> updatedItems = (state as ItemsLoaded).items.map((item) {
        if ((state as ItemsLoaded).items.indexOf(item) == event.index) {
          return ItemModel(
            name: event.updatedAttributes['name'] ?? item.name,
            price: event.updatedAttributes['price'] ?? item.price,
            count: event.updatedAttributes['count'] ?? item.count,
            image: event.updatedAttributes['image'] ?? item.image,
            fullImage: event.updatedAttributes['fullImage'] ?? item.fullImage,
            description: event.updatedAttributes['description'] ?? item.description,
            showFullImage: event.updatedAttributes['showFullImage'] ?? item.showFullImage,
            isLiked: event.updatedAttributes['isLiked'] ?? item.isLiked,
            shortDescription: event.updatedAttributes['shortDescription'] ?? item.shortDescription,
            availableColors: event.updatedAttributes['availableColors'] ?? item.availableColors,
            selectedColor: event.updatedAttributes['selectedColor'] ?? item.selectedColor,
          );
        }
        return item;
      }).toList();

      emit(ItemsLoaded(updatedItems));
    }
  }
}
