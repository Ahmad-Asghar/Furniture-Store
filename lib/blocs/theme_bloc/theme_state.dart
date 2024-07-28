import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class ThemeState extends Equatable {
  const ThemeState();

  ThemeData get themeData;

  @override
  List<Object> get props => [themeData];
}

class LightThemeState extends ThemeState {
  @override
  final ThemeData themeData;

  const LightThemeState(this.themeData);
}

class DarkThemeState extends ThemeState {
  @override
  final ThemeData themeData;

  const DarkThemeState(this.themeData);
}
