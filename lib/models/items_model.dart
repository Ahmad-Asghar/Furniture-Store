import 'package:flutter/material.dart';

class ItemModel {
  final String name;
  final double price;
  final int count;
  final String image;
  final String fullImage;
  final String description;
  final String shortDescription;
  final bool showFullImage;
  final bool isLiked;
  final List<Color> availableColors;
  final int selectedColor;

  ItemModel({
    required this.name,
    required this.price,
    required this.count,
    required this.image,
    required this.fullImage,
    required this.description,
    required this.shortDescription,
    required this.showFullImage,
    required this.isLiked,
    required this.availableColors,
    required this.selectedColor
  });

  // Optionally, you might want to add a method for copying with updated fields
  ItemModel copyWith({
    String? name,
    double? price,
    int? count,
    String? image,
    String? fullImage,
    String? description,
    String? shortDescription,
    bool? showFullImage,
    bool? isLiked,
    List<Color>? availableColors,
    int? selectedColor,
  }) {
    return ItemModel(
      name: name ?? this.name,
      price: price ?? this.price,
      count: count ?? this.count,
      image: image ?? this.image,
      fullImage: fullImage ?? this.fullImage,
      description: description ?? this.description,
      shortDescription: shortDescription ?? this.shortDescription,
      showFullImage: showFullImage ?? this.showFullImage,
      isLiked: isLiked ?? this.isLiked,
      availableColors: availableColors ?? this.availableColors,
      selectedColor:  selectedColor ?? this.selectedColor
    );
  }
}



final List<Color> availableColorsList = [
  Colors.blueGrey,
  Colors.black,
  Colors.brown,
];

final List<ItemModel> items = [
  ItemModel(
    name: 'Round Sofa Chair',
    price: 110,
    count: 1,
    image: 'assets/images/png/1.png',
    description: 'A comfortable chair with a soft cushion, perfect for relaxing in your living room or office.',
    fullImage: 'assets/images/png/full1.png',
    showFullImage: false,
    isLiked: false,
    shortDescription: 'Comfortable soft cushion chair',
    availableColors: availableColorsList,
    selectedColor: 0,
  ),
  ItemModel(
    name: 'Comfy Sofa Chair',
    price: 90,
    count: 1,
    image: 'assets/images/png/2.png',
    description: 'A sleek and modern desk lamp that provides ample lighting for reading or working late hours.',
    fullImage: 'assets/images/png/full2.jpeg',
    showFullImage: false,
    isLiked: false,
    shortDescription: 'Sleek modern chair',
    availableColors: availableColorsList,
    selectedColor: 0,
  ),
  ItemModel(
    name: 'Ergonomic Dining Chair',
    price: 150,
    count: 1,
    image: 'assets/images/png/3.png',
    description: 'An ergonomic chair designed for comfort and support, ideal for long hours at the office.',
    fullImage: 'assets/images/png/full3.jpeg',
    showFullImage: false,
    isLiked: false,
    shortDescription: 'Ergonomic comfort support chair',
    availableColors: availableColorsList,
    selectedColor: 0,
  ),
  ItemModel(
    name: 'Aesthetic Office Chair',
    price: 80,
    count: 1,
    image: 'assets/images/png/4.png',
    description: 'A stylish wooden coffee table that adds a touch of elegance to any living space.',
    fullImage: 'assets/images/png/full4.jpg',
    showFullImage: false,
    isLiked: false,
    shortDescription: 'Stylish wooden coffee table',
    availableColors: availableColorsList,
    selectedColor: 0,
  ),
  ItemModel(
    name: 'Metal Lawn Chair',
    price: 200,
    count: 1,
    image: 'assets/images/png/5.png',
    description: 'A luxurious leather recliner that offers unmatched comfort and relaxation after a long day.',
    fullImage: 'assets/images/png/full5.jpeg',
    showFullImage: false,
    isLiked: false,
    shortDescription: 'Luxurious comfortable leather recliner',
    availableColors: availableColorsList,
    selectedColor: 0,
  ),
  ItemModel(
    name: 'Leather Lounge Sofa',
    price: 270,
    count: 1,
    image: 'assets/images/png/6.png',
    description: 'A spacious bookshelf that provides ample storage for books, decor, and other essentials.',
    fullImage: 'assets/images/png/full6.png',
    showFullImage: false,
    isLiked: false,
    shortDescription: 'Spacious bookshelf ample storage',
    availableColors: availableColorsList,
    selectedColor: 0,
  ),
  ItemModel(
    name: 'Decorative Sofa Bright',
    price: 280,
    count: 1,
    image: 'assets/images/png/7.png',
    description: 'A decorative vase that enhances the beauty of your home with its unique design and vibrant colors.',
    fullImage: 'assets/images/png/full7.png',
    showFullImage: false,
    isLiked: false,
    shortDescription: 'Decorative vase unique vibrant colors',
    availableColors: availableColorsList,
    selectedColor: 0,
  ),
];
